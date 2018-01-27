import cc.arduino.*;
import org.firmata.*;
import processing.serial.*;
Arduino arduino;
Serial port;
Morse m;
int state=0;
int pin=8;
int t;
boolean addmsg=true;
void setup() {
  m=new Morse();
  size(100, 100);
  arduino=new Arduino(this, Arduino.list()[3], 57600);
  arduino.pinMode(pin, Arduino.OUTPUT);
  t=0;
  frameRate(144);
}
void draw() {
  background(255);
  if (state==0) {
    fill(0);
    textAlign(CENTER);
    text("click to start", 50, 50);
    stroke(2);
    textSize(8.5);
    text("append messsage\nwith <AR>", 58, 84);
    textSize(12);
    if (addmsg==false) {
      fill(255);
    }
    if (addmsg==true) {
      fill(0);
    }
    rectMode(RADIUS);
    rect(10, 90, 5, 5);
    if (mousePressed==true) {
      if (mouseX>5 && mouseX<15 && mouseY>85 && mouseY<95) {
      } else {
        state=1;
      }
    }
    if (keyPressed==true) {
      state=1;
    }
  }
  if (state==1) {
    background(255);
    fill(0);
    textAlign(CENTER);
    text("translating", 50, 50);
    m.tomorse();
  }
  if (state==2) {
    background(255);
    fill(0);
    textAlign(CENTER);
    text("transmitting", 50, 50);
    m.tosound();
  }
  if (state==3) {
    background(255);
    fill(0);
    textAlign(CENTER);
    text("done\n(click to repeat\nq to quit)", 50, 40);
    if (mousePressed==true) {
      t=0;
      state=2;
    }
    if (keyPressed==true){
      if (key=='q'){
        m.end();
        exit();
      }
    }
  }
}
void mouseReleased() {
  if (state == 0 && mouseX>5 && mouseX<15 && mouseY>85 && mouseY<95) {
    addmsg=!addmsg;
  }
}