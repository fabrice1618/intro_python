#!/usr/bin/env bash
# Prépare l'environnement Python du cours pour utiliser les notebooks Jupyter dans VS Code.
#
# Usage : bash setup_venv.sh [--force]
#   --force : supprime puis recrée l'environnement virtuel venv/
#
# Étapes : vérifier Python, créer (ou réutiliser) venv/, installer requirements.txt,
# déclarer le noyau Jupyter, installer les extensions VS Code si la commande code existe.

set -euo pipefail

VENV_DIR="venv"
KERNEL_NAME="intro-python"
KERNEL_LABEL="Python (intro_python)"
EXTENSIONS=(ms-python.python ms-toolsai.jupyter)

cd "$(dirname "$(readlink -f "$0")")"

info()      { printf '\033[1;34m==>\033[0m %s\n' "$*"; }
ok()        { printf '\033[1;32m ok\033[0m %s\n' "$*"; }
attention() { printf '\033[1;33m !!\033[0m %s\n' "$*"; }
erreur()    { printf '\033[1;31merreur :\033[0m %s\n' "$*" >&2; exit 1; }

force=false
case "${1:-}" in
    "") ;;
    --force) force=true ;;
    -h|--help) sed -n '2,8p' "$0" | sed 's/^# \{0,1\}//'; exit 0 ;;
    *) erreur "option inconnue : $1 (usage : bash setup_venv.sh [--force])" ;;
esac

# 1. Python 3.10 minimum (instruction match)
info "Vérification de Python"
command -v python3 >/dev/null || erreur "python3 introuvable : sudo apt install python3"
python3 -c "import sys; sys.exit(sys.version_info < (3, 10))" \
    || erreur "Python 3.10 minimum requis, version installée : $(python3 --version)"
ok "$(python3 --version)"

# 2. Module venv (paquet séparé sur Debian et Ubuntu)
python3 -c "import venv, ensurepip" 2>/dev/null \
    || erreur "module venv indisponible : sudo apt install python3-venv"

# 3. Environnement virtuel
if $force && [ -e "$VENV_DIR" ]; then
    info "Suppression de l'environnement existant $VENV_DIR/"
    rm -rf "$VENV_DIR"
fi
if [ -x "$VENV_DIR/bin/python" ] && "$VENV_DIR/bin/python" -c "import sys" 2>/dev/null; then
    ok "environnement existant réutilisé : $VENV_DIR/ (bash setup_venv.sh --force pour le recréer)"
else
    if [ -e "$VENV_DIR" ]; then
        erreur "$VENV_DIR/ existe mais ne fonctionne pas : relancer avec --force pour le recréer"
    fi
    info "Création de l'environnement virtuel $VENV_DIR/"
    python3 -m venv "$VENV_DIR"
    ok "environnement créé"
fi
PY="$VENV_DIR/bin/python"

# 4. Paquets
info "Installation des paquets de requirements.txt"
"$PY" -m pip install --quiet --disable-pip-version-check -r requirements.txt
ok "paquets installés"

# 5. Noyau Jupyter
info "Déclaration du noyau Jupyter « $KERNEL_LABEL »"
"$PY" -m ipykernel install --user --name "$KERNEL_NAME" --display-name "$KERNEL_LABEL" >/dev/null
ok "noyau $KERNEL_NAME déclaré"

# 6. Extensions VS Code
if command -v code >/dev/null; then
    info "Extensions VS Code"
    installees=$(code --list-extensions 2>/dev/null || true)
    for ext in "${EXTENSIONS[@]}"; do
        if grep -qix "$ext" <<<"$installees"; then
            ok "$ext déjà installée"
        elif code --install-extension "$ext" >/dev/null 2>&1; then
            ok "$ext installée"
        else
            attention "échec de l'installation de $ext : l'installer depuis VS Code (Extensions)"
        fi
    done
else
    attention "commande code introuvable : installer VS Code puis les extensions ${EXTENSIONS[*]}"
fi

# 7. Vérification finale
"$PY" -c "import ipykernel" || erreur "ipykernel n'est pas importable dans $VENV_DIR/"
ok "environnement prêt : $("$PY" --version)"

cat <<EOF

Pour commencer :
  1. ouvrir le dossier du cours dans VS Code : code .
  2. ouvrir un notebook, par exemple intro-python-part1.ipynb ;
  3. en haut à droite, Select Kernel > Python Environments > venv
     (ou Select Kernel > Jupyter Kernel > $KERNEL_LABEL) ;
  4. exécuter la première cellule de code avec Maj+Entrée.
EOF
