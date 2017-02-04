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

//accelorometer variables
Context accContext;
SensorManager accManager;
Sensor acc;
AccelerometerListener accListener;
float ax, ay, az;

//gps data
float currentLatitude  = 0;
float currentLongitude = 0;
float currentAccuracy  = 0;
String currentProvider = "";
boolean hasLocation = false;

//location variables
LocationManager locManager;
MyLocationListener locListener;

void setup() {
  fullScreen();

  setupAccelorometer();
  textFont(createFont("Arial", 60));
}

void draw() {
  background(0);

  if (hasLocation) {
    text("Latitude: " + currentLatitude, 20, 50);
    text("Longitude: " + currentLongitude, 20, 100);
    text("Accuracy: " + currentAccuracy, 20, 150);
    text("Provider: " + currentProvider, 20, 200);
  } else {
    text("No permissions to access location", 20, 40);
  }

  text("X: " + ax, 10, 300);
  text("Y: " + ay, 10, 360);
  text("Z: " + az, 10, 420);
}