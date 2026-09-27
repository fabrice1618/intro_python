# Introduction au langage Python

## Sommaire

- Introduction
- Installation : VS Code et venv
- Documentation
- [Progression pédagogique](progression_pedagogique1.md) : parties 1 à 3 en 3 séances, puis une séance de test
- Partie 1 : [Partie 1](intro-python-part1.ipynb)
    - Utiliser un notebook dans VS Code
    - Les noms de variable
    - Lire un message d'erreur
    - Mots clés réservés du langage
    - Les commentaires
    - Indentation
    - Instructions multi-ligne
    - Plusieurs instructions par ligne
    - Les types simples (scalaires)
      - Les entiers (int)
      - Les nombres à virgule flottante (float)
      - Les nombres complexes (complex)
      - Les fractions
      - Les booléens (bool)
      - La valeur None (NoneType)
      - Conversion de type
      - Chaînes de caractères (string)
      - Extraire une partie d'un texte
      - Méthodes des chaînes de caractères
      - Mise en forme de chaînes de caractères
        - la fonction print()
        - dans le style C
        - la méthode format
        - les f-strings, formatted string literals
        - formater les valeurs dans une f-string
    - Les opérateurs
      - Les opérateurs arithmétiques
        - affectation composée
      - Les opérateurs sur les chaines de caractère
      - Opérateurs de comparaison
      - Opérateurs logiques
        - évaluation en court-circuit
      - Opérateurs binaires (bit à bit)
      - Précédence des opérateurs
    - La bibliothèque standard et ses modules
      - Utilisation des modules
      - Connaitre le contenu d'un module et consulter l'aide
      - exemple d'utilisation du module math
      - exemple d'utilisation du module random
      - Quelques modules utiles
    - Pour s'entraîner
- Partie 2 : [Partie 2](intro-python-part2.ipynb)
  - A - Conditionnelle: if
    - instruction match
  - B - Itératif : while
    - break, continue et saisie contrôlée
  - C - Itératif : for
    - quelle boucle choisir, parcours d'une chaîne, codes des caractères
    - compteur, accumulateur, maximum et minimum, recherche, boucles imbriquées
  - D - Les fonctions
    - print ou return, sortir avec return, portée des variables, tester avec assert
  - Pour s'entraîner
- Partie 3 : [Partie 3](intro-python-part3.ipynb)
  - A - Listes
    - indices, tableau à deux dimensions, tri, copie, modification, fonctions utiles
    - parcours, maximum et sa position, listes en compréhension, split et join
  - B - Tuples
    - échange de valeurs, liste de tuples, élément associé au maximum, zip, tri selon un critère
  - C - Dictionnaires
    - get, keys, values et items, clé de la plus grande valeur, liste de dictionnaires
  - D - Ensembles (set)
  - E - Exemple récapitulatif : tableau de bord des chambres froides
  - Erreurs fréquentes, quel conteneur choisir
  - Pour s'entraîner
- Partie 4 - CSV / SQL: [Partie 4](intro-python-part4-csv_sql.ipynb)
  - Les fichiers CSV
    - Lecture de fichier CSV
    - écriture dans un fichier CSV
  - Les bases de données SQL
    - Création d'une base de données
    - Créer une table dans la base de données
    - Ajouter des lignes dans une table
    - Lecture d'une table
    - Effacer un enregistrement
- Partie 5 - Bonus: [Partie 5](intro-python-part5-bonus.ipynb)
  - A - Classes
  - B - Exceptions
- Partie 6 - Excel : [Partie 6](intro-python-part6-excel.ipynb)
  - Lecture et écriture de fichiers Excel avec pandas
- Exercices : [exercices](exercices/), avec leurs corrections dans les notebooks `*_correction.ipynb`
- Évaluation : [test sur les parties 1 à 3](evaluation/test_python_parties1-3.ipynb)

## Introduction

- Langage interprété
- programmation impérative structurée, fonctionnelle et orientée objet
- typage dynamique fort
- syntaxe simple
- gestion automatique de la mémoire par ramasse-miettes
- système de gestion d'exceptions
- extension: .py
- licence libre
- productivité des programmeurs grâce à des outils de haut niveau
- micro-python pour les micro-contrôleurs

Le langage Python peut être installé à partir de nombreuses distributions.
Liste de distributions python libres: <https://wiki.python.org/moin/PythonDistributions>

## Installation : VS Code et venv

Le cours utilise les notebooks Jupyter dans VS Code, avec un environnement virtuel Python (`venv/`) propre au dossier du cours.

Prérequis sous Linux : Python 3.10 ou plus récent, le paquet `python3-venv`, `git` et [VS Code](https://code.visualstudio.com/).

```bash
git clone https://github.com/fabrice1618/intro_python.git
cd intro_python
bash setup_venv.sh
code .
```

Le script [setup_venv.sh](setup_venv.sh) crée l'environnement `venv/` (ou réutilise celui qui existe), installe les paquets de [requirements.txt](requirements.txt), déclare le noyau Jupyter « Python (intro_python) » et installe les extensions Python et Jupyter de VS Code. L'option `--force` recrée l'environnement.

Dans VS Code, ouvrir un notebook puis choisir le noyau en haut à droite : **Select Kernel > Python Environments > venv**.

## Documentation python / liens utiles

- Page Python officielle: <http://www.python.org>
- The Python Language Reference: <https://docs.python.org/3/reference/index.html>
- The Python Standard Library: <https://docs.python.org/3/library/index.html>
- Recommandations de style d'écriture: <https://www.python.org/dev/peps/pep-0008/>
- Un livre gratuit sur Python (en anglais): <http://www.greenteapress.com/thinkpython/> ; copie de la 2ᵉ édition dans [livres](livres/livre_thinkpython2.pdf)
