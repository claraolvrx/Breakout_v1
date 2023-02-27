Blocos [][] bloc = new Blocos [10][7]; //declarando matriz (criando garagem)

class Blocos {
  int  posX, posY, larg, alt;
  boolean desenhaBloco;

  Blocos(int pX, int pY) {
    posY = (20 * pY)+90;
    posX = (pX * 62)+40;
    larg = 62;
    alt = 20;
    desenhaBloco = true;
  }
  void mostraBloco() {
    if (desenhaBloco == true) {
      rect(posX, posY, 62, 20);
    }
    hit1 = circleRect(a.x, a.y, a.raio, posX, posY, 62, 20);//colisão com os blocos
    
    if (desenhaBloco && hit1) {
      a.dy = -(a.dy); //rebate a bola
      pontos++; //adc 1 ponto
      desenhaBloco = false; //apaga o bloco
    }
  }
}
