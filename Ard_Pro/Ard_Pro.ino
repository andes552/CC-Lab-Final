// Final Project
// Stine Møller Andersen

int delayTime = 2000;

void setup(){
  Serial.begin(9600);
} 

void loop(){
  // Declaring and reading the flex sensors
  int flexValue1 = analogRead(1);
  int flexValue2 = analogRead(2);
  int flexValue3 = analogRead(3);
  int flexValue4 = analogRead(4);
  int flexValue5 = analogRead(5);
  delay(500);

  // Mapping
  int flexReading1 = map(flexValue1, 790, 850, 0, 8);
  int flexReading2 = map(flexValue2, 750, 930, 0, 8);
  int flexReading3 = map(flexValue3, 830, 920, 0, 8);
  int flexReading4 = map(flexValue4, 790, 950, 0, 8);
  int flexReading5 = map(flexValue5, 770, 900, 0, 8);

  // Constraining
  flexReading1 = constrain(flexReading1, 0, 8);
  flexReading2 = constrain(flexReading2, 0, 8);
  flexReading3 = constrain(flexReading3, 0, 8);
  flexReading4 = constrain(flexReading4, 0, 8);
  flexReading5 = constrain(flexReading5, 0, 8);

  // Printing the values in the monitor
  Serial.print(flexReading1, DEC);    // Print sensor 1
  Serial.print(",");                  // Print ','

  Serial.print(flexReading2, DEC);    // Print sensor 2
  Serial.print(",");                  // Print ','

  Serial.print(flexReading3, DEC);    // Print sensor 3
  Serial.print(",");                  // Print ','

  Serial.print(flexReading4, DEC);    // Print sensor 4
  Serial.print(",");                  // Print ','
  
  Serial.println(flexReading5, DEC);  // print sensor 5

  // Delaying
  //delay(delayTime);

} 


