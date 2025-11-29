#include <Servo.h>


// Création de la liste
Servo servos[18];


void setup() {
  Serial.begin(9600);

  // Attacher les 18 servos aux broches 14, 16, 18, 20, ... selon un ordre défini
  for (int i = 0; i < 18; i++) {
    servos[i].attach(14 + (i * 2));
  }

  // Mise en position 0 des servos-moteurs (pattes orientées vers le haut)
  servos[0].write(90);
  delay(50);
  servos[1].write(12);
  delay(50);
  servos[2].write(165);
  delay(50);

  servos[3].write(100);
  delay(50);
  servos[4].write(165);
  delay(50);
  servos[5].write(0);
  delay(50);

  servos[6].write(90);
  delay(50);
  servos[7].write(168);
  delay(50);
  servos[8].write(0);
  delay(50);

  servos[9].write(90);
  delay(50);
  servos[10].write(155);
  delay(50);
  servos[11].write(0);
  delay(50);

  servos[12].write(104);
  delay(50);
  servos[13].write(0);
  delay(50);
  servos[14].write(165);
  delay(50);

  servos[15].write(98);
  delay(50);
  servos[16].write(0);
  delay(50);
  servos[17].write(165);
  delay(50);

}


void loop() {
  if (Serial.available()) {
    String line = Serial.readStringUntil('\n');

    int i1 = line.indexOf(';');
    int i2 = line.indexOf(';', i1+1);  
    String command = line.substring(i2+1);
    if (command == "coucou") {
      // Patte 1 uniquement (servos 0, 1, 2)
      servos[2].write(77);
      delay(50);
      servos[0].write(90);
      delay(50);

      // oscillation du 2
      for (int i = 0; i < 4; i++) {
        servos[2].write(75);
        delay(50);
        servos[2].write(79);
        delay(50);
      }


      // Mise en position initiale
      servos[0].write(90);
      delay(50);
      servos[1].write(77);
      delay(50);
      servos[2].write(75);
      delay(50);
      }

    }
    if (command == "Position initiale") {
      // Mise en position initiale
      servos[0].write(90);
      delay(50);
      servos[1].write(77);
      delay(50);
      servos[2].write(75);
      delay(50);
    
      servos[3].write(100);
      delay(50);
      servos[4].write(100);
      delay(50);
      servos[5].write(88);
      delay(50);
    
      servos[6].write(90);
      delay(50);
      servos[7].write(103);
      delay(50);
      servos[8].write(90);
      delay(50);
    
      servos[9].write(90);
      delay(50);
      servos[10].write(90);
      delay(50);
      servos[11].write(90);
      delay(50);
    
      servos[12].write(104);
      delay(50);
      servos[13].write(65);
      delay(50);
      servos[14].write(75);
      delay(50);
    
      servos[15].write(98);
      delay(50);
      servos[16].write(65);
      delay(50);
      servos[17].write(75);
      delay(50);



    }
   if (command == "RepousserObj") {
    for (int i = 0; i < 3; i++) {
        servos[1].write(0); 
        servos[2].write(75);  
        delay(200);
        servos[1].write(0); 
        servos[2].write(5);  
        delay(200);
        servos[1].write(35);
        servos[2].write(70);  
        delay(200);

    }
   }
  if (command == "Tremble") {
        servos[1].write(63);  // poignet
        servos[2].write(73); // épaule

        servos[4].write(98);  // poignet
        servos[5].write(86); // épaule

        servos[7].write(101);  // poignet
        servos[8].write(88); // épaule

        servos[10].write(88);  // poignet
        servos[11].write(88); // épaule

        servos[13].write(63);  // poignet
        servos[14].write(73); // épaule

        servos[16].write(63);  // poignet
        servos[17].write(73); // épaule

        // delay() à ajuster
        delay(30);

        servos[1].write(79);  // poignet
        servos[2].write(77); // épaule

        servos[4].write(102);  // poignet
        servos[5].write(90); // épaule

        servos[7].write(105);  // poignet
        servos[8].write(92); // épaule

        servos[10].write(92);  // poignet
        servos[11].write(92); // épaule

        servos[13].write(67);  // poignet
        servos[14].write(77); // épaule

        servos[16].write(67);  // poignet
        servos[17].write(77); // épaule
  }
 if (command == "Avancer") {


      float hauteur_chassis = 50; // en mm
      float l1 = 55.0; // en mm
      float l2 = 80.0; // en mm
      float l3 = 80.0; // en mm


      float gamma = atan(hauteur_chassis/l3);
      float l4 = l3/cos(gamma);
      float beta = - acos( (hauteur_chassis*hauteur_chassis + l4*l4 - l1*l1 - l2*l2) / (2*l1*l2) );
      float alpha = atan((((l1 + (l2*cos(beta)))*(-hauteur_chassis)) - (l2*sin(beta)*l4)) / (((l1 + (l2*cos(beta)))*l4) + (l2*sin(beta)*(-hauteur_chassis))));


      // on leve 2, 5, 8
      servos[2].write(165);
      delay(50);
      servos[5].write(0);
      delay(50);
      servos[8].write(0);
      delay(50);

      
      servos[0].write(90 - (gamma*180/3.1415));
      delay(500);

      servos[3].write(100 + (gamma*180/3.1415));
      delay(500);

      servos[6].write(90 - (gamma*180/3.1415)); 
      delay(500);


      
      servos[1].write(104 - (alpha*180/3.1415)); 
      delay(500);   

      servos[4].write(165 - 90 + (alpha*180/3.1415));
      delay(500);

      servos[7].write(168 - 90 + (alpha*180/3.1415)); 
      delay(500);


      
      
      servos[2].write((165 + (beta*180/3.1415))); 
      delay(500);

      servos[5].write((-beta*180/3.1415));
      delay(500);

      servos[8].write((-beta*180/3.1415)); 
      delay(1000);





      // on leve 11, 14, 17
      servos[11].write(0);
      delay(50);
      servos[14].write(165);
      delay(50);
      servos[17].write(165);
      delay(50);



      servos[0].write(90);
      delay(50);

      servos[3].write(100);
      delay(50);

      servos[6].write(90); 
      delay(50);



   }
 }
}
