class Terrain {
  float xOff;
  float yOff;
  float xStart = 0.0;
  float yStart = 1000.0;
  float increment = 0.005;

  Terrain() {
  }

  void renderTerrain(float x, float y) {
    xStart = x / 200;
    yStart = y / 200;

    loadPixels();
    float xOff = xStart;
    noiseDetail(2, 1);

    for (int i = 0; i < width; i++) {
      xOff += increment;
      float yOff = yStart;

      for (int j = 0; j < height; j++) {
        int loc = i + j * width;
        yOff += increment;
        float bright = noise(xOff, yOff) * 255;
        pixels[loc] = color(bright);
      }
    }

    for (int i = 0; i < width; i++) {
      for (int j = 0; j < height; j++) {
        int loc = i + j * width;
        float bright = brightness(pixels[loc]);

        if (bright < 170) pixels[loc] = color(0);
        else pixels[loc] = color(255);
      }
    }
    updatePixels();
  }
}