# Dataclasses

Les *dataclasses*, introduites en Python 3.7, simplifient grandement la création de classes destinées à stocker des données. Elles réduisent le code répétitif tout en offrant une syntaxe claire et expressive.

---

### Exemple de base

```python
from dataclasses import dataclass

@dataclass
class Etudiant:
    nom: str
    prenom: str
    age: int
    moyenne: float

jean = Etudiant(nom="Jean", prenom="Dupont", age=17, moyenne=14.5)
print(jean)  # Etudiant(nom='Jean', prenom='Dupont', age=17, moyenne=14.5)
```

Les dataclasses génèrent automatiquement :

- `__init__`
- `__repr__`
- `__eq__`

---

## Avantages

1. **Moins de code boilerplate**  
   Inutile d’écrire manuellement les méthodes de base.

2. **Lisibilité améliorée**  
   Une classe devient une simple structure de données organisée.

3. **Typage clair**  
   Les annotations renforcent la maintenabilité.

---

## Valeurs par défaut

```python
from dataclasses import dataclass

@dataclass
class Livre:
    titre: str
    auteur: str
    annee_publication: int = 2025
    nombre_pages: int = 200

livre_default = Livre("Python Avancé", "Jane Doe")
print(livre_default)
```

---

# Dataclasses composées

Voici un exemple complet utilisant plusieurs dataclasses imbriquées, incluant des validations avec `__post_init__`.

---

### Exemple complet

```python
from dataclasses import dataclass, field
from typing import List
from enum import Enum
from datetime import datetime

class TypeCarburant(Enum):
    ESSENCE = "Essence"
    DIESEL = "Diesel"
    GPL = "GPL"
    ELECTRIQUE = "Électrique"

@dataclass
class Geolocalisation:
    latitude: float
    longitude: float

    def __post_init__(self):
        if not (-90 <= self.latitude <= 90):
            raise ValueError("La latitude doit être comprise entre -90 et 90 degrés")
        if not (-180 <= self.longitude <= 180):
            raise ValueError("La longitude doit être comprise entre -180 et 180 degrés")

@dataclass
class Carburant:
    type: TypeCarburant
    prix: float
    date_maj: datetime = field(default_factory=datetime.now)

    def __post_init__(self):
        if self.prix <= 0:
            raise ValueError("Le prix du carburant doit être positif")

@dataclass
class StationService:
    nom: str
    adresse: str
    geolocalisation: Geolocalisation
    carburants: List[Carburant]

    def __post_init__(self):
        if not self.carburants:
            raise ValueError("Une station-service doit proposer au moins un carburant")

        types_carburants = {c.type for c in self.carburants}
        if len(types_carburants) != len(self.carburants):
            raise ValueError("Chaque type de carburant doit apparaître une seule fois")
```

---

## Exemple d'utilisation

```python
try:
    station = StationService(
        nom="Station Total",
        adresse="123 rue de la Pompe, 75016 Paris",
        geolocalisation=Geolocalisation(48.8566, 2.3522),
        carburants=[
            Carburant(TypeCarburant.ESSENCE, 1.85),
            Carburant(TypeCarburant.DIESEL, 1.75),
            Carburant(TypeCarburant.GPL, 0.95)
        ]
    )
    print(station)

except ValueError as e:
    print("Erreur de validation :", e)
```

---

## Validation avec `__post_init__`

La méthode `__post_init__` permet d'ajouter une logique exécutée juste après l'initialisation de l'objet.

```python
from dataclasses import dataclass

@dataclass
class Personne:
    age: int
    nom: str

    def __post_init__(self):
        if self.age < 0:
            raise ValueError("L'âge ne peut pas être négatif")
        if not self.nom.strip():
            raise ValueError("Le nom ne peut pas être vide")
```

Cette méthode est essentielle pour ajouter des validations *sans remplacer* le `__init__` généré automatiquement.

---

## Field : rôle et usages principaux

Le mot-clé `field` permet de configurer précisément le comportement d’un attribut d’une dataclass. Il s’utilise pour :

### 1. Définir des valeurs par défaut complexes  
Les valeurs mutables doivent être créées avec `default_factory`.

```python
from dataclasses import dataclass, field

@dataclass
class Panier:
    produits: list = field(default_factory=list)
```

### 2. Exclure un attribut du `__repr__`, `__eq__` ou de la comparaison

```python
@dataclass
class Utilisateur:
    nom: str
    mot_de_passe: str = field(repr=False)
```


Les dataclasses génèrent automatiquement des méthodes de comparaison (`__eq__`, `__lt__`, etc.).  
On peut **exclure un attribut spécifique** avec :

- `compare=False` → l’attribut **n’est pas utilisé pour comparer** deux instances.

### Exemple

```python
from dataclasses import dataclass, field

@dataclass
class Utilisateur:
    nom: str
    email: str
    mot_de_passe: str = field(compare=False)

u1 = Utilisateur("Alice", "alice@mail.com", "1234")
u2 = Utilisateur("Alice", "alice@mail.com", "abcd")

print(u1 == u2)   # True
```

Sans `compare=False`, les deux mots de passe différents auraient donné `False`.

**Pourquoi exclure des champs ?**

- champs sensibles (mot de passe, token…)
- champs volatils (timestamps, versions…)
- optimiser les comparaisons pour ne garder que les valeurs importantes



### 3. Créer des champs initialisés après coup (init=False)

```python
@dataclass
class Forme:
    rayon: float
    aire: float = field(init=False)

    def __post_init__(self):
        self.aire = 3.14 * self.rayon * self.rayon
```

### 4. Définir des métadonnées : ajouter des informations sur un champ

Le paramètre `metadata` de `field()` permet d’associer des **informations arbitraires** à un attribut.  
Elles n’ont aucun effet direct sur le fonctionnement de la dataclass, mais sont utiles pour :

- générer de la documentation,
- annoter des contraintes,
- passer des infos à un système externe (serialisation, interfaces…),
- ajouter du contexte métier.


```python
from dataclasses import dataclass, field

@dataclass
class Produit:
    nom: str
    prix: float = field(metadata={"devise": "EUR", "min": 0})

p = Produit("Stylo", 2.5)

print(p.__dataclass_fields__["prix"].metadata)
# {'devise': 'EUR', 'min': 0}
```

Ici, `metadata` est simplement un dictionnaire attaché au champ `prix`.


---

# Immutabilité avec `frozen=True`

Le paramètre `frozen=True` rend l’instance **immutable**, comme un tuple.

```python
from dataclasses import dataclass

@dataclass(frozen=True)
class Point:
    x: int
    y: int

p = Point(1, 2)
# p.x = 3  -> Error : cannot assign to field
```

Conséquences :

- impossible de modifier les attributs après création
- la dataclass devient **hashable par défaut**, si tous les attributs sont hashables
- très utile pour représenter des valeurs constantes, des points, des événements immuables…

---

# Optimisation mémoire avec `slots=True`

`slots=True` réduit la consommation mémoire et empêche l’ajout dynamiques d’attributs.

```python
from dataclasses import dataclass

@dataclass(slots=True)
class Client:
    nom: str
    age: int
```

Effets :

- la classe utilise `__slots__`, plus légère qu’une classe normale
- empêche l’ajout de nouveaux attributs : `client.adresse = ...` → erreur
- accélère l’accès aux attributs

*Astuce :* `slots=True` et `frozen=True` peuvent être combinés.

---

# Le hash dans les dataclasses : Comment générer un `__hash__`

Le **hash** est une valeur numérique qui permet d’utiliser un objet dans :

- un `set`
- les clés d’un `dict`

Un objet doit être :

- **immutable**,  
- **cohérent** avec son `__eq__`  

pour être hashable en toute sécurité.

## Cas 1 : dataclass avec `frozen=True`  
Les objets sont immuables → Python peut générer un `__hash__` fiable.

```python
from dataclasses import dataclass

@dataclass(frozen=True)
class Point:
    x: int
    y: int

p = Point(1, 2)
print(hash(p))   # fonctionne
```

## Cas 2 : dataclass mutable → pas de hash par défaut  
Par défaut, si `eq=True` (comportement standard) et la classe est **mutable**,  
Python désactive automatiquement le hash.

### Exemple

```python
from dataclasses import dataclass

@dataclass
class Produit:
    nom: str
    prix: float

# hash(Produit("Stylo", 2.5))  # -> Erreur : unhashable type
```

Cela évite d’insérer dans un set un objet dont les valeurs changeraient.

---

# Cas 3 : forcer un hash sur une classe mutable  
On peut utiliser :

- `unsafe_hash=True`

Cela crée un hash **même si l’objet est mutable**, mais c’est au développeur de garantir que :

- l’objet n’est pas modifié après insertion dans un set/dict  
- les attributs sont cohérents avec `__eq__`

### Exemple

```python
from dataclasses import dataclass

@dataclass(unsafe_hash=True)
class Produit:
    nom: str
    prix: float

p = Produit("Stylo", 2.5)
print(hash(p))   # fonctionne
```

⚠ Ce mode est dangereux si les attributs changent, car cela casse la logique des ensembles/dictionnaires.
