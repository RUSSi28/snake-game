void setup(){
  size(420,420);
  background(100,200,100);
}

//先頭のｘ座標ｙ座標
int i = 210;
int j = 210;

//初めは左向きに進む
boolean left = true;
boolean right = false;
boolean up = false;
boolean down = false;

//配列
final int x[] = new int[(420*420)/20];
final int y[] = new int[(420*420)/20];
int bodyParts = 6;

//餌のランダム配置をするかしないか
boolean feed = true;

//餌のｘ座標とｙ座標
int feedX;
int feedY;

void draw(){

  frameRate(10);

　//フィールドの表示
  background(100,200,100);
  stroke(50,150,50);
  for(int k = 0;k <= 420;k = k + 20){
    line(k,0,k,height);
    line(0,k,width,k);
  }
  
  //ここがあまりよく分かっていない
  x[0] = i;
  y[0] = j;
  for(int s = bodyParts;s > 0;s --){
    x[s] = x[s - 1];
    y[s] = y[s - 1];
  }
  for(int s = 0;s < bodyParts;s ++){
      fill(100,100,200);
      ellipse(x[s],y[s],20,20);
  }

  //一番下で定義している
  snakeMove();

  //壁にぶつかったとき先頭を少し壁に埋まらせる？
  if(i < 10){
    i = -10;
  }else if(i > 410){
    i = 430;
  }else{}
  if(j < 10){
    j = -10;
  }else if(j > 410){
    j = 430;
  }else{}
  
  if(feed == true){
    feedX = 10+20*(int)random(20);
    feedY = 10+20*(int)random(20);
    feed = false;
  }
  fill(255,0,0);
  ellipse(feedX,feedY,20,20);
  
  textSize(20);
  fill(0);
  text("score:"+bodyParts,320,20);
  
  //餌を取ると身体が一つ増える
  if((i == feedX)&&(j == feedY)){
    feed = true;
    bodyParts = bodyParts + 1;
  }
  
  //snakeMove();の下のif文において、壁にぶつかったときにゲームオーバーになる
  if((i == -10)||(i == 430)||(j == -10)||(j == 430)){
    textSize(50);
    fill(255,0,0);
    text("game over",100,190);
    noLoop();
  }

  //先頭以外のすべてのパーツに対して先頭とぶつかるとゲームオーバーになる
  for(int s = 1;s < bodyParts;s ++)
    if(((i == x[s])&&(j == y[s]))&&((i != 210)&&(j != 210))){
      textSize(50);
      fill(255,0,0);
      text("game over",100,190);
      noLoop();
    }
  
}


//ゲームオーバー時にｒを押してリスタート
void keyPressed(){
    if(key == 'r'){
      background(0);
      feed = true;
      i = 210;
      j = 210;
      left = true;
      right = false;
      up = false;
      down = false;
      bodyParts = 6;
      loop();
      }
    }


//蛇の動き
void snakeMove(){
  if(keyPressed){
    if(keyCode == LEFT){
      left = true;
      right = false;
      up = false;
      down = false;
    }
    
    if(keyCode == RIGHT){
      left = false;
      right = true;
      up = false;
      down = false;
    }
    
    if(keyCode == UP){
      left = false;
      right = false;
      up = true;
      down = false;
    }
    
    if(keyCode == DOWN){
      left = false;
      right = false;
      up = false;
      down = true;
    }
  }
    
    
    if(right == true){
      i = i + 20;
    }else if(left == true){
      i = i - 20;
    }else if(up == true){
      j = j - 20;
    }else if(down == true){
      j = j + 20;
    }else{}



}
