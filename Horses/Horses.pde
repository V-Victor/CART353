//number of objects
int entityNum = 1000;

//terrain, handles terrain generation and display
Terrain terrain = new Terrain();

//player, handles movement and personal gravity
Player player = new Player();

Entity[] entities = new Entity[entityNum];

void setup() {
  size(700, 700);
  noSmooth();

  //initialize entities to random location
  for (int i = 0; i < entities.length; i++) {
    entities[i] = new Entity(player.getX(), player.getY());
  }
}

void draw() {
  background(0);

  //render terrain
  terrain.renderTerrain(player.getX(), player.getY());

  //move player and display player model
  player.move();
  player.display();

  //move all entities in relation to player, and display them
  for (int i = 0; i < entities.length; i++) {
    entities[i].move(player.getX(), player.getY(), player.getGravField());
    entities[i].display(player.getX(), player.getY());
  }
  
  //change player's mass according to number of entities in gravitational field (eat())
  player.eat();
}