# Progression pédagogique 1 : les bases de Python

Progression en **3 séances** pour découvrir le langage Python dans des notebooks Jupyter ouverts dans VS Code, suivies d'une **4ᵉ séance de test**. Chaque séance suit un notebook du cours : [partie 1](intro-python-part1.ipynb) (types, chaînes, opérateurs, modules), [partie 2](intro-python-part2.ipynb) (conditions, boucles, fonctions) et [partie 3](intro-python-part3.ipynb) (listes, tuples, dictionnaires). Les notions sont démontrées en exécutant les cellules du notebook, puis pratiquées avec les notebooks d'[exercices](exercices/). La [partie 4](intro-python-part4-csv_sql.ipynb) et les suivantes ne sont pas au programme : elles prolongent cette progression.

**Sommaire** : [En bref](#en-bref) · [Objectifs](#objectifs) · [Vue d'ensemble](#vue-densemble) · [Séance 1](#séance-1--types-chaînes-et-opérateurs) · [Séance 2](#séance-2--conditions-boucles-et-fonctions) · [Séance 3](#séance-3--listes-tuples-et-dictionnaires) · [Séance 4](#séance-4--test) · [Correspondances](#correspondances-entre-les-supports) · [Travail personnel](#travail-personnel) · [Préparer les séances](#préparer-les-séances) · [Suivi de la progression](#suivi-de-la-progression)

---

## En bref

- **Public** : débutants en Python ; une initiation à l'algorithmique est un plus, pas un prérequis
- **Durée** : 4 séances de 3 heures 30, soit 14 heures : 3 séances de cours et d'exercices, puis 1 séance de test ; les durées indiquées sont à ajuster si les séances sont plus courtes
- **Matériel** : pour chaque étudiant, un poste Linux avec Python 3.10 ou plus récent, `git` et VS Code ; l'environnement se prépare avec `bash setup_venv.sh` (voir [Installation](README.md#installation--vs-code-et-venv))
- **Supports** :
  - notebooks du cours : [partie 1](intro-python-part1.ipynb), [partie 2](intro-python-part2.ipynb), [partie 3](intro-python-part3.ipynb) ; chacun se termine par une section « Pour s'entraîner »
  - exercices : [exercices01](exercices/exercices01.ipynb) et [exercices02](exercices/exercices02.ipynb), avec en tête un tableau exercice → partie → séance → difficulté (★ à ★★★) ; [pim pam poum](exercices/exercice_pimpampoum.ipynb), [exo capteur](exercices/exo_capteur.ipynb), [exercice tableau](exercices/exercice_tableau.ipynb), [bac belge](exercices/bac%20belge.ipynb) ; corrections dans les notebooks `*_correction.ipynb`
  - livre [Think Python, 2ᵉ édition](livres/livre_thinkpython2.pdf) (en anglais) : lectures complémentaires
  - [sujet du test](evaluation/test_python_parties1-3.ipynb) ; son corrigé, `evaluation/test_python_parties1-3_correction.ipynb`, est exclu du dépôt
- **Hors programme** : [partie 4](intro-python-part4-csv_sql.ipynb) (CSV et SQL), [partie 5](intro-python-part5-bonus.ipynb) (classes et exceptions), [partie 6](intro-python-part6-excel.ipynb) (Excel avec pandas), dossiers [avance](avance/), [API](API/) et [traiteur](traiteur/)

---

## Objectifs

À la fin des trois séances, l'étudiant sait :

- exécuter un notebook dans VS Code, dans l'ordre, et redémarrer le noyau en cas de blocage ;
- lire un message d'erreur pour trouver la ligne fautive et la cause ;
- manipuler les types simples (`int`, `float`, `bool`, `str`) et convertir une valeur d'un type à l'autre ;
- extraire une partie d'une chaîne, la transformer avec ses méthodes et mettre en forme un affichage avec une f-string ;
- écrire des expressions avec les opérateurs arithmétiques, de comparaison et logiques ;
- importer un module de la bibliothèque standard et consulter son aide ;
- faire un choix avec `if` / `elif` / `else` ou `match` ;
- répéter un traitement avec `while` ou `for`, contrôler une saisie, utiliser un compteur ou un accumulateur ;
- découper un programme en fonctions qui reçoivent des paramètres et renvoient un résultat, et les tester avec `assert` ;
- ranger des données dans une liste, un tuple ou un dictionnaire, les parcourir, les trier et les regrouper ;
- représenter un tableau de données par une liste de dictionnaires et en tirer un tableau de bord.

La séance 4 évalue ces objectifs par un test individuel sur machine.

---

## Vue d'ensemble

| Séance | Thème | Notebook | Exercices en séance |
|---|---|---|---|
| 1 | Types, chaînes et opérateurs | [partie 1](intro-python-part1.ipynb) | exercices01 : Swap, Permutation circulaire, Belle marquise, Calcul TVA ; exercices02 : Initiales, Nettoyer une saisie, Conversion d'une durée |
| 2 | Conditions, boucles et fonctions | [partie 2](intro-python-part2.ipynb) | exercices01 : Valeur absolue, Poussin, Eau, Distributeur de pièces, La suite de fibonacci, Conversion Fahrenheit / Celsius ; pim pam poum ; exercices02 : Triangle d'étoiles, Moyenne des saisies, Année bissextile |
| 3 | Listes, tuples et dictionnaires | [partie 3](intro-python-part3.ipynb) | exo capteur, exercice tableau ; exercices02 : Palindromes et anagrammes, Inventaire, Carnet de notes |
| 4 | Test | [sujet](evaluation/test_python_parties1-3.ipynb) | test individuel sur les parties 1 à 3 |

> **Fil rouge** : les données de mesures reviennent d'une séance à l'autre : la saisie contrôlée d'un numéro de chambre froide (séance 2), le découpage d'une ligne de relevé avec `split` puis la liste de dictionnaires (séance 3), enfin le tableau de bord des stations météo (test). Elles préparent l'[exercice traiteur](traiteur/programme_traiteur.ipynb), qui lit un vrai fichier CSV après la partie 4.

---

## Séance 1 : types, chaînes et opérateurs

**Objectif** : prendre en main les notebooks dans VS Code, manipuler les types simples et les chaînes de caractères, écrire des expressions.

| Durée | Activité | Supports |
|---|---|---|
| 15 min | Accueil et objectifs. Présentation de Python : langage interprété, typage dynamique fort, usages | [README](README.md#introduction) |
| 25 min | Installation : `git clone`, `bash setup_venv.sh`, ouverture du dossier dans VS Code, choix du noyau `venv`. Prise en main : exécuter une cellule, ordre d'exécution, redémarrer le noyau, saisie avec `input()` | [Installation](README.md#installation--vs-code-et-venv) ; partie 1, « Utiliser un notebook dans VS Code » |
| 35 min | Structure du langage : noms de variables, mots clés, commentaires, indentation. Lire un message d'erreur. Types numériques : `int`, `float` et ses approximations, conversions de type | Partie 1, de « Structure du langage python » à « Conversion de type » |
| 10 min | Pause | |
| 40 min | Chaînes de caractères : indices et slicing (exemple « cfilorux »), méthodes des chaînes, immuabilité. Mise en forme : `print()`, f-strings et leurs formats ; le style C et `format` sont seulement à savoir lire | Partie 1, de « Chaînes de caractères » à « Formater les valeurs dans une f-string » |
| 30 min | Opérateurs arithmétiques (division entière `//`, modulo `%`), opérateurs sur les chaînes, opérateurs logiques et de comparaison, piège de la comparaison de chaînes, précédence. Convertir la saisie de `input()` | Partie 1, « Les opérateurs » |
| 15 min | Bibliothèque standard : `import`, `dir()`, `help()`, modules `math` et `random` | Partie 1, « La bibliothèque standard et ses modules » |
| 30 min | Exercices : Swap, Permutation circulaire, Belle marquise, Calcul TVA ; pour les plus rapides : Initiales, Nettoyer une saisie, Conversion d'une durée | [exercices01](exercices/exercices01.ipynb) ; [exercices02](exercices/exercices02.ipynb), partie 1 |
| 10 min | Bilan : les types, la conversion de `input()`, les f-strings ; travail personnel | |

> **Remarque** : les nombres complexes, les fractions, les écritures binaire, octale et hexadécimale ainsi que la table complète de précédence sont à survoler : ils ne sont pas réutilisés dans la suite. Si l'installation prend du retard sur un poste, l'étudiant suit sur le poste d'un voisin et termine l'installation pendant la pause.

---

## Séance 2 : conditions, boucles et fonctions

**Objectif** : faire des choix, répéter un traitement et découper un programme en fonctions.

| Durée | Activité | Supports |
|---|---|---|
| 10 min | Rappel de la séance 1 ; questions sur les exercices | |
| 30 min | `if` / `elif` / `else`, conditions composées, condition rangée dans une variable booléenne ; `match` et le cas par défaut `case _` | Partie 2, « A - Conditionnelle: if » |
| 35 min | Exercices : Valeur absolue, Poussin, Eau ; terminer Calcul TVA si besoin | [exercices01](exercices/exercices01.ipynb) |
| 10 min | Pause | |
| 30 min | `while` (mot de passe, plus ou moins), `break`, `continue` et saisie contrôlée ; `for` et `range`, comparaison avec `while`, `enumerate`, parcours d'une chaîne ; compteur, accumulateur, boucles imbriquées | Partie 2, « B - Itératif : while » et « C - Itératif : for » |
| 35 min | Exercices : pim pam poum, Distributeur de pièces, La suite de fibonacci ; pour les plus rapides : Triangle d'étoiles, Moyenne des saisies | [pim pam poum](exercices/exercice_pimpampoum.ipynb) ; [exercices01](exercices/exercices01.ipynb) ; [exercices02](exercices/exercices02.ipynb), partie 2 |
| 25 min | Fonctions : `def`, docstring, `return` et plusieurs valeurs renvoyées, `print` ou `return`, paramètres par défaut, portée des variables, tests avec `assert`. Exemple récapitulatif : le chiffre de César | Partie 2, « D - Les fonctions » et « E - Exemple récapitulatif » |
| 25 min | Exercices : Conversion Fahrenheit / Celsius, Année bissextile (tests fournis) ; réécrire pim pam poum avec une fonction | [exercices01](exercices/exercices01.ipynb) ; [exercices02](exercices/exercices02.ipynb) ; [correction de pim pam poum](exercices/exercice_pimpampoum_correction.ipynb), fonction `divisiblepar` |
| 10 min | Bilan : quelle boucle pour quel besoin ; une fonction renvoie son résultat, le programme principal l'affiche | |

> **Remarque** : Compteur de mots, Code cesar et Mot de passe (exercices01) parcourent une chaîne caractère par caractère : les proposer aux plus rapides ou en travail personnel. Le Menu (exercices02) réunit `while`, `match` et saisies : un bon exercice de révision avant le test.

---

## Séance 3 : listes, tuples et dictionnaires

**Objectif** : ranger des données dans des conteneurs, les parcourir, les trier et les regrouper.

| Durée | Activité | Supports |
|---|---|---|
| 10 min | Rappel de la séance 2 ; questions sur les exercices | |
| 40 min | Listes : création, indices et slicing, listes de listes, `range`, tri avec `sort` et `sorted`, copie ou alias, ajout, insertion et suppression, fonctions utiles (`len`, `sum`, `min`, `max`, `in`), parcours, listes en compréhension ; des chaînes aux listes avec `split` et `join` | Partie 3, « A - Listes » |
| 30 min | Exercices : exo capteur, puis Palindromes et anagrammes | [exo capteur](exercices/exo_capteur.ipynb) ; [exercices02](exercices/exercices02.ipynb), partie 3 |
| 10 min | Pause | |
| 15 min | Tuples : immuabilité, dépilage, liste de tuples ; lien avec les fonctions qui renvoient plusieurs valeurs (partie 2) | Partie 3, « B - Tuples » |
| 25 min | Dictionnaires : création, accès, `in`, `del`, `get`, parcours avec `items()`, liste de dictionnaires. Exemples commentés : compter les occurrences, codage et décodage | Partie 3, « C - Dictionnaires » |
| 45 min | Exercices : Inventaire, exercice tableau ; pour les plus rapides : Carnet de notes | [exercices02](exercices/exercices02.ipynb), partie 3 ; [exercice tableau](exercices/exercice_tableau.ipynb) |
| 25 min | Préparer le test : consignes, barème et format du rendu, projetés depuis la première cellule du sujet. Révision au choix : terminer un exercice ★★ de chaque partie, ou refaire l'exemple des occurrences sans regarder la solution | Première cellule du [sujet](evaluation/test_python_parties1-3.ipynb) ; sections « Pour s'entraîner » des trois parties |
| 10 min | Bilan : quel conteneur pour quel besoin (liste ordonnée et modifiable, tuple figé, dictionnaire consulté par clé) | |

> **Remarque** : dans l'exercice tableau, une note vaut `'Absent'` : il faut l'écarter avant de calculer. Laisser les étudiants rencontrer l'erreur `TypeError`, puis lire le message ensemble.

---

## Séance 4 : test

**Objectif** : évaluer individuellement les notions des parties 1 à 3.

| Durée | Activité | Supports |
|---|---|---|
| 15 min | Accueil, rappel des consignes et du barème. Chacun récupère le sujet, l'ouvre dans VS Code, choisit le noyau `venv` et exécute la cellule des données | [Sujet](evaluation/test_python_parties1-3.ipynb) |
| 150 min | Test individuel : 6 exercices et un bonus sur les relevés d'un réseau de stations météo. Cours, exercices et documentation Python autorisés ; IA générative et messagerie interdites | [Sujet](evaluation/test_python_parties1-3.ipynb) |
| 10 min | Rendu du notebook renommé `NOM_Prenom.ipynb` ; pause | |
| 35 min | Correction commentée, en insistant sur les exercices 4 à 6 et les erreurs fréquentes ; présentation de la suite du cours (parties 4 à 6) | Corrigé `evaluation/test_python_parties1-3_correction.ipynb` (hors dépôt) |

| Exercice | Notions | Points |
|---|---|---|
| 1. Chaînes et nombres | slicing, conversion, f-string | 2 |
| 2. Conditions | `if` / `elif` / `else` | 3 |
| 3. Boucles | saisie contrôlée, compteur, accumulateur | 3 |
| 4. Fonctions | `def`, `return`, paramètres, tests `assert` fournis | 4 |
| 5. Listes et tuples | construction, tri, parcours, `split` | 4 |
| 6. Dictionnaires | regroupement, tableau de bord | 4 |
| Bonus | comptage avec un dictionnaire | +1 |

> **Remarque** : les exercices 1 à 3 sont indépendants et ne demandent que les parties 1 et 2. Les exercices 5 et 6 réutilisent les fonctions de l'exercice 4 ; le sujet autorise à les remplacer par `sum`, `len`, `min` et `max` en cas d'échec, pour qu'un blocage à l'exercice 4 ne coûte que ses propres points. Les notes de correction en tête du corrigé listent les points de vigilance.

---

## Correspondances entre les supports

Pour chaque notion, la section du notebook, les exercices et le chapitre de *Think Python* à consulter :

| Notion | Notebook, section | Exercices | Think Python |
|---|---|---|---|
| Notebook, variables, erreurs | Partie 1 : Utiliser un notebook, Structure du langage, Lire un message d'erreur | Swap, Permutation circulaire | 1, 2 |
| Types numériques, conversions | Partie 1 : Les types simples | Calcul TVA, Conversion d'une durée | 2 |
| Chaînes, méthodes, f-strings | Partie 1 : Chaînes de caractères | Belle marquise, Initiales, Nettoyer une saisie, Ticket de caisse | 8 |
| Opérateurs, modules | Partie 1 : Les opérateurs, La bibliothèque standard | Calcul TVA | 2, 3 |
| Conditions, `match` | Partie 2 : A | Valeur absolue, Poussin, Eau | 5 |
| Boucles `while` et `for` | Partie 2 : B et C | pim pam poum, Distributeur de pièces, La suite de fibonacci, Compteur de mots, Code cesar, Mot de passe, Triangle d'étoiles, Moyenne des saisies, Menu | 7 |
| Fonctions, `assert` | Partie 2 : D et E | Conversion Fahrenheit / Celsius, Année bissextile | 3, 6 |
| Listes, `split` et `join` | Partie 3 : A | exo capteur, bac belge, Palindromes et anagrammes | 10 |
| Tuples | Partie 3 : B | test, exercice 5.b | 12 |
| Dictionnaires, liste de dictionnaires | Partie 3 : C | exercice tableau, Inventaire, Carnet de notes | 11 |

---

## Travail personnel

| Après la séance | À faire |
|---|---|
| 1 | Terminer les exercices de la partie 1 dans [exercices01](exercices/exercices01.ipynb) et [exercices02](exercices/exercices02.ipynb), Ticket de caisse compris ; *Think Python*, chapitres 1 et 2 |
| 2 | Terminer les exercices de la partie 2 : Compteur de mots, Code cesar, Menu ; Mot de passe pour les plus à l'aise ; *Think Python*, chapitres 5 et 7 |
| 3 | Terminer Inventaire et Carnet de notes ; refaire sans regarder la solution les exemples « occurrences » et « codage et décodage » de la partie 3 ; réviser avec les sections « Pour s'entraîner » des trois parties ; *Think Python*, chapitres 10 à 12 |

---

## Préparer les séances

- Vérifier que les postes disposent de Python 3.10 ou plus récent (`python3 --version`), du paquet `python3-venv`, de `git` et de VS Code. Lancer une fois `bash setup_venv.sh` sur un poste de test : le script installe `ipykernel` dans `venv/`, déclare le noyau « Python (intro_python) » et installe les extensions Python et Jupyter de VS Code. Il faut un accès à Internet pour installer les paquets.
- Les notebooks utilisent `input()` : dans VS Code, la zone de saisie apparaît en haut de la fenêtre, ce qui surprend au début ; le montrer pendant la prise en main.
- Les notebooks du cours sont enregistrés avec leurs résultats, sauf les cellules ajoutées ou corrigées. **Restart** puis **Run All** régénère tous les résultats (répondre aux saisies demandées).
- Le sujet du test est versionné dans le dépôt : si les étudiants clonent le dépôt avant le test, ne publier le dossier [evaluation](evaluation/) qu'après le test, ou distribuer le sujet séparément. Le corrigé est exclu du dépôt par `.gitignore` : le conserver en local.
- Garder à portée de main les corrections : [exercices01_correction](exercices/exercices01_correction.ipynb), [exercices02_correction](exercices/exercices02_correction.ipynb), [exercice_pimpampoum_correction](exercices/exercice_pimpampoum_correction.ipynb), [exercice_tableau_correction](exercices/exercice_tableau_correction.ipynb).

---

## Suivi de la progression

| Fin de séance | Indicateur |
|---|---|
| 1 | le notebook de la partie 1 s'exécute dans VS Code avec le noyau `venv` ; le Calcul TVA lit des valeurs, les convertit et affiche le résultat avec une f-string |
| 2 | pim pam poum affiche la sortie attendue ; la fonction `est_bissextile` passe ses tests `assert` |
| 3 | exo capteur calcule la moyenne sans les valeurs extrêmes ; l'Inventaire affiche la valeur du stock |
| 4 | le notebook rendu s'exécute ; les tests `assert` de l'exercice 4 passent |

- Lire le message d'erreur est le premier réflexe à installer dès la séance 1 : demander à l'étudiant d'en lire la dernière ligne avant d'appeler à l'aide.
- Pour les étudiants les plus rapides : les exercices ★★★ (Mot de passe, Carnet de notes), puis la [partie 5](intro-python-part5-bonus.ipynb) (classes et exceptions).
- Pour les étudiants en retard : les exercices ★ de chaque partie suffisent pour suivre la séance suivante ; les ★★ se terminent en travail personnel.
