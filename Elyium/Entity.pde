class Entity {
  //entity name
  String name;

  //location in real-world coordinates
  float latitude;
  float longitude;

  //cover image for entity
  PImage cover;
  boolean animate;

  //possible [conflicts] and their respective [choices] for narration sequence
  String[][] conflicts;

  //list of key decisions taken with this entity, used in narration construction to omit or allow certain choices
  boolean[] decisions;

  Entity(String name) {
  }

  public void assignLocation(float latitude, float longitude) {
    this.latitude = latitude;
    this.longitude = longitude;
  }
}