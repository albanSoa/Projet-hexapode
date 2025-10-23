Arduino

#include <Servo.h>

Servo servos[12];

void setup() {
  Serial.begin(9600);

  // Attacher les 12 servos aux broches 2 à 13
  for (int i = 0; i < 12; i++) {
    servos[i].attach(i + 2);
    servos[0].write(120); // Position neutre
    servos[1].write(90);
  }
}

void loop() {
  if (Serial.available()) {
    String command = Serial.readStringUntil('\n');
    command.trim();

    if (command == "coucou") {
      for (int i = 0; i < 3; i++) {
        // Patte 1 uniquement (servos 0, 1, 2)
        servos[1].write(80); // coude
        servos[0].write(20);  // poignet
        delay(300);
        servos[1].write(70);
        servos[0].write(110);
        delay(300);
      }

      // Retour à la position neutre
      servos[0].write(90);
      servos[1].write(30);
      servos[2].write(90);
    }
  }
}

Processing

import processing.serial.*;
Serial port;

int nbGraduations = 12;
float rayonMax = 225;
int nbCouches = 100;
float cx = 450;
float cy = 275;
float px = cx;
float py = cy;
boolean isDragging = false;

void setup() {
  size(900, 550);
  frameRate(60);
  ellipseMode(CENTER);
  textFont(createFont("Arial", 12));
  textAlign(CENTER, CENTER);
  port = new Serial(this, Serial.list()[0], 9600); // Vérifie le bon port
}

void draw() {
  background(255);

  // Dégradé radial
  noStroke();
  for (int i = nbCouches; i >= 0; i--) {
    float ratio = i / float(nbCouches);
    int r = int(lerp(100, 0, ratio));
    int g = int(lerp(180, 51, ratio));
    int b = int(lerp(255, 102, ratio));
    fill(r, g, b);
    float rayon = rayonMax * ratio;
    ellipse(cx, cy, rayon * 2, rayon * 2);
  }

  // Cercle gradué
  stroke(0, 51, 102);
  noFill();
  ellipse(cx, cy, rayonMax * 2, rayonMax * 2);
  for (int i = 0; i < nbGraduations; i++) {
    float angle = -TWO_PI / nbGraduations * i;
    float deg = degrees(-angle);
    float x1 = cx + cos(angle) * rayonMax;
    float y1 = cy + sin(angle) * rayonMax;
    float x2 = cx + cos(angle) * (rayonMax + 10);
    float y2 = cy + sin(angle) * (rayonMax + 10);
    line(x1, y1, x2, y2);
    float xt = cx + cos(angle) * (rayonMax + 20);
    float yt = cy + sin(angle) * (rayonMax + 20);
    fill(0, 51, 102);
    text(int(deg) + "°", xt, yt);
    noFill();
  }

  // Joystick interaction
  if (isDragging) {
    float dx = mouseX - cx;
    float dy = mouseY - cy;
    float dist = sqrt(dx*dx + dy*dy);
    if (dist <= rayonMax) {
      px = mouseX;
      py = mouseY;
    }
  }

  drawJoystick(px, py);

  // Affichage des infos
  float dx = px - cx;
  float dy = py - cy;
  float distance = sqrt(dx*dx + dy*dy);
  fill(0);
  textAlign(LEFT);
  text("Position : (" + int(px) + ", " + int(py) + ")", 20, 20);
  text("Distance au centre : " + nf(distance, 1, 2), 20, 40);
  if (distance > 0.5) {
    float angleRad = atan2(dy, dx);
    float angleDeg = degrees(angleRad);
    if (angleDeg < 0) angleDeg += 360;
    angleDeg = 360 - angleDeg;
    text("Angle : " + nf(angleDeg, 1, 2) + "°", 20, 60);
  } else {
    text("Angle : — (au centre)", 20, 60);
  }

  // Bouton "Coucou"
  drawButton();
}

void drawJoystick(float x, float y) {
  fill(0, 0, 0, 50);
  noStroke();
  ellipse(x + 3, y + 3, 30, 30);
  fill(80, 80, 200);
  stroke(0);
  strokeWeight(2);
  ellipse(x, y, 30, 30);
  stroke(255);
  strokeWeight(2);
  line(x - 10, y, x + 10, y);
  line(x, y - 10, x, y + 10);
}

void drawButton() {
  int bx = 780;
  int by = 480;
  int bw = 100;
  int bh = 30;
  fill(200);
  stroke(0);
  rect(bx, by, bw, bh, 5);
  fill(0);
  textAlign(CENTER, CENTER);
  text("Coucou", bx + bw / 2, by + bh / 2);
}

void mousePressed() {
  float d = dist(mouseX, mouseY, px, py);
  if (d < 15) {
    isDragging = true;
  }
  if (mouseX > 780 && mouseX < 880 && mouseY > 480 && mouseY < 510) {
    port.write("coucou\n");
  }
}

void mouseReleased() {
  isDragging = false;
  px = cx;
  py = cy;
}
