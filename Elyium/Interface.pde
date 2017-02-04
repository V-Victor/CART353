class Interface {

  //1 = loading - intermediate/walking. 2 = narrative. 3 = transition.
  int state = 1;

  Interface() {
  }

  public void display() {
    switch (state) {
    case 1:
      inter();
      break;

    case 2:
      narrative();
      break;

    case 3:
      transition();
      break;

    default:
      inter();
      break;
    }

    data();
  }

  //polish
  private void inter() {
  }

  private void narrative() {
  }

  //polish
  private void transition() {
  }

  private void ASCII(PImage source) {
  }

  //DEBUGGING
  private void data() {
    textAlign(RIGHT);
    //coordinates
    if (mapper.getHasLocation()) {
      text("Lat: " + mapper.getLatitude(), width, height - 50);
      text("Lon: " + mapper.getLongitude(), width, height - 70);
    } else {
      text("No permissions to access location", width, height - 10);
    }

    //accelorometer values
    text("X: " + accelorometer.ax, width, height - 140);
    text("Y: " + accelorometer.ay, width, height - 120);
    text("Z: " + accelorometer.az, width, height - 100);
  }
}