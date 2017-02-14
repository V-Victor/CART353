class Entity {
  PVector location = new PVector(0, 0);
  PVector velocity = new PVector(0, 0);
  PVector aceleration = new PVector(0, 0);

  float mass = random(1, 10);
  float minDist = 100;

  Entity() {
    location.x = player.getX() + random(-5000, 5000);
    location.y = player.getY() + random(-5000, 5000);
  }

  void move() {
    if (dist(location.x, location.y, player.getX(), player.getY()) < player.getGravField()) {
    }
  }

  void display(float x, float y) {
    noFill();
    stroke(255);
    strokeWeight(2);
    rect(location.x - x, location.y - y, 12, 12);
  }
}