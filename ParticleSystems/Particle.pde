class Particle {
  PVector location;
  PVector velocity;
  float life;

  Particle(float location, float life) {
    this.location = location;
    this.life = life;
  }

  void play() {
    //
  }

  boolean dead() {
    if (life < 0) return true;
    else return false;
  }
}