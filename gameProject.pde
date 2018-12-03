final color red = color(255, 0, 0);
PVector mousePos = new PVector();
PVector playerPos;
PVector collisionStartPoint = new PVector();
PVector collisionEndPoint = new PVector();
PImage muzzleFlash;
ArrayList<Enemy> enemy = new ArrayList<Enemy>();
int health = 100;
int waveLength = 4;
Player player;
Environment environment;
GUI gui;



void setup() {
  fullScreen();
  muzzleFlash = loadImage("muzzleFlash.png");

  environment = new Environment();
  environment.loadImages();
  playerPos =  environment.getPlayerPos();

  gui = new GUI();


  player = new Player();
  player.loadImages();
}

void draw() {
  background(#009AFF);

  environment.displayEnvironment();

  mousePos.x = mouseX;
  mousePos.y = mouseY;

  gui.crossHair(mousePos, red);
  gui.displayGUI();


  player.displayArm();
  player.displayStats();
  makeEnemies();
  passedCollisionLine();
  endGame();
}

void endGame() {
  if (player.health == 0) {
    fill(0);
    rect(0, 0, height, width);
  }
}

void passedCollisionLine() {
  for (int i = enemy.size() - 1; i >= 0; i--) {
    if (enemy.get(i).xPos > environment.baseCollider) {
      enemy.remove(i);
      player.health -= 10;
    }
  }
}



void mousePressed() {
  PVector muzzle = player.getDirection(40);
  image(muzzleFlash, muzzle.x - 5, muzzle.y - 5, 15, 15);
  if (player.currentAmmo > 0) {
    for (int i = 0; i < enemy.size(); i++) {
      enemy.get(i).checkMousePressed();
    }
    if (player.totalAmmo > 0) {
      player.currentAmmo--;
      player.totalAmmo--;
    } else {
      player.currentAmmo--;
    }
  }
}

void keyPressed() {
  if (key == 'r' || key == 'R') {
    player.reload();
  } else if (key == 'b' || key == 'B') {
    player.buyAmmo();
  } else if (key == '1') {
    player.changeWeapon(1);
  } else if (key == '2') {
    player.changeWeapon(2);
    //player.displayWeapon(2);
  } else if (key == '3') {
    player.changeWeapon(3);
    //player.displayWeapon(3);
  } else if (key == '4') {
    player.changeWeapon(4);
    //player.displayWeapon(4);
  }
}



void makeEnemies() {
  fill(255);

  if (enemy.size() == 0) {
    for (int i = 0; i < waveLength; i++) {
      enemy.add(new Enemy(random(-100, 0), 670f, 20f, 30f, random(1, 2)));
    } 
    waveLength++;
  }

  for (int i = 0; i < enemy.size(); i++) {
    enemy.get(i).move();
    enemy.get(i).displayEnemy();
  }
}
