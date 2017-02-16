class Player {
  PVector location = new PVector(0, 0);
  PVector velocity = new PVector(0, 0);
  PVector acceleration = new PVector(0, 0);

  float mass = 4;
  int massLimit = 10;
  float acc = 0;
  float dec = 0;

  int orbits = 4;
  float gravField = 400;

  //W A S D
  boolean[] keys = {false, false, false, false};

  Player() {
  }

  float getX() {
    return location.x;
  }

  float getY() {
    return location.y;
  }

  float getGravField() {
    return gravField;
  }

  void move() {
    acc = 15 - mass;
    dec = mass/2;

    if (keys[0] == true) acceleration.y += -acc;
    if (keys[1] == true) acceleration.x += -acc;
    if (keys[2] == true) acceleration.y += acc;
    if (keys[3] == true) acceleration.x += acc;

    acceleration.limit(10);

    acceleration.setMag(acceleration.mag() / dec);
    velocity.setMag(velocity.mag() / dec);

    velocity.add(acceleration);
    velocity.limit(10);

    loadPixels();
    if (brightness(pixels[pixels.length/2 + width/2]) == 255) velocity.div(2);

    location.add(velocity);
  }

  void display() {
    noFill();
    stroke(255);
    strokeWeight(2);
    ellipse(width/2, height/2, mass*5, mass*5);
  }

  void eat() {
    for (int i = 0; i < entities.length; i++) {
      if (dist(entities[i].location.x - width/2, entities[i].location.y - height/2, location.x, location.y) < gravField) {
        orbits ++;
      }
    }

    if (mass > massLimit) mass = massLimit;
    else mass = orbits;
    gravField = mass * 25;
    orbits = 4;
  }
}

void keyPressed() {
  if (key == 'w') player.keys[0] = true;
  if (key == 'a') player.keys[1] = true;
  if (key == 's') player.keys[2] = true;
  if (key == 'd') player.keys[3] = true;
}

void keyReleased() {
  if (key == 'w') player.keys[0] = false;
  if (key == 'a') player.keys[1] = false;
  if (key == 's') player.keys[2] = false;
  if (key == 'd') player.keys[3] = false;
}