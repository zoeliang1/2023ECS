// Zoe Liang | 1 May 2023 | Collision Game
boolean play = false;
Frog macey;
Log log1;
Log log2;
Log log3;
Log log4;
Car car1;
Car car2;
Car car3;
Car car4;
int score = 0;
int random;
float logDist;
float log1Dist;
float log2Dist;
float log3Dist;
float carDist;
float car1Dist;
float car2Dist;
float car3Dist;

void setup() {
  size(500, 500);
  play = false;
  macey = new Frog();
  log1 = new Log();
  car1 = new Car();
  log2 = new Log();
  car2 = new Car();
  log3 = new Log();
  car3 = new Car();
  log4 = new Log();
  car4 = new Car();
  score = 0;
}

void draw() {
  println(logDist);
  if (play == false) {
    startScreen();
  } else {
    logDist = dist(macey.x, macey.y, log1.x, log1.y);
    log1Dist = dist(macey.x, macey.y, log2.x, log2.y);
    log2Dist = dist(macey.x, macey.y, log3.x, log3.y);
    log3Dist = dist(macey.x, macey.y, log4.x, log4.y);
    carDist = dist(macey.x, macey.y, car1.x, car1.y);
    car1Dist = dist(macey.x, macey.y, car2.x, car2.y);
    car2Dist = dist(macey.x, macey.y, car3.x, car3.y);
    car3Dist = dist(macey.x, macey.y, car4.x, car4.y);
    background(128);
    drawBackground();
    infoPanel();
    macey.display();
    car1.display();
    car1.move();
    log1.display();
    log1.move();
    log2.display();
    log2.move();
    log3.display();
    log3.move();
    log4.display();
    log4.move();
    car2.display();
    car2.move();
    car3.display();
    car3.move();
    car4.display();
    car4.move();
    if (logDist < 75) {
      score = score + 1;
    }
    if (log1Dist < 75) {
      score = score + 1;
    }
    if (log2Dist < 75) {
      score = score + 1;
    }
    if (log3Dist < 75) {
      score = score + 1;
    }
    if (carDist < 10) {
      score = score - 1;
      car1.x = width;
      gameOver();
    }
    if (car1Dist < 10) {
      score = score - 1;
      car2.x = width;
      gameOver();
    }
    if (car2Dist < 10) {
      score = score - 1;
      car2.x = width;
      gameOver();
    }
    if (car3Dist < 10) {
      score = score - 1;
      car2.x = width;
      gameOver();
    }
  }
}






void keyPressed () {
  if (key =='w' ||  key == 'W') {
    macey.move('w');
  } else if (key =='s' ||  key == 'S') {
    macey.move('s');
  } else if (key =='a' ||  key == 'A') {
    macey.move('a');
  } else if (key =='d' ||  key == 'D') {
    macey.move('d');
  } else if (key ==' ') {
    play = true;
  }
}



void drawBackground() {
  fill(#C3EEFA);
  rect(0, 400, width, 100);
}

void startScreen() {
  background(0);
  fill(255);
  text("Welcome to Frogger", 200, 250);
  text("By Zoe Liang", 220, 300);
  text("Press the space bar to start the game", 160, 350);
}

void gameOver() {
  background(#FFDCF4);
  fill(255);
  textSize(20);
  textAlign(CENTER);
  text("Game Over!", 200, height/2);
  text("Score:" + score, 200, 320);
  noLoop();
}

void infoPanel() {
  fill(#EAFBFF);
  rect (0, 0, width, 80);
  fill(0);
  text("Score:" + score, 20, 70);
  text("Avoid cars, hit logs!", 20, 50);
}

void target() {
  println(logDist);
  if (logDist<10) {
    score = score + 10;
    println(carDist);
    if (carDist <10) {
      score = score +10;
    }
  }
}
