class Environment {
  float skyMeetsGround = height * .7;
  float baseCollider = width * .8;
  float ceilingHeight = height * .6;
  float floorHeight = height * .9;

  PImage base;
  PImage tower;
  PImage charMain;
  PImage grass;

  void displayEnvironment() {
    noStroke();
    fill(100, 100, 250, 100);//Sky
    quad(0, 0, width, 0, width, skyMeetsGround, 0, skyMeetsGround);

    noFill();//Ground
    image(grass, 0, skyMeetsGround, width, floorHeight);
    //quad(0, skyMeetsGround, width, skyMeetsGround, width, height, 0, height);

    noFill();//Base
    image(base, baseCollider, ceilingHeight);
    //Tower
    image(tower, (baseCollider + (base.width / 6)), (ceilingHeight - (base.height / 1.7)));
    //Player Body
    image(charMain, (baseCollider + (base.width * .31)), (ceilingHeight + (base.height * .22)));
  }

  PVector getPlayerPos() {
    PVector playerPos = new PVector((baseCollider + (base.width * .35)), (ceilingHeight + (base.height * .33)));
    return playerPos;
  }

  void loadImages() {
    base = loadImage("buildingComplete.png");
    tower = loadImage("topTower.png");
    charMain = loadImage("mainChar.png");
    grass = loadImage("grass.png");
  }
}
