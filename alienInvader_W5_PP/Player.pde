final int PADDLEHEIGHT = 20;
final int PADDLEWIDTH = 80;
final int MARGIN = 10;

class Player
{
  int xpos;
  int ypos;
  color paddlecolor = color(255, 0, 0);
  Player(int screen_y)
  {
    xpos=SCREENX/2;
    ypos=screen_y;
  }
  void move(int x)
  {
    if (x>SCREENX-PADDLEWIDTH) xpos = SCREENX-PADDLEWIDTH;
    else xpos=x;
  }
  void draw()
  {
    fill(paddlecolor);
    rect(xpos, ypos, PADDLEWIDTH, PADDLEHEIGHT);
  }

  boolean gameOver()
  {
    if (bomb.collide())
    {
      textSize(30);
      fill (0, 255, 255);
      text("GAME OVER ;(", SCREENX/3, SCREENY/2);
      return true;
    } else
    {
      return false;
    }
  }

  void win()
  {

    textSize(30);
    fill (0, 255, 255);
    text("Slay you won", SCREENX/3, SCREENY/2);
  }
}
