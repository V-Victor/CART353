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
PFont console = createFont("cpmono", 24, false);
PImage source, cover;

//general use timer
Timer timer = new Timer();

void setup() {
  fullScreen();
  textFont(console);
  setupAccelorometer();
}

void draw() {
  background(0);
  UI.display();
}