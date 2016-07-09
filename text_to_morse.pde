class Morse {
  String[] input;//input string array
  int il;//input length
  int ch;//character being translated
  String morseO;//input message in morse
  String morseC;//"ch" in morse
  String[] morse;//morse conversion chart
  int morseL;
  int t;
  char cur;
  int del;
  Morse() {
    input=loadStrings("input.txt");
    morse=loadStrings("morse.txt");
    il=input[0].length();
    t=0;
    morseO="";//removes "null" character at beginning of string
    del=120;
  }
  void tomorse() {
    for (int i=0; i<il; i++) {  
      ch=int(input[0].charAt(i));
      morseC=morse[ch];
      //port.write(morseC + "\n");
      //port.write(" " + "\n");
      //println(morseC);
      //println(" ");
      morseO=morseO + morseC + " ";
    }
    morseO=morseO + "...-.-";
    morseL=morseO.length();
    println(morseO);
    state=2;
  }
  void tosound() {
    if (t < morseL) {
      cur=morseO.charAt(t);
      if (cur=='.') {
        arduino.digitalWrite(pin, Arduino.HIGH);
        delay(del);
        arduino.digitalWrite(pin, Arduino.LOW);
        delay(del);
      }
      if (cur=='-') {
        arduino.digitalWrite(pin, Arduino.HIGH);
        delay(del*3);
        arduino.digitalWrite(pin, Arduino.LOW);
        delay(del);
      }
      if (cur==' ') {
        arduino.digitalWrite(pin, Arduino.LOW);
        delay(del*2);
      }
      if (cur=='/') {
        arduino.digitalWrite(pin, Arduino.LOW);
        delay(del*2);
      }
      t++;
    }
    if (t >= morseL) {
      state=3;
    }
  }
  String morse() {
    return morseO;
  }
}