
Terrain terrain = new Terrain();
Player player = new Player();

void setup() {
  size(700, 700);
}

void draw() {
  background(0);
  terrain.renderTerrain(player.getX(), player.getY());
  player.move();
  player.display();
}