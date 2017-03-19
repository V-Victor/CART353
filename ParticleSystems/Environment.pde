class Environment {
  float time = 0.0;
  float timeSpeed = 0.004;
  float pointer = 0.0;

  float noiseLocOne = 0.0;
  float noiseLocTwo = 100.0;
  float noiseLocThree = 1000.0;
  float noiseInc = 0.001;
  int move = 0;

  color day = color(235, 200, 130);
  color night = color(0, 25, 65);

  Environment() {
    //
  }

  public void play() {
    pointer += timeSpeed;
    time = sin(pointer);
    time = map(time, -1, 1, 0, 1);
    background(map(time, 0, 1, 0, 255));

    if (move <= 10) move++;
    else move = 0;

    if (move % 10 == 0) noiseLocThree += noiseInc;
    if (move % 5 == 0) noiseLocTwo += noiseInc;
    noiseLocOne += noiseInc;

    noiseDetail(16);
    drawTerrain(90, noiseLocThree);
    noiseDetail(8);
    drawTerrain(120, noiseLocTwo);
    noiseDetail(4);
    drawTerrain(180, noiseLocOne);

    fill(lerpColor(night, day, time), 120);
    rect(0, 0, width, height);
  }

  private void drawTerrain(int fill, float noiseLoc) {
    fill(fill);
    beginShape();
    vertex(0, height);
    for (int i = 0; i < width; i++) {
      float n = noiseLoc + noiseInc * i;
      float h = noise(n);
      h = map(h, 0, 1, height/2, height);
      vertex(i, h);
    }
    vertex(width, height);
    endShape(CLOSE);
  }
}