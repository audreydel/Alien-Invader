/* Declare an array of Aliens */
final int SCREENX = 500;
final int SCREENY = 500;

Alien alien[];
PImage alienPic;
PImage explodingPic;
Player thePlayer;
ArrayList bullets;
Bomb bomb;

void settings()
{
  size(SCREENX, SCREENY);
}

void setup()
{
  /* create a new alien array */
  /* load the images */
  /* initialise the array */

  background(255);
  alienPic = loadImage("invader.gif");
  explodingPic = loadImage("exploding.gif");
  alien = new Alien[10];
  bullets = new ArrayList();
  init_aliens(alien, alienPic);
  thePlayer = new Player(SCREENY-PADDLEHEIGHT-2);
}

void init_aliens ( /* pass in your array, plus the image to use */Alien alien[], PImage alienPic)
{
  /* for each position in the array,  create a new alien at an appropriate
   starting point on the screen */
      bomb = new Bomb(100, 100);

  for (int i = 0; i < alien.length-1; i++)
  {
    alien[i] = new Alien(i*25, i*25, alienPic, alienHeight, margin);
      //bomb = new Bomb(100, 100);

  }

  //bomb = new Bomb(100, 100);
}

void draw()
{
  /* clear the screen */
  /* for each alien in the array - move the alien, then draw the alien */
  background(0);

  int deathCount = 0;
  for (int i = 0; i < alien.length-1; i++)
  {
    if (alien[i].status == DEAD )
    {
      deathCount++;
      if (deathCount >= alien.length)
      {
        thePlayer.win();
      }
    }
        if (alien[i].status == ALIVE)
    {
      bomb = alien[i].getBomb();
      alien[i].dropBomb();
    }
        alien[i].draw();
  if (alien[i].status == ALIVE && bomb.offScreen())
    {
      bomb = alien[i].getBomb();
      alien[i].dropBomb();
    }
    if (!thePlayer.gameOver())
    {
      alien[i].move();
    //if (alien[i].status == ALIVE)
    //{
    //  bomb = alien[i].getBomb();
    //  alien[i].dropBomb();
    //}
    }
  }

  for (int i = 0; i < bullets.size(); i++)
  {
    Bullet bullet = (Bullet) bullets.get(i);
    if (bullet != null)
    {
      if (bullet.y() < 0)
      {
        bullets.remove(i);
      }
      bullet.move();
      bullet.draw();
      bullet.collide(alien);
    }
  }

  if (!bomb.collide())
  {
    thePlayer.move(mouseX);
  }


  thePlayer.draw();

  bomb.move();
  bomb.draw();


  for (int i = 0; i < alien.length-1; i++)
  {
    if (alien[i].status == DEAD)
    {
      deathCount++;

      if (deathCount >=17)
      {
        thePlayer.win();
        thePlayer.gameOver();
      }
    }
  }


  thePlayer.gameOver();
}


void mousePressed()
{
  bullets.add(new Bullet(thePlayer.xpos + PADDLEWIDTH / 2, thePlayer.ypos + PADDLEHEIGHT/2));
}
