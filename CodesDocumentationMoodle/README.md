# 🚀 Commande des servomoteurs avec Processing et Arduino

Ce projet présente plusieurs exemples de commande de **servomoteurs** à l’aide d’une carte **Arduino** et du logiciel **Processing**.  
L’objectif est de créer une interface graphique (IHM) permettant de piloter les moteurs en temps réel via le port série.

---

## 🛠️ Matériel requis
- Carte **Arduino UNO** (ou équivalente)
- Un ou plusieurs **servomoteurs**
- Câbles de connexion
- PC avec :
  - [Arduino IDE](https://www.arduino.cc/en/software)
  - [Processing](https://processing.org/download/)

---

## 📂 Structure du projet
- **Arduino**
  - `tuto_ar_servo1.ino` → Commande d’un servo via la souris (0–180°)
  - `tuto_ar_servo_serie1.ino` → Commande de plusieurs servos via une trame série (format `pXmYg`)
- **Processing**
  - `tuto_pr_servo_souris1.pde` → Contrôle d’un servo avec la souris
  - `slider1.pde` → Interface graphique simple avec un slider (ControlP5)
  - `slider1_event.pde` → Gestion des événements de contrôle (ControlEvent)
  - `slider_serie1.pde` → Commande série d’un servo avec slider + affichage graphique

---

## ⚙️ Principe de fonctionnement
1. L’Arduino reçoit les commandes via le port série USB.
2. Le programme **Processing** agit comme une interface utilisateur :
   - Déplacement de la souris → envoi d’une valeur à l’Arduino.
   - Utilisation d’un slider (ControlP5) → envoi de l’angle choisi.
3. Les servomoteurs réagissent instantanément aux valeurs reçues.

---

## 🔑 Format des messages série
- `pXmYg`  
  - `X` → numéro du servo (ex : `1`)  
  - `Y` → angle du servo (0 à 180°)  
  - Exemple : `p1m135g` → place le servo n°1 à 135°  

---

## 📦 Installation
### 1. Arduino
- Ouvrir le fichier `.ino` correspondant dans l’IDE Arduino.
- Choisir le bon port série.
- Compiler et téléverser sur la carte.

### 2. Processing
- Installer Processing.
- Ajouter la bibliothèque **controlP5** :  
  `Sketch > Import Library > Add Library...`
- Ouvrir le fichier `.pde` voulu et l’exécuter.

---

## 🎨 Interface graphique
- **Avec la souris :** un cercle rouge se déplace dans la fenêtre et pilote un servo.  
- **Avec slider (ControlP5) :** l’utilisateur règle la position du servo directement avec une barre de défilement.  
- **Avec visualisation :** un rectangle pivotant simule la position réelle du servomoteur.  



