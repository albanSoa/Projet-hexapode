#include <Servo.h>
// nombre de servos à commander
#define SERVO_COUNT 3
// tableau des servos et pin correspondantes
const byte servoPins[SERVO_COUNT] = {4, 3, 2,};
Servo servos[SERVO_COUNT];
void setup() {
 for (int i=0; i<SERVO_COUNT; i++) {
  servos[i].attach(servoPins[i]);
  servos[i].write(90); // position initiale arbitraire
 }
 Serial.begin(115200); // vitesse de communication sur le port série
 Serial.println("Ready");
}
// varibles pour le décryptage de la chaine reçue
#define STATE_NONE 0
#define STATE_PINNUMBER 1
#define STATE_POSITION 2
static int pinNumber = 0;
static int position = 0;
static int readState = STATE_NONE;
void loop() {
    if (Serial.available()>0)
    String message=Serial.read(command1); // on stocke ce qui est envoyé dans message 
    String message=Serial.read(); // on stocke ce qui est envoyé dans message 
    int command1=map(message,0,255,0,180); // mise à l'échelle 
   }
  } 
