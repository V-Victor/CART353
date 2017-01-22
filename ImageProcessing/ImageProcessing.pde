//3 different modes to mix images
int mode = 0;

//counter that increments each time an image is saved and included in the image filename, allowing multiple images to be saved while Processing is running without overwriting any files
int imageNum = 0;

//boolean to keep track of keystate to avoid multiple keypresses
boolean keyReady = true;

//used to determine UI opacity to allow it to fade over time
float opacity = 255;

//boolean used for third mix method, flipped using user input (mouse click)
boolean continuous = false;

PImage source;
PImage modifier;
PImage remix;

Mixer mix;

void setup() {
  size (400, 400);
  frameRate(30);

  //load images ('source' is to be modified through 'modifier', remix is the result)
  //modifier = loadImage("http://i.imgur.com/NZwYggo.jpg");
  //source = loadImage("http://wallpapercave.com/wp/Jzn5hwl.jpg");
  source = loadImage("https://i.ytimg.com/vi/lt0WQ8JzLz4/maxresdefault.jpg");
  modifier = loadImage("http://weknowyourdreams.com/images/space/space-03.jpg");
  remix = createImage(source.width, source.height, RGB);

  //set Processing window to the remix image's size (/2 if image is too big)
  if (remix.width > 1920 || remix.height > 1080) surface.setSize(remix.width/2, remix.height/2);
  else surface.setSize(remix.width, remix.height);

  mix = new Mixer(source, modifier);
}

void draw() {
  background(0);

  //remix images
  switch (mode) {
  case 0:
    mix.oneRemix();
    remix = mix.getRemix();
    break;

  case 1:
    mix.twoRemix();
    remix = mix.getRemix();
    break;

  case 2:
    mix.threeRemix(continuous);
    remix = mix.getRemix();
    break;
  }

  //display image and UI
  image(remix, 0, 0);
  textSize(50);
  textAlign(RIGHT);
  fill(255, 255, 255, opacity);
  text("M" + (mode+1), width - 100, height - 100);

  //controls
  if (keyPressed && keyReady) {
    switch (key) {
    case ' ':                           //'space' to save image
      save("Remix" + imageNum + ".png");
      imageNum ++;
      keyReady = false;
      break;

    case '/':                           //'slash' to cycle through mix modes
      if (mode < 2) mode += 1;
      else mode = 0;
      opacity = 255;
      keyReady = false;
      break;

    case '.':                           //'period' to flip 'continuous'
      continuous = !continuous;
      keyReady = false;
    }
  }

  //reset keystate when key not pressed
  if (keyPressed == false) keyReady = true;

  //fade opacity over time
  if (opacity > 0) opacity -= 10;
}