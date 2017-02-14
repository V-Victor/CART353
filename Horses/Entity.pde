class Entity {
  PVector location = new PVector(0, 0);
  PVector velocity = new PVector(0, 0);
  PVector aceleration = new PVector(0, 0);

  float mass = random(1, 10);
  float minDist = 100.0;

  float rotation = 0.0;

  Entity() {
    location.x = width/2 + random(-5000, 5000);
    location.y = height/2 + random(-5000, 5000);
  }

  void move() {
    if (dist(location.x, location.y, player.getX(), player.getY()) < player.getGravField()) {
    }
  }

  void display(float x, float y) {
    noFill();
    stroke(255);
    strokeWeight(2);
    rectMode(CENTER);
    
    pushMatrix();
    translate(location.x - x, location.y - y);
    rotate(rotation += 0.1);
    rect(0, 0, 12, 12);
    popMatrix();
  }
}