// Importation de la bibliothèque pour communiquer avec Arduino via le port série
import processing.serial.*;
Serial port; // Objet pour gérer la communication série

// Coordonnées du centre de l'écran (utilisé pour dessiner les flèches directionnelles)
float centreX = 450;
float centreY = 275;

// Variables pour le curseur vertical (type de slider)
float curseurY; // Position verticale du curseur
float curseurX = 50; // Position horizontale du curseur
float curseurHaut = 100; // Limite supérieure du curseur
float curseurBas = 400; // Limite inférieure du curseur
boolean glissementCurseur = false; // Indique si l'utilisateur est en train de déplacer le curseur

// Variables pour les directions du robot
boolean avancer = false;
boolean reculer = false;
boolean gauche = false;
boolean droite = false;

void setup() {
  // Initialisation de la fenêtre graphique
  size(900, 550); // Taille de la fenêtre
  frameRate(60); // Nombre d'images par seconde
  ellipseMode(CENTER); // Mode de dessin des cercles
  textFont(createFont("Arial", 12)); // Police de texte
  textAlign(CENTER, CENTER); // Alignement du texte

  textSize(20); // Taille du texte
  curseurY = curseurBas; // Position initiale du curseur
}

void draw() {
  // Fonction appelée en boucle pour dessiner l'interface
  background(255); // Fond blanc

  // Dessin des boutons interactifs
  dessinerBouton("Coucou", 750, 480);
  dessinerBouton("Position initiale", 750, 420);
  dessinerBouton("Repousser Obj", 750, 360);
  dessinerBouton("Tremble", 750, 300);
  dessinerBouton("Patte1", 750, 240);


  // Dessin des flèches directionnelles
  dessinerFlechesDirectionnelles();

  // Dessin du curseur vertical
  dessinerCurseurVertical();

  // Envoi des commandes au robot selon les touches activées
  if (avancer) port.write("Avancer\n");
  if (reculer) port.write("Reculer\n");
  if (gauche) port.write("Gauche\n");
  if (droite) port.write("Droite\n");
}

void dessinerBouton(String texte, int x, int y) {
  // Dessine un bouton avec texte à la position (x, y)
  int largeur = 120;
  int hauteur = 40;
  boolean survol = mouseX > x && mouseX < x + largeur && mouseY > y && mouseY < y + hauteur;

  // Ombre du bouton
  fill(180, 180, 180, 80);
  noStroke();
  rect(x + 3, y + 3, largeur, hauteur, 10);

  // Couleur du bouton selon survol
  fill(survol ? color(70, 130, 255) : color(200));
  stroke(60);
  strokeWeight(1);
  rect(x, y, largeur, hauteur, 10);

  // Texte du bouton
  fill(survol ? 255 : 0);
  textAlign(CENTER, CENTER);
  textSize(14);
  text(texte, x + largeur / 2, y + hauteur / 2);
}

void dessinerFlechesDirectionnelles() {
  // Dessine les flèches pour les directions
  dessinerFleche(width/2, 225, "Avancer", 0);
  dessinerFleche(width/2 - 60, height/2, "Gauche", -HALF_PI);
  dessinerFleche(width/2, 300, "Reculer", PI);
  dessinerFleche(width/2 + 60, height/2, "Droite", HALF_PI);
}

void dessinerFleche(float x, float y, String etiquette, float rotation) {
  // Dessine une flèche orientée selon rotation
  pushMatrix();
  translate(x, y);
  rotate(rotation);
  fill(0);
  stroke(0);
  triangle(-10, 10, 10, 10, 0, -20); // Forme de la flèche
  popMatrix();
  fill(0);
  text(etiquette, x, y + 30); // Texte sous la flèche
}

void dessinerCurseurVertical() {
  // Dessine un curseur vertical (slider)
  stroke(150);
  strokeWeight(20);
  line(curseurX, curseurHaut, curseurX, curseurBas); // Ligne du curseur

  fill(100);
  noStroke();
  ellipse(curseurX, curseurY, 20, 20); // Bouton du curseur

  // Affiche la valeur du curseur
  float valeur = map(curseurY, curseurBas, curseurHaut, 0, 100);
  fill(0);
  textAlign(LEFT, CENTER);
  textSize(14);
  text("Valeur : " + int(valeur), curseurX + 30, curseurY);
}

void mouseDragged() {
  // Si le curseur est en train d'être déplacé
  if (glissementCurseur) {
    curseurY = constrain(mouseY, curseurHaut, curseurBas); // Limite le déplacement
  }
}

void mousePressed() {
    // Flèche "Avancer"
  if (mouseX > width/2 - 20 && mouseX < width/2 + 20 && mouseY > 225 - 20 && mouseY < 225 + 20) {
    avancer = true;
    port.write("Avancer\n");
  }

    // Flèche "Reculer"
  if (mouseX > width/2 - 20 && mouseX < width/2 + 20 && mouseY > 300 - 20 && mouseY < 300 + 20) {
    reculer = true;
    port.write("Reculer\n");
  }

    // Flèche "Gauche"
  if (mouseX > width/2 - 60 - 20 && mouseX < width/2 - 60 + 20 && mouseY > height/2 - 20 && mouseY < height/2 + 20) {
    gauche = true;
    port.write("Gauche\n");
  }

    // Flèche "Droite"
  if (mouseX > width/2 + 60 - 20 && mouseX < width/2 + 60 + 20 && mouseY > height/2 - 20 && mouseY < height/2 + 20) {
    droite = true;
    port.write("Droite\n");
  }

  // Si clic sur le bouton "Patte1"
  if (mouseX > 720 && mouseX < 840 && mouseY > 240 && mouseY < 280) {
    port.write("Patte1\n");
  }

  // Si clic sur le bouton "Coucou"
  if (mouseX > 720 && mouseX < 840 && mouseY > 480 && mouseY < 520) {
    port.write("coucou\n");
  }

  // Si clic sur "Position initiale"
  if (mouseX > 720 && mouseX < 840 && mouseY > 420 && mouseY < 460) {
    port.write("Position initiale\n");
  }

  // Si clic sur "Repousser Obj"
  if (mouseX > 720 && mouseX < 840 && mouseY > 360 && mouseY < 400) {
    port.write("RepousserObj\n");
  }

  // Si clic sur "Tremble"
  if (mouseX > 720 && mouseX < 840 && mouseY > 300 && mouseY < 340) {
    for (int i = 0; i < 6; i++) {
      port.write("Tremble\n");
      delay(90);
    }
  }

  // Si clic sur le curseur
  if (dist(mouseX, mouseY, curseurX, curseurY) < 10) {
    glissementCurseur = true;
  }
}

void mouseReleased() {
  // Quand on relâche la souris, on arrête d'avancer :
  avancer = false;
  reculer=false; 
  gauche=false;
  droite=false; 
  
  // Si clic en dehors des boutons, on remet le robot en position initiale
  if (mouseX < 700 && mouseY < 600) {
    port.write("Position initiale\n");
  }

  glissementCurseur = false;
}

void keyPressed() {
  // Quand une touche est pressée, on active la direction correspondante
  if (key == 'z' || key == 'Z') {
    avancer = true;
    println("Avancer");
  }
  if (key == 's' || key == 'S') {
    reculer = true;
    println("Reculer");
  }
  if (key == 'q' || key == 'Q') {
    gauche = true;
    println("Gauche");
  }
  if (key == 'd' || key == 'D') {
    droite = true;
    println("Droite");
  }
}

void keyReleased() {
  // Quand une touche est relâchée, on arrête le mouvement et remet en position initiale
  if (key == 'z' || key == 'Z') {
    avancer = false;
    port.write("Position initiale\n");
  }
  if (key == 's' || key == 'S') {
    reculer = false;
    port.write("Position initiale\n");
  }
  if (key == 'q' || key == 'Q') {
    gauche = false;
    port.write("Position initiale\n");
  }
  if (key == 'd' || key == 'D') {
    droite = false;
    port.write("Position initiale\n");
  }
}
