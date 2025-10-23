Processing :

import controlP5.*;
import processing.serial.*;

Serial arduinoPort;
ControlP5 cp5;

int angle1 = 90;
int angle2 = 90;
int angle3 = 90;

void setup() {
  size(900, 500);
  println(Serial.list());
  String portName = "COM6"; // adapte selon ton port
  arduinoPort = new Serial(this, portName, 115200);

  cp5 = new ControlP5(this);

  cp5.addSlider("servo1").setPosition(100, 400).setSize(200, 20).setRange(60, 180).setValue(90);
  cp5.addSlider("servo2").setPosition(350, 400).setSize(200, 20).setRange(60, 180).setValue(90);
  cp5.addSlider("servo3").setPosition(600, 400).setSize(200, 20).setRange(60, 180).setValue(90);
}

// affichage des cadrans

void drawGraduations(float cx, float cy, float radius, int step) {
  stroke(255);
  strokeWeight(1);
  fill(255);
  textSize(12);
  
  for (int angle = 60; angle <= 180; angle += step) {
    float rad = radians(angle);
    float x1 = cx + cos(PI + rad) * radius;
    float y1 = cy + sin(PI + rad) * radius;
    float x2 = cx + cos(PI + rad) * (radius + 10);
    float y2 = cy + sin(PI + rad) * (radius + 10);
    line(x1, y1, x2, y2);
    float xt = cx + cos(PI + rad) * (radius + 25);
    float yt = cy + sin(PI + rad) * (radius + 25);
    text(angle + "°", xt - 10, yt);
  }
}

// On a des problèmes entre 0 et 60 degrés, on va dessiner des hachures sur les cadrans
void drawHachures(float cx, float cy, float radius, float startDeg, float endDeg, float spacing) {
  stroke(255, 100, 100); // couleur des hachures
  strokeWeight(4);

  for (float angle = startDeg; angle <= endDeg; angle += spacing) {
    float rad = radians(angle);
    float x1 = cx + cos(PI + rad) * radius;
    float y1 = cy + sin(PI + rad) * radius;
    float x2 = cx + cos(PI + rad) * (radius - 20); // longueur des hachures
    float y2 = cy + sin(PI + rad) * (radius - 20);
    line(x1, y1, x2, y2);
  }
}

//Le fond noir est pas terrible, on a changé le fond avec cette fonction :
void drawStylishBackground() {
  for (int y = 0; y < height; y++) {
    stroke(lerpColor(color(30, 30, 60), color(100, 150, 255), float(y) / height));
    line(0, y, width, y);
  }
}




void drawGauge(float angle, float cx, float cy, String label, int servoNum) {
  drawGraduations(cx, cy, 100, 30);

  // Demi-cercle
  fill(100, 150, 255);
  arc(cx, cy, 190, 198, PI, TWO_PI);
  
  drawHachures(cx, cy, 100, 0, 60, 5); // zone hachurée entre 0° et 60°

  // Aiguille
  pushMatrix();
  translate(cx, cy - 5);
  rotate(radians(180+angle));
  fill(#FF0000);
  beginShape();
  vertex(0, -5);
  vertex(0, 5);
  vertex(80, 0);
  endShape(CLOSE);
  popMatrix();

  // Centre
  fill(0);
  ellipse(cx, cy, 18, 18);

  // Texte
  fill(255);
  textSize(16);
  text(label + " : " + int(angle) + "°", cx - 40, cy + 80);

  // Envoi à Arduino
  arduinoPort.write("p" + servoNum + "m" + angle + "g");
}

void draw() {
 drawStylishBackground();

  // Récupération des valeurs des sliders
  angle1 = (int) cp5.getController("servo1").getValue();
  angle2 = (int) cp5.getController("servo2").getValue();
  angle3 = (int) cp5.getController("servo3").getValue();

  // Affichage des cadrans
  drawGauge(angle1, 150, 250, "Servo 1", 1);
  drawGauge(angle2, 450, 250, "Servo 2", 2);
  drawGauge(angle3, 750, 250, "Servo 3", 3);
}


Arduino :

#include <Servo.h>

// Déclaration de 3 servos
Servo servo1;
Servo servo2;
Servo servo3;

void setup() {
  Serial.begin(115200);
  servo1.attach(2); // Servo 1 sur broche 2
  servo2.attach(3); // Servo 2 sur broche 3
  servo3.attach(4); // Servo 3 sur broche 4
  Serial.println("Ready");
}

// États pour décoder la commande
#define STATE_NONE 0
#define STATE_PINNUMBER 1
#define STATE_POSITION 2

int pinNumber = 0;
int position = 0;
int readState = STATE_NONE;

void loop() {
  if (Serial.available()) {
    char ch = Serial.read();

    switch (ch) {
      case '0'...'9':
        if (readState == STATE_PINNUMBER) {
          pinNumber = pinNumber * 10 + (ch - '0');
        } else if (readState == STATE_POSITION) {
          position = position * 10 + (ch - '0');
        }
        break;

      case 'p':
        readState = STATE_PINNUMBER;
        break;

      case 'm':
        readState = STATE_POSITION;
        break;

      case 'g':
        // Exécution selon le numéro de servo
        switch (pinNumber) {
          case 1:
            servo1.write(position);
            break;
          case 2:
            servo2.write(position);
            break;
          case 3:
            servo3.write(position);
            break;
        }
        // Réinitialisation
        pinNumber = 0;
        position = 0;
        readState = STATE_NONE;
        break;
    }
  }
}
