class Bullet
{
  int xpos, ypos;
  int radius;
  color ballColor = color(255, 255, 20);

  Bullet(int xpos, int ypos)
  {
    this.xpos = xpos;
    this.ypos = ypos;
    radius = 12;
  }

  int x()
  {
    return xpos;
  }

  int y()
  {
    return ypos;
  }

  void move()
  {
    ypos-=2;
  }

  void draw()
  {
    fill(ballColor);
    noStroke();
    ellipse(int(xpos), int(ypos), radius, radius);
  }

  void collide(Alien alien[])
  {

    for (int i = 0; i < alien.length-1; i++)
    {
      if (xpos >= alien[i].xpos && xpos <= alien[i].xpos + alien[i].width
        && ypos >= alien[i].ypos && ypos <= alien[i].ypos + alien[i].height)
      {
        if (alien[i].status != EXPLODING && alien[i].status != DEAD)
        {
          alien[i].status = EXPLODING;
          alien[i].alienImage = explodingPic;
          //alien[i}.status ++;
        }
      }
    }
  }
}
