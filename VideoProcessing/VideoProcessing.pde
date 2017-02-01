//summary: gaussian radius centered on mouse determines the chance of drawing a slightly transparent ellipses (depending on their distance from the mouse) which are drawn over video pixels, their size dictated by 2D perlin noise.

import processing.video.*;

Movie video;

//range determines the how much the gaussian radius will be multiplied by
int range = 45;

//xOff, yOff, and increment deal with the 2D offsets of perlin noise
float xOff = 0;
float yOff = 1000;
float increment = 0.1;

//size determines the size of the ellipses that will be drawn over the pixels
float size = 15;

void setup() {
  size(640, 360);
  frameRate(60);
  video = new Movie(this, "cloud.mp4");
  video.loop();
}

void draw() {
  image(video, 0, 0);

  loadPixels();
  video.loadPixels();

  //nested loops to pass through all video pixels
  for (int x = 0; x < video.width; x++) {
    //reset xOff each row to keep 2D perlin noise consistent
    xOff = 0;
    for (int y = 0; y < video.height; y++) {

      //generate a gaussian radius
      float space = abs(randomGaussian() * range);

      //generate perlin noise
      size = noise(xOff, yOff) * 20;

      //verify if currently scanned pixel is within range of mouse, according to gaussian radius
      if (dist (mouseX, mouseY, x, y) < space) {
        int loc = x + y * video.width;

        float r = red(video.pixels[loc]);
        float g = green(video.pixels[loc]);
        float b = blue(video.pixels[loc]);

        noStroke();
        fill(r, g, b, 100);
        ellipse(x, y, size, size);
      }
      xOff += increment;
    }
    yOff += increment;
  }
}

void movieEvent(Movie video) {
  video.read();
}