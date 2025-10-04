import processing.serial.*;
Serial arduinoPort;
int angle1 = 90;
void setup() {
  size(320, 240);
  background(0, 255, 255);
  printArray(Serial.list());
  String portName = Serial.list()[0];
  arduinoPort = new Serial(this, portName, 9600);
}
void draw() {
   int servoVal = (int)(255 * mouseX / width); // Position horizontale → valeur entre 0 et 255
   angle1 = servoVal*180/255; 
   String command1="p2m"+angle1+"g";
  arduinoPort.write(command1);
  println(command1);
  background(255, 255, 0);
  fill(255, 0, 0);
  ellipse(mouseX, mouseY, 50, 50);             // Cercle rouge qui suit la souris
}
