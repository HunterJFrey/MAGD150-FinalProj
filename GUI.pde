class GUI {

  void displayGUI() {
    healthBar();
  }


  void crossHair(PVector pos, color red) {
    noFill();
    stroke(red);
    strokeWeight(1);
    ellipse(pos.x, pos.y, 10, 10);
    line(pos.x, (pos.y + 10), pos.x, (pos.y - 10));
    line((pos.x + 10), pos.y, (pos.x - 10), pos.y);
  }



  void healthBar() {
    fill(red);
    rect(0, 0, width, (height / 20));
  }
}
