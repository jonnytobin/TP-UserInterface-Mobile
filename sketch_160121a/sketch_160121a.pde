PImage [] tshirt;
boolean rightButtonOver = false;
boolean leftButtonOver = false;
int buttonSize = 20;
int buttonRightX, buttonRightY, buttonLeftX, buttonLeftY;
int buttonRight01X, buttonRight01Y, buttonRight02X, buttonRight02Y, buttonRight03X, buttonRight03Y, buttonLeft01X, buttonLeft01Y, buttonLeft02X, buttonLeft02Y, buttonLeft03X, buttonLeft03Y;
int count;


void setup() {
  tshirt = new PImage[5];
  for ( int i=0; i<tshirt.length; i++) {
    tshirt[i] = loadImage(i+".png");
  }
  count = 0;
  size(600, 400);
  background(50);
  smooth();
  //buttonLeftX = 30;
  //buttonLeftY = 300;
  //buttonRightX = width-30;
  //buttonRightY = 300;
  buttonRight01X = width-30;
  buttonRight01Y = 225;
  buttonRight02X = width-30;
  buttonRight02Y = 170;
  buttonRight03X = width-15;
  buttonRight03Y = 197;
  
  buttonLeft01X = 30;
  buttonLeft01Y = 225;
  buttonLeft02X = 30;
  buttonLeft02Y = 170;
  buttonLeft03X = 15;
  buttonLeft03Y = 197;
}

void draw() {
  update(mouseX, mouseY); 
  background(50);
  triangle(buttonRight01X, buttonRight01Y, buttonRight02X, buttonRight02Y, buttonRight03X, buttonRight03Y);
  triangle(buttonLeft01X, buttonLeft01Y, buttonLeft02X, buttonLeft02Y, buttonLeft03X, buttonLeft03Y);
  image(tshirt[count], width/2-100, height/2-100);
  noStroke();
  //triangle(30, 225, 30, 170, 15, 197);
  //triangle(width-30, 225, width-30, 170, width-15, 197);
}

void update(int x, int y) {
  if (overRightButton(buttonRight01X, buttonRight01Y, buttonRight02X, buttonRight02Y, buttonRight03X, buttonRight03Y)) {
    rightButtonOver = true;
    leftButtonOver = false;
  } else if (overLeftButton(buttonLeft01X, buttonLeft01Y, buttonLeft02X, buttonLeft02Y, buttonLeft03X, buttonLeft03Y)) {
    leftButtonOver = true;
    rightButtonOver = false;
  } else {
    leftButtonOver = rightButtonOver = false;
  }
}

void mousePressed() {
  if (rightButtonOver) {
    count = (count+1)%tshirt.length;
  }
  if (leftButtonOver) {
    count--; 
    if (count < 0) { 
      count = tshirt.length-1;
    }
  }
}

boolean overRightButton(int x, int y, int x1, int y1, int x2, int y2) {
  if ((mouseX >= x && mouseX <= x2) && (mouseY >= y1 && mouseY <= y)) {
    print("overRightButton");
    return true;
  } else {
    return false;
  }
}

boolean overLeftButton(int x, int y, int x1, int y1, int x2, int y2) {
  if ((mouseX >= x2 && mouseX <= x) && (mouseY >= y1 && mouseY <= y)) {
    print("overLeftButton");
    return true;
  } else {
    return false;
  }
}