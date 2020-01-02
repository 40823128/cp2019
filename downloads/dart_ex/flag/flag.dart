import 'dart:html';
import 'dart:math' as Math;

CanvasElement canvas;
CanvasRenderingContext2D ctx;
int flag_w = 300;
int flag_h = 200;
num circle_x = flag_w / 2;
num circle_y = flag_h / 2;

void main() {
  canvas = querySelector('#canvas');
  ctx = canvas.getContext('2d');


  querySelector("#jp").onClick.listen((e) => drawJP(ctx));
  querySelector("#ru").onClick.listen((e) => drawRU(ctx));
  querySelector("#fr").onClick.listen((e) => drawFR(ctx));
  querySelector("#button").onClick.listen((e) => clearCanvas());
  querySelector("#roc").onClick.listen((e) => drawROC(ctx));
}

void drawJP(ctx){
  ctx.clearRect(0, 0, flag_w, flag_h);
  ctx.fillStyle = '#fff';
  ctx.fillRect(0, 0, flag_w, flag_h);
  ctx.beginPath();
  ctx.arc(circle_x, circle_y, 60, 0, Math.pi * 2, true);
  ctx.closePath();
  ctx.fillStyle = 'rgb(188,0,45)';
  ctx.fill();
}
num circle_a = flag_w / 4;
num circle_b = flag_h / 4;
void drawROC(ctx){
  // 先畫滿地紅
  ctx.clearRect(0, 0, flag_w, flag_h);
  ctx.fillStyle = 'rgb(255, 0, 0)';
  ctx.fillRect(0, 0, flag_w, flag_h);
  // 再畫青天
  ctx.fillStyle = 'rgb(0, 0, 150)';
  ctx.fillRect(0, 0, flag_w / 2, flag_h / 2);
  // 畫十二道光芒白日
  ctx.beginPath();
  num star_radius = flag_w / 8;
  num angle = 0;
  for (int i = 0; i < 25; i++) {
    angle += 5 * Math.pi * 2 / 12;
    num toX = circle_a + Math.cos(angle) * star_radius;
    num toY = circle_b + Math.sin(angle) * star_radius;
    // 只有 i 為 0 時移動到 toX, toY, 其餘都進行 lineTo
    if (i != 0)
      ctx.lineTo(toX, toY);
    else
      ctx.moveTo(toX, toY);
  }
  ctx.closePath();
  // 將填色設為白色
  ctx.fillStyle = '#fff';
  ctx.fill();
  // 白日:藍圈
  ctx.beginPath();
  ctx.arc(circle_a, circle_b, flag_w * 17 / 240, 0, Math.pi * 2, true);
  ctx.closePath();
  // 填色設為藍色
  ctx.fillStyle = 'rgb(0, 0, 149)';
  ctx.fill();
  // 白日:白心
  ctx.beginPath();
  ctx.arc(circle_a, circle_b, flag_w / 16, 0, Math.pi * 2, true);
  ctx.closePath();
  // 填色設為白色
  ctx.fillStyle = '#fff';
  ctx.fill();
  ctx.clearRect(300,0, 200, 300);
}
 void drawFR(ctx){
  ctx.clearRect(0, 0, flag_w, flag_h);
  ctx.fillStyle = 'rgb(250,60,50)';
  ctx.fillRect(0, 0, flag_w, flag_h);
  ctx.fillStyle = 'rgb(255, 255, 255)';
  ctx.fillRect(0, 0,flag_w*63/100, flag_h);
  ctx.fillStyle = 'rgb(0,85,164)';
  ctx.fillRect(0, 0,flag_w*30/100, flag_h);
  ctx.clearRect(300,0, 200, 300);
  
}
void drawRU(ctx){
  ctx.clearRect(0, 0, flag_w, flag_h);
  ctx.fillStyle = 'rgb(225,37,29)';
  ctx.fillRect(0, 0, flag_w, flag_h);
  ctx.fillStyle = 'rgb(0,61,165)';
  ctx.fillRect(0, 0,flag_w, flag_h*2/3);
  ctx.fillStyle = 'rgb(255,255,255)';
  ctx.fillRect(0, 0,flag_w, flag_h*1/3);
  ctx.clearRect(300,0, 200, 300);
   
 
}
void clearCanvas(){
  ctx.clearRect(0, 0, flag_w, flag_h);
}
