# Enums en python


## Enums

Les énumérations (Enums) en Python sont utilisées pour créer des ensembles de constantes nommées. Elles améliorent la lisibilité et la maintenabilité du code.

### Exemple d'enum

```python
from enum import Enum, auto

class Couleur(Enum):
    ROUGE = auto()
    VERT = auto()
    BLEU = auto()

class Forme(Enum):
    CERCLE = 1
    CARRE = 2
    TRIANGLE = 3

def dessiner(forme: Forme, couleur: Couleur):
    print(f"Dessin d'un {forme.name} de couleur {couleur.name}")

dessiner(Forme.CERCLE, Couleur.ROUGE)  # Dessin d'un CERCLE de couleur ROUGE
```

Les enums peuvent utiliser `auto()` pour générer automatiquement des valeurs, ou des valeurs spécifiques peuvent être assignées.

---
Python offre plusieurs types d'énumérations, chacun ayant ses propres caractéristiques et cas d'utilisation. Voici une explication des principaux types d'enums avec des exemples :

## Enum de base

L'Enum de base est la classe fondamentale pour créer des énumérations en Python.

```python
from enum import Enum

class Carburant(Enum):
    ESSENCE = 1
    DIESEL = 2
    GPL = 3
    ELECTRIQUE = 4

print(Carburant.ESSENCE)  # Carburant.ESSENCE
print(Carburant.ESSENCE.value)  # 1
```


## Enum avec auto()

La fonction auto() permet d'assigner automatiquement des valeurs aux membres de l'énumération.

```python
from enum import Enum, auto

class Couleur(Enum):
    ROUGE = auto()
    VERT = auto()
    BLEU = auto()

print(list(Couleur))  # [<Couleur.ROUGE: 1>, <Couleur.VERT: 2>, <Couleur.BLEU: 3>]
```

---


## IntEnum

IntEnum est une sous-classe d'Enum où les membres sont également des entiers.

```python
from enum import IntEnum

class JoursSemaine(IntEnum):
    LUNDI = 1
    MARDI = 2
    MERCREDI = 3
    JEUDI = 4
    VENDREDI = 5
    SAMEDI = 6
    DIMANCHE = 7

print(JoursSemaine.LUNDI < JoursSemaine.MARDI)  # True
```

Voici un exemple clair avec un **IntEnum** représentant des **codes HTTP**, parfait pour montrer pourquoi on veut des constantes symboliques *qui restent des entiers*.

### Exemple : Codes HTTP avec IntEnum

```python
from enum import IntEnum

class HttpStatus(IntEnum):
    OK = 200
    CREATED = 201
    BAD_REQUEST = 400
    NOT_FOUND = 404
    INTERNAL_ERROR = 500
```

### Utilisation **IntEnum**

#### Comparaison directe avec des entiers  
Les frameworks web renvoient souvent **des entiers**, donc l’égalité fonctionne naturellement :

```python
if response.status_code == HttpStatus.NOT_FOUND:
    print("Page non trouvée")
```

(Si on avait utilisé `Enum`, la comparaison avec `404` ne fonctionnerait pas.)

#### Utilisation dans des opérations numériques  
Comme les membres sont de vrais `int`, on peut faire :

```python
HttpStatus.OK + 1   # renvoie 201
```

#### Conversion automatique  
On peut aussi faire :

```python
HttpStatus(404)   # renvoie HttpStatus.NOT_FOUND
```

### Résumé
`IntEnum` est idéal pour des constantes **numériques** permettant de :

- garder les avantages des enums (lisibilité, sécurité, auto‑complétion),  
- tout en restant compatible avec les valeurs entières externes (protocoles, API, codes d’erreur).

---

## StrEnum

StrEnum est une sous-classe d'Enum où les membres sont des chaînes de caractères.

```python
from enum import StrEnum

class TypeService(StrEnum):
    STANDARD = "standard"
    PREMIUM = "premium"
    VIP = "vip"

print(TypeService.STANDARD.upper())  # STANDARD
```

---


## Flag

Flag est utilisé pour créer des énumérations qui peuvent être combinées avec des opérations bit à bit.

```python
from enum import Flag, auto

class Services(Flag):
    AUCUN = 0
    LAVAGE = auto()
    VIDANGE = auto()
    PNEUS = auto()

services_demandes = Services.LAVAGE | Services.VIDANGE
print(Services.LAVAGE in services_demandes)  # True
```

---


## IntFlag

IntFlag combine les fonctionnalités de IntEnum et Flag.

```python
from enum import IntFlag

class Permissions(IntFlag):
    LIRE = 1
    ECRIRE = 2
    EXECUTER = 4

user_permissions = Permissions.LIRE | Permissions.ECRIRE
print(user_permissions)  # Permissions.LIRE|ECRIRE
```


Ces différents types d'énumérations offrent une grande flexibilité pour représenter des ensembles de constantes nommées dans votre code Python, améliorant ainsi la lisibilité et la maintenabilité.
