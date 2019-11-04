#include <AP_Sync.h>


AP_Sync sendData(Serial);

float sensorVal1; 
float sensorVal2;
float sensorVal3;


void setup() {
  // put your setup code here, to run once:

Serial.begin(9600);
}

void loop() {
  // put your main code here, to run repeatedly:
sensorVal1=analogRead(A1);
Serial.print(sensorVal1);
Serial.print(",");

sensorVal2=analogRead(A6);
Serial.print(sensorVal2);
Serial.print(",");

sensorVal3=analogRead(A7);
Serial.println(sensorVal3);

delay(100);

sendData.sync("sensor1",sensorVal1);

sendData.sync("sensor2",sensorVal2);

sendData.sync("sensor3",sensorVal3);




}
