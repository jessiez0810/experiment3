 import apsync.*;

import processing.serial.*;


String serialPort = "COM3";

public float sensor1;
public float sensor2;
public float sensor3;

float colorchange1;

AP_Sync readVals;

//Bubble bubble1; //initializing a Bubble object data type
Bubble[] bubbles= new Bubble[300];
int[] rs=new int[300];


void setup(){
   fullScreen();
//size(1920,1080);
readVals=new AP_Sync(this, serialPort, 9600);

//bubble1=new Bubble(20);
for(int i=0; i<rs.length; i++){
rs[i]=int(random(50,150));
bubbles[i]=new Bubble(rs[i]);
}
}

void draw(){
  colorchange1=map(sensor1,0,1025,0,255);
background(255-colorchange1*0.8,colorchange1*0.8,200+colorchange1*0.3);
/*
  bubble1.display();
  bubble1.wiggle();
  */
  for(int i=0; i<bubbles.length; i++){
bubbles[i].display();
bubbles[i].wiggle();
bubbles[i].sizechange();
  
}
}

class Bubble{
float x;
float y;
float diameter;
float placeholder;
float sizechange;
float offset;
float presensor2;
float presensor3;
float sensorchange2;
float sensorchange3;



Bubble(float placeholder){
x=random(-1000,width);
y=random(-3000,3000);
//sizechange=map(sensor3,0,1025,0,50);
//circlesize=diameter+sizechange;
diameter=placeholder;
}

void display(){
noStroke();
//colorchange1=map(sensor1,0,1025,0,255); 
fill(colorchange1, colorchange1*0.2, 255-colorchange1*0.5,190);
ellipse(x,y,diameter,diameter);
fill(255);
//text(colorchange1,width/2-50,height/2);
//text(sensor1,width/2+50, height/2);
//text(sensor2,width/2+200, height/2);
}

void wiggle(){
sensorchange2=sensor2-presensor2;
  if(sensorchange2>=100){
  offset=map(sensor2, 0, 1025, 0, 300);
}
else if(sensorchange2<=-100){
offset=map(sensor2, 0, 1025, -550, 0);
}
else{
offset=0;
}

y=y+random(-5,5)+offset;
presensor2=sensor2;

}

void sizechange(){
  sensorchange3=sensor3-presensor3;
  if(sensorchange3>=100){
  sizechange=map(sensorchange3,0,550,0,70);
  }
  else if(sensorchange3<-100){
  sizechange=map(sensorchange3,-550,0,-70,0);
  }
  else{
  sizechange=0;
  }
  diameter=diameter+sizechange;
  presensor3=sensor3;
}
}
