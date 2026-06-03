
// Code en état de marche 
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
 if ( Serial.available()) {
  char ch = Serial.read();
  switch(ch) { 
   case '0'...'9':
    switch(readState) {
      case STATE_NONE:
        break;
      case STATE_PINNUMBER:
        pinNumber = pinNumber * 10 + (ch -'0');
        break;
      case STATE_POSITION:
        position = position * 10 + (ch -'0');
        break;
      }
      break;
    case 'g':
      servos[pinNumber].write(position);
      pinNumber = 0;
      position = 0;
      readState = STATE_NONE;
      break;
    case 'p':
      readState = STATE_PINNUMBER;
      break;
    case 'm':
      readState = STATE_POSITION;
      break;
    }
   }
  } 

// Exemple mettre p0m140g pour bouger le moteur relié au Pin 4
