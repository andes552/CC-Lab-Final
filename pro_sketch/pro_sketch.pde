import processing.serial.*;

PFont myFont;
Serial myPort;
int linefeed = 10;
int numSensors = 5;
int sensors[];
int pSensors[];  
String[] stringArray = {"No gesture detected"};

void setup() {
  // Screen setup
  size(800, 600);
  //fullScreen();
  smooth();
  
  // Fonts
  myFont = createFont("PT Sans", 32);

  // Printing out ports
  println(Serial.list());

  // Listen on port 0 (COM4)
  myPort = new Serial(this, Serial.list()[0], 9600);

  // Read bytes into a buffer until you get a linefeed (ASCII 10):
  myPort.bufferUntil(linefeed);
}

void draw() {

  // If valid data arrays are not null, compare each sensor value with the previous reading to establish change
  if ((pSensors != null)&&(sensors != null)) {

    // Statements for actually doing stuff
    
    if(sensors[0] >= 3 & sensors[1] == 8 & sensors[2] >= 3 & sensors[3] >= 6 & sensors[4] >= 6){
      stringArray[0] = "...";
    }

    if(sensors[0] == 0 & sensors[1] == 8 & sensors[2] == 8 & sensors[3] == 8 & sensors[4] == 8){
      stringArray[0] = "OK";
    }
    
    if(sensors[0] <= 4 & sensors[1] <= 3 & sensors[2] <= 3 & sensors[3] >= 6 & sensors[4] >= 6){
      stringArray[0] = "PEACE";
    }
    
    if(sensors[0] <= 4 & sensors[1] <= 2 & sensors[2] == 8 & sensors[3] == 8 & sensors[4] >= 1){
      stringArray[0] = "ROCK ON";
    }
    
    
    background(145, 170, 157);
    color(255, 255, 255);
    textFont(myFont, 60);
    text(stringArray[0], 100, 100);

 
  }
}

void serialEvent(Serial myPort) {

  // Read the serial buffer:
  String myString = myPort.readStringUntil(linefeed);

  // If you got any bytes other than the linefeed:
  if (myString != null) {

    myString = trim(myString);

    // Split the string at the commas and convert the sections into integers:
    pSensors = sensors;
    sensors = int(split(myString, ','));

    // Print out the values:
    for (int sensorNum = 0; sensorNum < sensors.length; sensorNum++) {
      print("Sensor " + sensorNum + ": " + sensors[sensorNum] + "\t");
    }

    // Add a linefeed after all the sensor values are printed:
    println();
  }
}