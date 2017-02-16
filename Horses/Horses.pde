int entityNum = 1000;
Terrain terrain = new Terrain();
Player player = new Player();
Entity[] entities = new Entity[entityNum];

void setup() {
  size(700, 700);
  noSmooth();

  for (int i = 0; i < entities.length; i++) {
    entities[i] = new Entity(player.getX(), player.getY());
  }
}

void draw() {
  background(0);

  terrain.renderTerrain(player.getX(), player.getY());

  player.move();
  player.display();

  for (int i = 0; i < entities.length; i++) {
    entities[i].move(player.getX(), player.getY(), player.getGravField());
    entities[i].display(player.getX(), player.getY());
  }
  
  player.eat();
}