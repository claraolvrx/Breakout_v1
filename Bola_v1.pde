Bola a;



class Bola {
  int x, y, raio, dx, dy;
  Bola(int nx, int ny) {
    x= nx;
    y= ny;
    dx=7;
    dy=3;
    raio= 10;
  }
  void atualiza() {
    x += dx;
    y -= dy;
    //colisão com as paredes
    if (x - raio < 40) { //o raio passou pra esq, então tira
      dx = abs(dx); //estava dimuindo, vou aumentar
    }
    if (x + raio > width-40) { //o raio passou pra dir, então aumenta
      dx = -abs(dx); //estava aumentando, vou diminuir
    }
    if (y - raio < 90) {
      dy = -abs(dy);
    }
    if (y + raio > height) { //se cair pra fora
      dy = abs(dy); //reinicia o dy
      solta = false; //presa ao bastao
      vidas--; //dim vida
    }

    fill(360);
    ellipse(x, y, 2*raio, 2*raio);
  }
}
