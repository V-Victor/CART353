//android API context
import android.content.Context;

//location sensor
import android.location.Location;
import android.location.LocationListener;
import android.location.LocationManager;
import android.os.Bundle;
import android.Manifest;

//location
Mapper mapper;

//narrative generator and manager
Narrator narrator;

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
  background(0);
}

void draw() {
  originSource = loadImage(count + ".png");
  UI.setSource(originSource);
  if (count == 1 || count == 6) UI.display(true);
  else UI.display(false);

  if (mousePressed) {
    if (ready) {
      if (count + 1 < 7) {
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