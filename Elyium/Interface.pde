class Interface {

  //1 = loading - intermediate/walking. 2 = narrative. 3 = transition.
  int state = 1;

  //images for cover ASCII art
  PImage source;

  //possible characters for ASCII art
  String[] chars = {".", "*", "o", "i", "+", "x", "=", "v", "%", "#"};

  //boolean to stop cover image from being re-rendered
  boolean rendered = false;
  
  int brightnessThresh = 40;

  Interface() {
  }

  public void display() {
    switch (state) {
    case 1:
      inter();
      break;

    case 2:
      narrative();
      break;

    case 3:
      transition();
      break;

    default:
      inter();
      break;
    }

    data();
    if (rendered == false) {
      background(0);
      ASCII();
      rendered = true;
    }
  }

  public void setSource(PImage img) {
    source = img;
  }

  public void setRendered(boolean bool) {
    rendered = bool;
  }

  //polish
  private void inter() {
  }

  private void narrative() {
  }

  //polish
  private void transition() {
  }

  private void ASCII() {
    source.loadPixels();

    textAlign(CENTER);
    fill(255);
    noStroke();
    textSize(10);

    for (int x = 0; x < source.width; x += 7) {
      for (int y = 0; y < source.height; y += 7) {
        int loc = x + (y * source.width);

        int brightness = int(brightness(source.pixels[loc]));
        if (brightness > brightnessThresh) text(chars[int(map(brightness, brightnessThresh, 255, 0, 9))], x + width/4, y + height/20);
      }
    }
  }
}

//DEBUGGING
private void data() {
  fill(0);
  rectMode(CORNER);
  rect(width - 200, height - 200, 200, 200);

  fill(255);
  textAlign(RIGHT);
  textSize(24);
  //coordinates
  if (mapper.getHasLocation()) {
    text("Lat: " + mapper.getLatitude(), width, height - 50);
    text("Lon: " + mapper.getLongitude(), width, height - 70);
  } else {
    text("No permissions to access location", width, height - 10);
  }

  //accelorometer values
  text("X: " + accelorometer.ax, width, height - 140);
  text("Y: " + accelorometer.ay, width, height - 120);
  text("Z: " + accelorometer.az, width, height - 100);
}