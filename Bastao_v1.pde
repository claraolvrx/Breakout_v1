Bastao b;

class Bastao {
  int x, y, largura, altura;
  Bastao(int xb, int yb) {
    x= xb;
    y= yb;
    altura = 15;
    largura = 100;
  }
  void retangulo() {
    if (x<=90) {
      x=90;
    }
    if (x>=610) {
      x=610;
    }
    if (hit) {
      fill(360, 100, 100);
    } else
      fill(230); //colisao com paredes do cenario

    rect(x-50, y, largura, altura);
  }
}
