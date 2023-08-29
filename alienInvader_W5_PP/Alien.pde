final int A_FORWARD = 0;
final int A_BACKWARD = 1;
final int A_DOWN = 2;

final int alienHeight = 25;

final int margin = 30;

//status
final int ALIVE = 0;
final int EXPLODING = 1;
final int DEAD = 4;

class Alien
{
  /* declare variables for alien position, direction of movement and appearance */
  int xpos, ypos, direction, down, status, height, width;

  PImage alienImage;
  Bomb bomb;
  /* Constructor is passed the x and y position where the alien is to
   be created, plus the image to be used to draw the alien */

  Alien(int xpos, int ypos, PImage alienImage, int height, int width)
  {
    /* set up the new alien object */
    this.xpos = xpos;
    this.ypos = ypos;
    this.alienImage = alienImage;
    this.height = height;
    this.width = width;

    direction = A_FORWARD;
    down = 0;
    status = ALIVE;
    bomb = new Bomb (xpos, ypos);
  }

  void move()
  {
    /* Move the alien according to the instructions in the exercise */

    if (direction == A_FORWARD)
    {
      xpos++;
      if (xpos == SCREENX - margin)   // go down hit side wall
      {
        direction = A_DOWN;
      }
    } else if (direction == A_DOWN)     // else if not moving forward -> moving down
    {
      ypos++;
      down++;

      if (down == alienHeight)
      {
        down = 0;
        if (xpos == 0)
        {
          direction = A_FORWARD;      // left side of screen -> move forward
        } else
        {
          direction = A_BACKWARD;    // right side -> move backwad
        }
      }
    } else                             // else if not moving forward & not moving down -> move backwards
    {
      xpos--;
      if (xpos == 0)
      {
        direction = A_DOWN;
      }
    }
  }

  void draw()
  {
    /* Draw the alien using the image() method demonstrated in class */
    if (status == ALIVE)
    {
      image(alienImage, xpos, ypos);
    } else if (status != DEAD)
    {
      image (explodingPic, xpos, ypos);
      status++;
    } else
    {
      image(alienImage, SCREENX+alienHeight, ypos);
    }
  }


  Bomb getBomb()
  {
    return bomb;
  }

  void dropBomb()
  {
    if (status == ALIVE && bomb.ypos > SCREENY + bomb.radius)
    {
      bomb = new Bomb(xpos, ypos);
    }
  }
}
