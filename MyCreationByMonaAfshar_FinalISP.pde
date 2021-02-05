//Mona Afshar
//05/17/2020
//Mrs.Basaraba
//Write a program with animations and a storyline with water creatures. The tropical fish swims with the turtle because they are friends. 
//But then they bump into the whale. They say sorry and keep swimming until the shark realizes and starts to follow them. When the shark wants 
//to eat the fish the whale comes in and blocks him, the shark gets scared and swim away.

//decleration
float tropicalX=740, tropicalY=140, tropicalR;//the location of the fish on the x axis, y axis and the rotation
float turtleX=300, turtleY=350, turtleR;//places of turtle on X, y axis and the rotation
float turtle2X=-100, turtle2Y=350, turtle2R=90;//places of turtle on X, y axis and the rotation during the intro of the code
float whaleX=300, whaleY=200, whaleR;//places of original whale on X, y axis and the rotation
float whale2X=1000, whale2Y=200, whale2R;//places of the second whale (it is the reflection of the original whale) on X, y axis and the rotation
float whale3X=-100, whale3Y=200;//places of original whale on X, y axis during the introduction of the code
float sharkX=650, sharkY=420, sharkR;//places of shark on X, y axis and the rotation
float shark2X=-90, shark2Y=380, shark2R;//place of the reflected shark on the X and Y axis during the introduction of the code
float shark3X=800, shark3Y=420;//places of shark on X, y axis and the rotation
float browX1=0+55, browY1=0-45, browX2=0+50, browY2=0-50;//the eyebrow of the shark when it gets scared of the whale
int counter=-220;//the counter for the different scenes during the code

void setup()
{
  size(800,500);//screen size
  frameRate(80);//speed
}
void myBackground()
{
  sky();//the blue sky above the waves
  sand();//the sand at the bottom of the screen
  water();//the water with the waves
  fish();//the small fish 
  starfish();//the starfish in the corner
}
void draw()
{
  myBackground();//^
  whale();
  shark();
  tropicalFish();
  turtle();
  speech();
  if(counter<0)//before the code starts. If the counter is still negatve
    openScene();//the opening scene where the animals come into the screen
  extrabackgrounds();//the background changes
  counter++;//counter to count the repetitions
}
void sky()
{
  stroke(#16AAD6);//set blue sky colour
  strokeWeight(20);
  for(int skyY=0; skyY<=50; skyY+=10)
    line(0,skyY,800,skyY);//blue sky at the top
}
void water()
{
  noStroke();
  fill(#1264CB);
  ellipse(120,60,240,40);//waves
  ellipse(340,60,240,40);//waves
  ellipse(560,60,240,40);//waves
  ellipse(800,60,240,40);//waves

  stroke(#1264CB);//set dark blue water colour
  strokeWeight(50);
  for(int waterY=80; waterY<=440; waterY+=20)
    line(0,waterY,800,waterY);//rectangle for background water
}
void sand()
{
  stroke(#E3C7A9);//set sand colour
  strokeWeight(20);
  for(int sandY=460; sandY<=500; sandY+=20)
    line(0,sandY,800,sandY);
}
void fish()
{
  stroke(#6C6B6C);
  strokeWeight(7);
  for(int fish=40; fish>0; fish-=1)
    ellipse(80,120,fish,15);//top fish body
  triangle(60,120,40,115,40,125);//tale
  stroke(#139CAD);
  for(int fish=40; fish>0; fish-=1)
    ellipse(80,170,fish,15);//middle fish body
  triangle(60,170,40,165,40,175);//tale
  stroke(#A02CF5);
  for(int fish=40; fish>0; fish-=1)
    ellipse(80,220,fish,15);//bottom fish body
  triangle(60,220,40,215,40,225);//tale
  
}
void starfish()
{
  stroke(#F2A1D7);//set pink colour
  strokeWeight(5);
  for(int starfish=400; starfish<440; starfish+=5)
    line(60,starfish,100,starfish);//body
  strokeWeight(15);
  triangle(120,400,100,400,100,430);//limbs
  triangle(40,400,60,400,60,430);//limbs
  triangle(80,380,97,400,62,400);//limbs
  triangle(60,430,50,450,80,440);//limbs
  triangle(110,450,100,430,80,440);//limbs
}
void shark()
{
  if(whale2X<=700)//when the whale comes back into the screen
  {
    sharkR=20;
    sharkX-=3;//chase the tropical fish and the turtle
    sharkY--;
  }
  pushMatrix();//original shark drawing
  translate(sharkX, sharkY);//move to starting location
  rotate(radians(sharkR));//turn
  noStroke();
  fill(#8281A0);//set grey colour
  arc(0,0-40,180,40,radians(180),radians(360));//body
  arc(0,0-40,180,50,radians(0),radians(180));//body
  quad(0+130,0,0+90,0-40,0+130,0-80,0+110,0-40);//finn or tale
  triangle(0,0-60,0+40,0-90,0+40,0-50);//top finn
  triangle(0+20,0+10,0+40,0-20,0,0-20);//bottom finn
  fill(255);//set white colour
  ellipse(0-50,0-40,10,10);//eye
  fill(0);//set black mouth colour
  triangle(0-20,0-30,0-20,0-15,0-40,0-17);//mouth
  stroke(0);
  strokeWeight(4);
  point(0-53,0-40);//eyeball
  line(0-55,0-45,0-50,0-50);//eyebrow
  popMatrix();
  
  if(sharkX<-150 && whale2X==699)//when the shark turns around and comes to eat the fish/turtle
  {
    shark2X++;
  }
  if(turtleX==400 && whale2X<302 && counter>1800)//when the shark gets scared
  {
    browX1=0+46;
    browX2=0+51;
    browY1=0-45;
    browY2=0-50;
    shark2X-=2;
  }
  pushMatrix();//reflection of shark
  translate(shark2X, shark2Y);
  rotate(radians(shark2R));
  noStroke();
  fill(#8281A0);//set grey colour
  arc(0,0-40,180,40,radians(180),radians(360));//body
  arc(0,0-40,180,50,radians(0),radians(180));//body
  quad(0-130,0,0-110,0-40,0-130,0-80,0-90,0-40);//finn or tale
  triangle(0,0-60,0-40,0-90,0-40,0-50);//top finn
  triangle(0-20,0+10,0-40,0-20,0,0-20);//bottom finn
  fill(255);//set white colour
  ellipse(0+50,0-40,10,10);//eye
  fill(0);//set black mouth colour
  triangle(0+20,0-30,0+20,0-15,0+40,0-17);//mouth
  stroke(0);
  strokeWeight(4);
  point(0+53,0-40);//eyeball
  line(browX1,browY1,browX2,browY2);//eyebrow
  popMatrix();
}
void whale()
{
  if(tropicalY<=300 && turtleY<=300 && whaleX<1000 && counter>500)//when the fish and turtle bumbs into the whale
  {
    whaleX+=2;//move out of the way of the fish and turtle
  }
  pushMatrix();//original whale shape
  noStroke();
  fill(#B4C4EA);//set blueish purple colour
  rectMode(CORNERS);
  translate(whaleX, whaleY);
  rotate(radians(whaleR));
  quad(0-40,0-80,0-40,0+20,0+160,0+20,0+160,0-80);
  arc(0+60,0-80,200,40,radians(180),radians(360));//top curve
  arc(0-40,0-30,40,100,radians(90),radians(270));//left curve
  arc(0+160,0-30,40,100,radians(270),radians(360));//right curve
  arc(0+160,0-30,40,100,radians(0),radians(90));//right curve
  arc(0+30,0+20,260,40,radians(0),radians(180));//bottom curve
  rect(0-100,0,0-40,0+20);//tale
  triangle(0-140,0-40,0-140,0+60,0-85,0+15);//tale
  triangle(0+20,0+80,0,0+40,0+40,0+40);//finn
  
  stroke(0);
  strokeWeight(2);
  fill(255);//set white colour for eye
  ellipse(0+120,0-40,40,40);//eye
  
  strokeWeight(4);
  point(0+130,0-30);
  
  strokeWeight(1);
  fill(#B4C4EA);
  arc(0+140,0-80,200,200,radians(80),radians(135),OPEN);//mouth
  
  noStroke();
  fill(#8FACF0);
  ellipse(0+60,0-80,40,20);//blowhole
  popMatrix();
  
  
  if(whaleX>900 && whale2X>700 && counter<2000)//whale turns around and comes back into the screen
    whale2X-=2;
  else if(turtleX-10<0)//moves forward and stops at 699
    whale2X=699;
  else if(turtleX>=400 && whale2Y<=300 && counter<2000)//when whale see's the shark, swims down toward it 
  {
    whale2R=-45;
    whale2X--;
    whale2Y++;
  }
  else if(whale2Y>300 && whale2X>300 && shark2X+100>0 && counter<2000)//Swims forward and stops in front of him
  {
    whale2R=0;
    whale2X--;
  }
  else if(shark2X+100<0 && whale2X<702 && counter>1800)//goes back to talk to the tropical fish
  {
    whale2X++;
  }
  pushMatrix();//whale reflection
  noStroke();
  fill(#B4C4EA);//set blueish purple colour
  rectMode(CORNERS);
  translate(whale2X, whale2Y);
  rotate(radians(whale2R));
  quad(0-40,0-80,0-40,0+20,0+160,0+20,0+160,0-80);
  arc(0+60,0-80,200,40,radians(180),radians(360));//top curve
  arc(0-40,0-30,40,100,radians(90),radians(270));//left curve
  arc(0+160,0-30,40,100,radians(270),radians(360));//right curve
  arc(0+160,0-30,40,100,radians(0),radians(90));//right curve
  arc(0+90,0+20,260,40,radians(0),radians(180));//bottom curve
  rect(0+160,0,0+220,0+20);//tale
  triangle(0+260,0-40,0+260,0+60,0+205,0+15);//tale
  triangle(0+70,0+80,0+50,0+30,0+90,0+30);//finn
  
  stroke(0);
  strokeWeight(2);
  fill(255);//set white colour for eye
  ellipse(0,0-40,40,40);//eye
  
  strokeWeight(4);
  point(0-10,0-30);
  
  strokeWeight(1);
  fill(#B4C4EA);
  arc(0+20,0-80,200,200,radians(60),radians(110),OPEN);//mouth
  
  noStroke();
  fill(#8FACF0);
  ellipse(0+60,0-80,40,20);//blowhole
  popMatrix();
}

void tropicalFish()
{
  if(tropicalX>=590 && whaleX!=1000 && counter>=0)//move fish to turtle
  {
    tropicalR=315;
    tropicalX--;
    tropicalY+=1.5;
  } 
  else if(tropicalX<590 && tropicalX>444 && whaleX!=1000)//stop in front of turtle
  {
    tropicalR=0;
    tropicalX--;
  }
  else if(tropicalX==444 && whaleX!=1000 && counter>400)//start moving toward the whale
  {
    tropicalR=90;
    tropicalX--;
  }
  else if(tropicalX<444 && tropicalY>=300 && whaleX<=900)//stop when it reaches the whale
  {
    tropicalY--;
  }
  else if(whale2X==700 && counter<2000)//when the whale comes back
  {
    tropicalR=20;
    tropicalX-=3;//move across the screen with the turtle
    tropicalY--;
  }
  else if(whale2X==699 && tropicalY<=380 && counter<2000)//turn at the wall
  { 
    tropicalR=225;
    tropicalX++;
    tropicalY+=2;
  }
  else if(tropicalY>380 && whale2X==699 && counter<2000)//move forward and stop to talk to the turtle
  {
    tropicalR=180;
    tropicalX++;
  } 
  pushMatrix();//drawing of tropical fish
  translate(tropicalX,tropicalY);
  rotate(radians(tropicalR));
  noStroke();
  fill(#25CEE3);//set turquoise colour
  triangle(0-20,0-40,0+20,0-80,0,0-20);//top finn
  triangle(0-20,0+40,0+20,0+80,0,0+20);//bottom finn
  triangle(0+20,0,0+40,0-40,0+40,0+40);//tale
  fill(#D883F0);//set green colour
  quad(0-60,0,0-20,0-40,0+20,0,0-20,0+40);//body
  fill(#EDCAF7);
  arc(0-60,0,80,80,radians(315),radians(360));//face 
  arc(0-60,0,80,80,radians(0),radians(45));//face
  fill(0);//set black colour for eye
  ellipse(0-40,0,5,5);//eye
  popMatrix();
}
void turtle()
{
  if(tropicalX<=444 && turtleY>=300 && whaleX<=900 && counter<2000 && counter>400)//stop when it reaches the whale
    turtleY--;
  else if(whale2X==700 && counter<2000)//when the whale comes back
  {
    turtleR=300;
    turtleX-=3;//move accross the screen with the tropical fish
    turtleY--;
  }
  else if(whale2X==699 && turtleY<=380 && counter<2000)//rotate and move diagonally across the screen
  { 
    turtleR=135;
    turtleX++;
    turtleY+=2;
  }
  else if(turtleY>380 && whale2X==699)//come back into the screen to talk to the whale
  {
    turtleR=90;
    turtleX++;
  }
  pushMatrix();//drawing of turtle
  translate(turtleX,turtleY);
  rotate(radians(turtleR));
  fill(#149B00);//turtle head colour
  ellipse(0+20,0-40,30,30);//head
  fill(#235A19);//set limb colour
  triangle(0-20,0+70,0,0,0+10,0+60);//left leg
  triangle(0+60,0+70,0+40,0,0+30,0+60);//right leg
  quad(0-30,0-10,0,0-10,0-10,0,0-50,0+20);//left arm
  quad(0+40,0-10,0+70,0-10,0+90,0+20,0+50,0);//right arm
  fill(#0A3903);//turtle shell colour
  arc(0+20,0+20,80,100,radians(90),radians(270));//shell
  arc(0+20,0+20,80,100,radians(270),radians(360));//shell
  arc(0+20,0+20,80,100,radians(0),radians(90));//shell
  popMatrix();
}

void speech()
{
  fill(0);
  PFont font4;
  font4=loadFont("Georgia-20.vlw");
  textFont(font4);
  if(tropicalX==444 && counter<500)//the tropical fish talking to the turtle
    text("Hey Turtle, Let's play",350,300);
  else if(counter>480 && counter<600)//the whale talking to the turtle and the fish
  {
    text("Oh sorry,",550,200);
    text("I'll move out of your way",550,230);
  }
  if(counter>700 && counter<800)//the turtle talking to the tropical fish
    text("How about we play tag",230,230);
  else if(counter>800 && counter<850)//tropical fish replies
    text("Ok",440,230);
  else if(counter>1175 && counter<1250)//fish talking to turtle
    text("I'm tired",tropicalX+20,tropicalY-50);
  else if(counter>1250 && counter<1350)//turtle replying to tropical fish
    text("Me too", turtleX+20, turtleY-50);
  else if(counter>1400 && counter<1450)//shark talking
    text("Yummy fish", shark2X+50,shark2Y);
  else if(counter>1660 && counter<1800)//whale talking to shark to scare it away
  {
    text("YOU CAN'T",whale2X-150,whale2Y-10);
    text("EAT THE FISH",whale2X-150,whale2Y+20);
  }
  else if(counter>1800 && counter<1900)//shark getting scared of the whale
    text("Ah! scary whale",shark2X+50,shark2Y);
  else if(counter>2200 && counter<2300)//the fish thanking the whale
    text("Thanks for saving me!",tropicalX+20,tropicalY+20);
  else if(counter>2300 && counter<2400)//whale replying
    text("No problem",whale2X-150,whale2Y);
}
void extrabackgrounds()
{
  if(tropicalX>=690 && counter>0)//the introduction scene
  {
    delay(5);//slow down 
    stroke(0);//set coulour to black
    strokeWeight(50);//thick stroke weight to fill the screen
    for(int backgroundY=0; backgroundY<=500; backgroundY+=20)
    line(0,backgroundY,800,backgroundY);//the change of background so that time changes
    PFont font;//call the first font
    font=loadFont("Rockwell-Italic-60.vlw");//loading font
    textFont(font);//set the font to rockwell
    fill(255);//set colour to white
    text("It was a beautiful day",100,200);//text 
    text("under the sea",200,280);//second line of text
    stroke(#6C6B6C);//set brown colour
    strokeWeight(7);
    for(int fish=40; fish>0; fish-=1)
      ellipse(80,120,fish,15);//first small fish that is part of background
    triangle(60,120,40,115,40,125);//tale
    stroke(#139CAD);//set turquoise colour 
    for(int fish=40; fish>0; fish-=1)
      ellipse(100,400,fish,15);//second fish that is part of background
    triangle(80,400,60,395,60,405);//tale
    stroke(#A02CF5);//set pink colour
    for(int fish=40; fish>0; fish-=1)
      ellipse(600,300,fish,15);//third fish that is part of background
    triangle(580,300,560,295,560,305);//tale
  }
  if(whale2X==699 && turtleX-100<0)//in the middle of the code
  {
    delay(5);//slow down
    stroke(0);//set coulour to black
    strokeWeight(50);
    for(int backgroundY=0; backgroundY<=500; backgroundY+=20)
    line(0,backgroundY,800,backgroundY);//the change of background so that time changes
    fill(255);//set colour to white
    PFont font;//call the first font again
    font=loadFont("Rockwell-Italic-60.vlw");//load this font
    textFont(font);//set the font to rockwell
    text("After a long game of tag",80,250);//text
    stroke(#6C6B6C);//set colour to brown
    strokeWeight(7);
    for(int fish=40; fish>0; fish-=1)
      ellipse(80,120,fish,15);//first fish that is part of background
    triangle(60,120,40,115,40,125);//tale
    stroke(#139CAD);//set turquoise colour
    for(int fish=40; fish>0; fish-=1)
      ellipse(100,400,fish,15);//second fish that is part of background
    triangle(80,400,60,395,60,405);//tale
    stroke(#A02CF5);//set pink colour
    for(int fish=40; fish>0; fish-=1)
      ellipse(600,300,fish,15);//third fish that is part of background
    triangle(580,300,560,295,560,305);//tale
  }
  if(counter>2400 && counter<2550)//near the end of the code
  {
    delay(5);
    PFont font;//load the same font again
    font=loadFont("Rockwell-Italic-60.vlw");
    textFont(font);//set the font to rockwell
    stroke(0);//set coulour to black
    strokeWeight(50);//thick stroke weight
    for(int backgroundY=0; backgroundY<=500; backgroundY+=20)
    line(0,backgroundY,800,backgroundY);//the change of background so that time changes
    fill(255);//set colour to white
    text("They all played together,",80,200);
    text("happily ever after",150,280);
    text("without the shark",155,360);
    stroke(#6C6B6C);//load brown colour
    strokeWeight(7);
    for(int fish=40; fish>0; fish-=1)
      ellipse(80,120,fish,15);//first fish that is part of background
    triangle(60,120,40,115,40,125);//tale
    stroke(#139CAD);//set turquoise colour
    for(int fish=40; fish>0; fish-=1)
      ellipse(100,400,fish,15);//second fish that is part of background
    triangle(80,400,60,395,60,405);//tale
    stroke(#A02CF5);//set pink colour
    for(int fish=40; fish>0; fish-=1)
      ellipse(700,300,fish,15);//second fish that is part of background
    triangle(680,300,660,295,660,305);//tale
  }
  if(counter>=2550)//end scene
  {
    sky();//bring back the sky
    water();//bring back the water
    sand();//bring back the sand
    whale();//bring back the whale
    tropicalFish();//bring back the tropical fish
    turtle();//bring back the turtle
    shark();//bring back the shark
    whale2X=550;//move the location of the whale
    whale2Y=250;
    tropicalX=300;//move the location of the tropical fish
    tropicalY=200;
    turtleR=45;//change the angle of the turtle
    turtleX=300;//move the location of the turtle
    turtleY=300;
    shark2X=50;//move the location of the shark
    shark2Y=150;
    PFont font2;//load the second font
    font2=loadFont("BookmanOldStyle-Bold-80.vlw");//load this font
    textFont(font2);//set the font to bookman Old Style
    fill(0);//set colour to white
    if(counter>2610)//wait a little bit before displaying the end
      text("THE END",200,280);//display the end
    PFont font3;//load the third font
    font3=loadFont("CalifornianFB-Italic-40.vlw");//load this font
    textFont(font3);//set font
    text("By:Mona Afshar", 550, 100);//write my name
  }
}
void openScene()//for the beginning to see all the water creatures coming into the screen
{
  myBackground();
  pushMatrix();//the turtle body
  translate(turtle2X,turtle2Y);
  rotate(radians(turtle2R));
  noStroke();
  fill(#149B00);//turtle head colour
  ellipse(0+20,0-40,30,30);//head
  fill(#235A19);//set limb colour
  triangle(0-20,0+70,0,0,0+10,0+60);//left leg
  triangle(0+60,0+70,0+40,0,0+30,0+60);//right leg
  quad(0-30,0-10,0,0-10,0-10,0,0-50,0+20);//left arm
  quad(0+40,0-10,0+70,0-10,0+90,0+20,0+50,0);//right arm
  fill(#0A3903);//turtle shell colour
  arc(0+20,0+20,80,100,radians(90),radians(270));//shell
  arc(0+20,0+20,80,100,radians(270),radians(360));//shell
  arc(0+20,0+20,80,100,radians(0),radians(90));//shell
  popMatrix();
  
  pushMatrix();//original whale shape
  noStroke();
  fill(#B4C4EA);//set blueish purple colour
  rectMode(CORNERS);
  translate(whale3X, whale3Y);
  quad(0-40,0-80,0-40,0+20,0+160,0+20,0+160,0-80);
  arc(0+60,0-80,200,40,radians(180),radians(360));//top curve
  arc(0-40,0-30,40,100,radians(90),radians(270));//left curve
  arc(0+160,0-30,40,100,radians(270),radians(360));//right curve
  arc(0+160,0-30,40,100,radians(0),radians(90));//right curve
  arc(0+30,0+20,260,40,radians(0),radians(180));//bottom curve
  rect(0-100,0,0-40,0+20);//tale
  triangle(0-140,0-40,0-140,0+60,0-85,0+15);//tale
  triangle(0+20,0+80,0,0+40,0+40,0+40);//finn
  
  stroke(0);
  strokeWeight(2);
  fill(255);//set white colour for eye
  ellipse(0+120,0-40,40,40);//eye
  
  strokeWeight(4);
  point(0+130,0-30);
  
  strokeWeight(1);
  fill(#B4C4EA);
  arc(0+140,0-80,200,200,radians(80),radians(135),OPEN);//mouth
  
  noStroke();
  fill(#8FACF0);
  ellipse(0+60,0-80,40,20);//blowhole
  popMatrix();
  
  pushMatrix();//shark body
  translate(shark3X, shark3Y);
  noStroke();
  fill(#8281A0);//set grey colour
  arc(0,0-40,180,40,radians(180),radians(360));//body
  arc(0,0-40,180,50,radians(0),radians(180));//body
  quad(0+130,0,0+90,0-40,0+130,0-80,0+110,0-40);//finn or tale
  triangle(0,0-60,0+40,0-90,0+40,0-50);//top finn
  triangle(0+20,0+10,0+40,0-20,0,0-20);//bottom finn
  fill(255);//set white colour
  ellipse(0-50,0-40,10,10);//eye
  fill(0);//set black mouth colour
  triangle(0-20,0-30,0-20,0-15,0-40,0-17);//mouth
  stroke(0);
  strokeWeight(4);
  point(0-53,0-40);//eyeball
  line(0-55,0-45,0-50,0-50);//eyebrow
  popMatrix();
  
  if(whale3X<300)//move the whale to starting position
    whale3X+=2;
  if(turtle2X<300)//move turtle to starting position
    turtle2X+=2;
  if(shark3X>650)//move shark to starting position
    shark3X-=2;
}
//The end! Hope you liked my story, it was a lot of fun to write this code, I had fun in your class and I learned a lot. Thank you!
