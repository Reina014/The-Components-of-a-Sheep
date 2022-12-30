int buttonPin = A0;     //Button and LED pin numbers
int ledPin = 13;


void setup() 
{
    pinMode(ledPin, OUTPUT);
    Serial.begin(9600);           //Serial monitor used to determine limit values
}

void loop() {
  int temp = analogRead(buttonPin);   //Read the analogue input
  Serial.println(temp);               //Display the read value in the Serial monitor
  if (temp < 30)                     //Lower limit for first button - if below this limit then no button is pushed and LEDs are turned off
  {
    digitalWrite(ledPin, LOW);
    Serial.write(0);
  }
  else if (temp <= 60)                //1st button limit - if below this limit but above previous limit then the first button is pressed
  {
    digitalWrite(ledPin, HIGH);
    Serial.write(1);
    
  }
  else if (temp <= 90)                //2nd button limit
  {
    digitalWrite(ledPin, HIGH);
    Serial.write(2);
  }

  else if (temp <= 115)                //3rd button limit
  {
    digitalWrite(ledPin, HIGH);
    Serial.write(3);
  }
  else if (temp <= 145)                //4th button limit
  {
    digitalWrite(ledPin, HIGH);
    Serial.write(4);
  }

  else if (temp <= 180)                //5th button limit
  {
    digitalWrite(ledPin, HIGH);
    Serial.write(5);
  }
  else if (temp <= 240)                //6th button limit
  {
    digitalWrite(ledPin, HIGH);
    Serial.write(6);
  }

  else if (temp <= 320)                //7th button limit
  {
    digitalWrite(ledPin, HIGH);
    Serial.write(7);
  }
  else if (temp <= 500)                //8th button limit
  {
    digitalWrite(ledPin, HIGH);
    Serial.write(8);
  }
  else if (temp <= 1100)                //9th button limit
  {
    digitalWrite(ledPin, HIGH);
    Serial.write(9);
  }
  else                                //If none of the previous buttons are pressed, then LED will turn off
  {
    digitalWrite(ledPin, LOW);
  }
  delay(100);                         //Delay for stability

}
