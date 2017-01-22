class Mixer {
  PImage source;
  PImage modifier;
  PImage remix;

  Mixer (PImage source, PImage modifier) {
    this.source = source;
    this.modifier = modifier;
    remix = createImage(source.width, source.height, RGB);
  }

  /*
  gets 'source' pixels and adds 'modifier' pixels (divided by modY) to them
   'modifier' is drawn in the resolution of 'source' - given differently sized images, this creates a spiraling pixel-glitch look due to pixel offset
   works no matter the size of the images, but looks nicer if 'modifier' is bigger than 'source'
   mouseX determines 'modifier' offset, mouseY determines brightness of 'modifier''s pixels
   */
  void oneRemix() {
    remix = createImage(source.width, source.height, RGB);
    int modX = 0;
    float modY = 0;

    loadPix();

    for (int i = 0; i < remix.width; i ++) {
      for (int j = 0; j < remix.height; j++) {
        int location = i + j * remix.width;

        modX = int(mouseX);
        modY = map(mouseY, 0, height, -10, 10);

        float r = constrain(red (source.pixels[location]) + (red (int(modifier.pixels[constrain(location - modX, 0, modifier.pixels.length - 1)]))) / modY, 0, 255);
        float g = constrain(green (source.pixels[location]) + (green (int(modifier.pixels[constrain(location - modX, 0, modifier.pixels.length - 1)]))) / modY, 0, 255);
        float b = constrain(blue (source.pixels[location]) + (blue (int(modifier.pixels[constrain(location - modX, 0, modifier.pixels.length - 1)]))) / modY, 0, 255);

        remix.pixels[constrain(location, 0, remix.pixels.length)] = color (r, g, b);
      }
    }
    updatePix();
  }

  //grabs average pixel color from 'modifier' (/ mod) and applies it as tint to 'source'
  void twoRemix() {
    remix = createImage(source.width, source.height, RGB);
    float mod = 0;

    float r = 0;
    float g = 0;
    float b = 0;

    loadPix();

    for (int i = 0; i < modifier.width; i ++) {
      for (int j = 0; j < modifier.height; j++) {
        int location = i + j * modifier.width;

        mod = map(mouseX, 0, width, 0, 5);

        r += red (modifier.pixels[location]);
        g += green (modifier.pixels[location]);
        b += blue (modifier.pixels[location]);
      }
    }
    r /= modifier.pixels.length / mod;
    g /= modifier.pixels.length / mod;
    g /= modifier.pixels.length / mod;

    remix = source;
    tint(color(r, g, b));
    updatePix();
  }

  /*
  prints 'source' pixels, and if the current 'modifier' pixel is sufficiently similar to 'source''s pixel (similarity threshold determinded by modX), switch to printing 'modifier' pixels, and vice-versa
   also, before switching the target image to print, check if pixelChecker has already run accross modY amount of suitable pixels (this creates a dynamic interval between image-drawing switches)
   */
  void threeRemix() {
    remix = createImage(source.width, source.height, RGB);
    float modX = 0;
    int modY = 0;
    int pixelChecker = 0;
    boolean flag = false;

    loadPix();

    for (int i = 0; i < remix.width; i ++) {
      for (int j = 0; j < remix.height; j++) {
        int location = i + j * remix.width;

        modX = map(mouseX, 0, width, 20, 240);
        modY = int(map(mouseY, 0, height, 1, 30));

        //gather 'source' and 'modifier' pixel details
        float sourceR = red (source.pixels[constrain(location, 0, source.pixels.length - 1)]);
        float sourceG = green (source.pixels[constrain(location, 0, source.pixels.length - 1)]);
        float sourceB = blue (source.pixels[constrain(location, 0, source.pixels.length - 1)]);

        float modifierR = red (modifier.pixels[constrain(location, 0, modifier.pixels.length - 1)]);
        float modifierG = green (modifier.pixels[constrain(location, 0, modifier.pixels.length - 1)]);
        float modifierB = blue (modifier.pixels[constrain(location, 0, modifier.pixels.length - 1)]);

        //check if 'source' pixel colors are sufficiently similar to 'modifier' pixel colors
        if (sourceR + modX >= modifierR && sourceR - modX <= modifierR) {
          if (sourceG + modX >= modifierG && sourceG - modX <= modifierG) {
            if (sourceB + modX >= modifierB && sourceB - modX <= modifierB) {
              //check if pixelChecker has come accross modY amount of pixels, to create dynamic interval between drawing switch
              if (pixelChecker >= modY) {
                flag = !flag;
                pixelChecker = 0;
              }
            }
          }
        }

        //draw chosen pixel
        if (flag) remix.pixels[location] = color (modifierR, modifierG, modifierB);
        else remix.pixels[location] = color (sourceR, sourceG, sourceB);

        pixelChecker ++;
      }
    }
    updatePix();
  }

  PImage getRemix() {
    return remix;
  }

  void loadPix() {
    noTint();
    loadPixels();
    source.loadPixels();
    modifier.loadPixels();
    remix.loadPixels();
  }

  void updatePix() {
    remix.updatePixels();
    modifier.updatePixels();
    source.updatePixels();
    updatePixels();
  }
}