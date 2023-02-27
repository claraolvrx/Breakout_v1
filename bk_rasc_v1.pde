int v1, v2, real, pontos, vidas;
boolean solta, hit, hit1, gameover, win;

void setup() {
  colorMode(HSB, 360, 100, 100);
  size(700, 500);
  noStroke();

  a = new Bola(350, 439);
  vidas = 3;
  solta = false;

  for (int x = 0; x < 10; x++) {
    for (int y = 0; y < 7; y++) {
      bloc[x][y] = new Blocos(x, y);
    }
  } //preenchendo matriz com objetos do tipo blocos (enchendo as garagens)
}

void draw() {
  background(0);
  b = new Bastao(mouseX, 450); //atualizando o x do bastao de acordo com mouseX

  cx = a.x;         // circle position (set with mouse)
  cy = a.y;
  r = a.raio;       // circle radius
  sx = b.x-50;         // square position
  sy = b.y;
  sw = b.largura;   // and dimensions
  sh = b.altura;

  if (gameover==false && win==false) { //se gameover for false desenha tudo
    //cenário
    cenario();
    //blocos
    for (int x = 0; x < 10; x++) {
      for (int y = 0; y < 7; y++) {
        fill(y*40, 60, 70); //preenchimento em degrade
        bloc[x][y].mostraBloco(); //ativo a função pra cada um dos blocos
      }
    }
    //bastão
    b.retangulo();
    //bola
    if (solta ==  false) {
      fill(360);
      ellipse(b.x, 439, 20, 20);
    }
    if (mousePressed && solta==false) { //iniciar a bola
      a.x = b.x; //pegando o x do bastão
      a.y = 439;
      solta = true;
    }
    if (solta ==  true) {
      a.atualiza(); //movimentação da bola
      hit = circleRect(cx, cy, r, sx, sy, sw, sh); //colisao com bastão
    }
    if (hit) {
      a.dy = abs(a.dy); //se colidiu inverte o sinal da adição
    }
    //pontos
    pontos();
    //vida
    vidas();
  } 
  if (gameover) { //se gameover for true não desenha nada
    textSize(50);
    text("GAME OVER", width/2-120, height/2);
    textSize(35);
    text("pontuação: " + pontos, width/2-85, height/2+50);
  }

  if (pontos>=70) { //se quebrar todos os blocos ganhou!
    win=true;
  }
  if (win) { //se win for true não desenha nada
    textSize(50);
    text("CONGRATULATIONS", width/2-240, height/2);
    textSize(35);
    text("you escaped from prision", width/2-195, height/2+50);
  }
}

void cenario() {
  fill(135);
  rect(0, 50, 40, 450);
  rect(0, 50, 700, 40);
  rect(660, 50, 40, 450);
  fill(230);
  rect(300, 50, 100, 40);
}

void pontos() {
  fill(255);
  textSize(20);
  text(pontos, 10, 30);
}

void vidas() {
  if (vidas >= 3)
    rect(width- 70, 30, 10, 10);
  if (vidas >=2)
    rect(width- 50, 30, 10, 10);
  if (vidas >=1)
    rect(width- 30, 30, 10, 10);
  else 
  gameover=true;
}
