
Terrain terrain = new Terrain();
Player player = new Player();
Entity[] entities = new Entity[1000];

void setup() {
  size(700, 700);
  noSmooth();

  for (int i = 0; i < 1000; i++) {
    entities[i] = new Entity(player.getX(), player.getY());
  }
}

void draw() {
  background(0);

  terrain.renderTerrain(player.getX(), player.getY());

  player.move();
  player.display();

  for (int i = 0; i < 1000; i++) {
    entities[i].move(player.getX(), player.getY(), player.getGravField());
    entities[i].display(player.getX(), player.getY());
    //if (entities[i]
  }
}