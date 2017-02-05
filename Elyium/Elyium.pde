//android API context
import android.content.Context;

//accelorometer
import android.hardware.Sensor;
import android.hardware.SensorManager;
import android.hardware.SensorEvent;
import android.hardware.SensorEventListener;

//location sensor
import android.location.Location;
import android.location.LocationListener;
import android.location.LocationManager;
import android.os.Bundle;
import android.Manifest;

//accelorometer
Accelerometer accelorometer;

//accelorometer managment
Context accContext;
SensorManager accManager;
Sensor acc;

//location
Mapper mapper;

//interface
Interface UI = new Interface();
PFont console;
PImage originSource;

int count = 1;

//checker to avoid unwanted double-clicking
boolean ready = true;

//general use timer
Timer timer = new Timer();

void setup() {
  fullScreen();

  console = createFont("Menlo-Regular.ttf", 24, false);
  textFont(console);

  setupAccelorometer();
  background(0);
}

void draw() {
  originSource = loadImage(count + ".png");
  UI.setSource(originSource);
  UI.display();

  if (mousePressed) {
    if (ready) {
      if (count + 1 < 12) {
        count++;
        UI.setRendered(false);
      } else {
        count = 1;
        UI.setRendered(false);
      }
      ready = false;
    }
  }
  if (mousePressed == false) ready = true;
}