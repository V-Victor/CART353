class Player {
  PVector location = new PVector(0, 0);
  PVector velocity = new PVector(0, 0);
  PVector acceleration = new PVector(0, 0);

  float mass = random(3.4, 4);
  int massLimit = 10;
  float accelerationSpeed = 0;
  float decelerationSpeed = 0;

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

  void move() {
    accelerationSpeed = 15 - mass;
    decelerationSpeed = mass/2;

    if (keys[0] == true) acceleration.y -= accelerationSpeed;
    if (keys[1] == true) acceleration.x -= accelerationSpeed;
    if (keys[2] == true) acceleration.y += accelerationSpeed;
    if (keys[3] == true) acceleration.x += accelerationSpeed;

    acceleration.setMag(acceleration.mag() / decelerationSpeed);
    velocity.add(acceleration);
    velocity.setMag(velocity.mag() / decelerationSpeed);
    location.add(velocity);
  }

  void display() {
    noFill();
    stroke(255);
    strokeWeight(2);
    ellipse(width/2, height/2, mass*5, mass*5);
  }

  void eat() {
    if (mass > massLimit) mass = massLimit;
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