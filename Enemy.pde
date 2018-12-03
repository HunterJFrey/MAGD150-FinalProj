class Enemy {
  float xPos;
  float yPos;
  float enemyWidth;
  float enemyHeight;
  float speed;
  int health;

  Enemy(float x, float y, float w, float h, float s) {
    xPos = x;
    yPos = y;
    enemyWidth = w;
    enemyHeight = h;
    speed = s;
    health = 100;
  }

  void checkMousePressed() {
    for (int i = enemy.size() - 1; i >= 0; i--) {
      if (mousePos.x > enemy.get(i).xPos && mousePos.x < enemy.get(i).xPos + enemy.get(i).enemyWidth
        && mousePos.y > enemy.get(i).yPos && mousePos.y < enemy.get(i).yPos + enemy.get(i).enemyHeight) {
        enemy.get(i).health -= player.damage;
        if (enemy.get(i).health <= 0) {
          enemy.remove(i);
          player.money += 10;
        }
      }
    }
  }

  void displayEnemy() {
    fill(255);
    rect(xPos, yPos, enemyWidth, enemyHeight); 
    fill(0);
    textSize(10);
    text(health, xPos + (enemyWidth / 6), yPos + (enemyHeight / 2));
  }

  void move() {
    xPos = xPos + speed;
    if (xPos > width + enemyWidth) {
      xPos = random(-150, -10);
      speed = random(1, 2);
    }
  }
}
