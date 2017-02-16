class Terrain {
  //variables for 2D perlin noise terrain
  float xOff;
  float yOff;
  float xStart = 0.0;
  float yStart = 1000.0;
  float increment = 0.005;

  //determines how much of map is white / black
  int mapThresh = 170;

  Terrain() {
  }

  void renderTerrain(float x, float y) {
    //get player 'abstract' coordinates in order to offset perlin noise seed and create illusion of movement
    xStart = x / 200;
    yStart = y / 200;

    loadPixels();
    float xOff = xStart;
    noiseDetail(2, 1);

    //pass through 2D noise and if noise value is high enough, render as white pixel
    for (int i = 0; i < width; i++) {
      xOff += increment;
      float yOff = yStart;

      for (int j = 0; j < height; j++) {
        int loc = i + j * width;
        yOff += increment;
        float bright = noise(xOff, yOff) * 255;

        if (bright < mapThresh) pixels[loc] = color(0);
        else pixels[loc] = color(255);
      }
    }
    updatePixels();
  }
}