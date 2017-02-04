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

void setup() {
  fullScreen();

  setupAccelorometer();
  textFont(createFont("Arial", 60));
}

void draw() {
  background(0);

  //DEBUGGING - show coordinates
  if (mapper.getHasLocation()) {
    textAlign(CENTER);
    text("Lat: " + mapper.getLatitude(), width/2, height/2 - 50);
    text("Lon: " + mapper.getLongitude(), width/2, height/2);
  } else {
    text("No permissions to access location", 20, 40);
  }

  //DEBUGGING - show accelorometer values
  textAlign(LEFT);
  text("X: " + accelorometer.ax, 10, 50);
  text("Y: " + accelorometer.ay, 10, 100);
  text("Z: " + accelorometer.az, 10, 150);
}