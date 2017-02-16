class Player {
  //physics
  PVector location = new PVector(0, 0);
  PVector velocity = new PVector(0, 0);
  PVector acceleration = new PVector(0, 0);

  //mass, determines speed of acceleration and deceleration
  float mass = 4;
  int massLimit = 10;

  //acc and dec, used to calculate acceleration and deceleration of player
  float acc = 0;
  float dec = 0;

  //number of oribing objects
  int orbits = 4;

  //field in which objects will be affected by player, gravitationally
  float gravField = 400;

  //shrinks gravity field when calculating mass through number of orbits
  int gravDivider = 5;

  //W A S D controls
  boolean[] keys = {false, false, false, false};

  Player() {
  }

  //get-set
  float getX() {
    return location.x;
  }
  float getY() {
    return location.y;
  }
  float getGravField() {
    return gravField;
  }

  //controls and movement
  void move() {
    //calculate acceleration and deceleration
    acc = 15 - mass;
    dec = mass/2;

    //get pressed keys, add forces to appropriate directions
    if (keys[0] == true) acceleration.y += -acc;
    if (keys[1] == true) acceleration.x += -acc;
    if (keys[2] == true) acceleration.y += acc;
    if (keys[3] == true) acceleration.x += acc;

    acceleration.limit(10);

    //deceleration
    acceleration.setMag(acceleration.mag() / dec);
    velocity.setMag(velocity.mag() / dec);

    //acceleration
    velocity.add(acceleration);
    velocity.limit(10);

    //in case of standing on white part of terrain, reduce velocity
    loadPixels();
    if (brightness(pixels[pixels.length/2 + width/2]) == 255) velocity.div(3);

    //move
    location.add(velocity);
  }

  //render player
  void display() {
    noFill();
    stroke(255);
    strokeWeight(2);
    ellipse(width/2, height/2, mass*5, mass*5);
  }

  //set mass and gravitational field in relation to number of orbiting entities
  void eat() {
    for (int i = 0; i < entities.length; i++) {
      if (dist(entities[i].location.x - width/2, entities[i].location.y - height/2, location.x, location.y) < gravField / gravDivider) {
        orbits ++;
      }
    }

    if (mass > massLimit) mass = massLimit;
    else mass = 4 + orbits;  //orbits +4 to avoid masses smaller than 4
    
    gravField = mass * 100;
    
    //reset orbits count each frame
    orbits = 0;
  }
}

//key press handlers. needed to use array of keypresses to allow for simultaneous keypresses, as 'KeyPressed' and 'KeyReleased' only contain most recent keys
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