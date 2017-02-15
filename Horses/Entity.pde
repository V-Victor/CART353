class Entity {
  PVector location = new PVector(0, 0);
  PVector velocity = new PVector(0, 0);
  PVector acceleration = new PVector(0, 0);

  float mass = random(1, 10);
  float minDist = 100.0;

  float rotation = 0.0;

  Entity(float x, float y) {
    location.x = x + random(-5000, 5000);
    location.y = y + random(-5000, 5000);
  }

  void move(float x, float y, float field) {
    if (dist(location.x, location.y, x+width/2, y+height/2) < field) {
      PVector player = new PVector(x+width/2, y+height/2);
      player.sub(location);
      player.setMag(0.1);
      acceleration.set(player);
      velocity.add(acceleration);
      location.add(velocity);
    }
  }

  void display(float x, float y) {
    noFill();
    stroke(255);
    strokeWeight(2);
    rectMode(CENTER);

    pushMatrix();
    translate(location.x - x, location.y - y);
    rotate(rotation += random(0.05, 0.1));
    rect(0, 0, 12, 12);
    popMatrix();
  }
}