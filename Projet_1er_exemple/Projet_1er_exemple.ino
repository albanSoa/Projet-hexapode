#include <Servo.h> 
const int servoPin=2; //servomoteur sur E/S 10 
Servo monServo; 
void setup() { 
   Serial.begin(9600); // vitesse de communication sur le port série 
   monServo.attach(2); 
}
void loop() { 
 if (Serial.available()>0){ //si il y a un envoi sur le port série 
  String message=Serial.read(servoVal); // on stocke ce qui est envoyé dans message 
  String message=Serial.read(); // on stocke ce qui est envoyé dans message 
  int servoVal=map(message,0,255,0,180); // mise à l'échelle 
  monServo.write(servoVal); //commande de l'angle du seromoteur 
 } 
 delay(10); 
}
