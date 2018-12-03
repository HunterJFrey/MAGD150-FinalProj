class Player extends Environment {
  int money;
  int totalAmmo;
  int currentAmmo;
  int maxGunAmmo;
  int damage;
  int health;
  int currWeapon;
  PImage[] weapons = new PImage[4];



  Player() {
    currWeapon = 1;
    money = 0;
    currentAmmo = maxGunAmmo;
    totalAmmo = 50;
    health = 100;
  }

  void displayStats() {
    fill(0);
    textSize(15);

    text("Money: " + money + '$', (baseCollider + (baseCollider * .1)), (height * .2));
    text("Current Ammo: " + currentAmmo + "/" + maxGunAmmo, (baseCollider + (baseCollider * .05)), (height - (height * .07)));
    text("TotalAmmo: " + totalAmmo, (baseCollider + (baseCollider * .05)), (height - (height * .05)));
  }

  void loadImages() {
    weapons[0] = loadImage("stickPistol.png");
    weapons[1] = loadImage("stickSMG.png");
    weapons[2] = loadImage("stickRifle.png");
    weapons[3] = loadImage("stickSniper.png");
  }


  void buyAmmo() {
    if (money < 20) {
      return;
    } else {
      totalAmmo += 20;
      money -= 20;
    }
  }

  void changeWeapon(int wep) {
    switch(wep) {
    case 1:  //Pistol, top right in artboard
      maxGunAmmo = 9;
      damage = 10;
      displayWeapon(weapons[wep - 1]);
      break;
    case 2: //Short Rifle? bottom right in artboard
      maxGunAmmo = 18;
      damage = 20;
      displayWeapon(weapons[wep - 1]);
      break;
    case 3: //Assault Rifle? Top left in artboard
      maxGunAmmo = 26;
      damage = 30;
      displayWeapon(weapons[wep - 1]);
      break;
    case 4: //Sniper, bottom left in artboard
      maxGunAmmo = 1;
      damage = 25;
      displayWeapon(weapons[wep - 1]);
      break;
    default :
      break;
    }
  }


  void reload() {

    if (currentAmmo == maxGunAmmo) {
      return;
    } else if (totalAmmo >= maxGunAmmo) {
      if (totalAmmo == 0) {
        return;
      } else {
        currentAmmo = maxGunAmmo;
      }
    } else {
      if (totalAmmo == 0) {
        return;
      } else {
        currentAmmo += maxGunAmmo - currentAmmo;
      }
    }
  }

  void displayArm() {
    PVector direction = getDirection(40);
    stroke(0);
    strokeWeight(1);
    line(playerPos.x, playerPos.y, direction.x, direction.y);
  }

  PVector getDirection(float radius) {
    float a = atan2(mousePos.y - playerPos.y, mousePos.x - playerPos.x);

    float w = radius;
    float h = radius;
    float x = (w / 2 * h / 2) / sqrt(sq(h/2) + sq(w/2) * sq(tan(a)));
    if (abs(a) >= PI/2) {
      x *= -1;
    }
    float y = tan(a) * x;

    return new PVector(playerPos.x + x, playerPos.y + y);
  }

  void displayWeapon(PImage weapon) {
    PVector direction = getDirection(40);
    image(weapon, direction.x - 5, direction.y - 5);
  }
}
