class Interface {

  //1 = loading. 2 = narrative. 3 = intermediate / walking
  int state = 1;

  Interface() {
  }

  public void display() {
    switch (state) {
    case 1:
      loading();
      break;

    case 2:
      narrative();
      break;

    case 3:
      inter();
      break;

    default:
      loading();
      break;
    }
  }

  private void loading() {
  }

  private void inter() {
  }

  private void narrative() {
  }

  private void transition() {
  }

  private void ASCII(PImage source) {
  }
}