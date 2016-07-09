import cc.arduino.*;
import org.firmata.*;
import processing.serial.*;
Arduino arduino;
Serial port;
Morse m;
int state=0;
int pin=13;
void setup() {
  m=new Morse();
  size(100, 100);
  arduino=new Arduino(this, Arduino.list()[3], 57600);
  arduino.pinMode(pin, Arduino.OUTPUT);
}
void draw() {
  background(255);
  if (state==0) {
    fill(0);
    textAlign(CENTER);
    text("click to start", 50, 50);
    if (mousePressed == true | keyPressed==true) {
      state=1;
    }
  }
  if (state==1) {
    m.tomorse();
  }
  if (state==2) {
    background(255);
    textAlign(CENTER);
    text("transmitting", 50, 50);
    m.tosound();
  }
  if (state==3) {
    background(255);
    fill(0);
    textAlign(CENTER);
    text("done \n (click to exit)", 50, 40);
    if (mousePressed==true | keyPressed==true) {
      exit();
    }
  }
}