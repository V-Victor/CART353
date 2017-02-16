class Entity {
  //physics
  PVector location = new PVector(0, 0);
  PVector velocity = new PVector(0, 0);
  PVector acceleration = new PVector(0, 0);

  //distance from player
  float distance = 0;

  //mass (determines acceleration)
  float mass = random(1, 5);

  //used for rotation animation
  float rotation = 0.0;

  Entity(float x, float y) {
    location.x = x + random(-5000, 5000);
    location.y = y + random(-5000, 5000);
  }

  void move(float x, float y, float field) {
    distance = dist(location.x, location.y, x+width/2, y+height/2);

    //if entity is sufficiently close, set it to be attracted to the player (different strenght of attraction depending on its distance)
    if (distance < field) {
      PVector player = new PVector(x+width/2, y+height/2);
      player.sub(location);
      player.setMag(0.1 * distance / 60);
      acceleration.set(player);
      acceleration.div(mass);
      velocity.add(acceleration);
      location.add(velocity);
    }
  }

  //display entity through matrix translation (for animated rotation)
  void display(float x, float y) {
    noFill();
    stroke(255);
    strokeWeight(2);
    rectMode(CENTER);

    pushMatrix();
    translate(location.x - x, location.y - y);
    rotate(rotation += random(0.05, 0.1));
    rect(0, 0, mass + 2, mass + 2);
    popMatrix();
  }
}