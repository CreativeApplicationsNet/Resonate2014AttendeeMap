import processing.opengl.*;
import codeanticode.glgraphics.*;
import de.fhpotsdam.unfolding.*;
import de.fhpotsdam.unfolding.geo.*;
import de.fhpotsdam.unfolding.utils.*;

de.fhpotsdam.unfolding.Map map;
boolean mouseON = false;
Location res14 = new Location(44.81f, 20.46f); //static call
ArrayList<Location> places; // list oif locations
ScreenPosition pos;

PImage resonatelogo;

// ashley james brown
// for #res14
// resonate cities
//
// dec 2013. v 1.0
///////////////////////////////////////////////////////////////////////////

float bgx;
float bgy;

public void setup() {
  //size(900, 600, GLConstants.GLGRAPHICS); //for faster loading and interaction
  size(900, 600);  //for better output to image - smooth()
  
  resonatelogo = loadImage("resonatelogo.png");

  //get data in - maybe move to reading in a text file / csv instead
  places = new ArrayList<Location>();

  loadData();
  //repeat until end of file
  checkData();

  //map stuffs
  noStroke();

  map = new de.fhpotsdam.unfolding.Map(this);
  map.setTweening(true);
  map.zoomToLevel(2);
  map.setZoomRange(2, 10);
  map.panTo(new Location(40f, 8f));
  MapUtils.createDefaultEventDispatcher(this, map);
  
  
}


///////////////////////////////////////////////////////////////////////////

public void draw() {

  background(255);
  map.draw();

  //overlay geo coords via mouse
  if (mouseON) {
    Location location = map.getLocation(mouseX, mouseY);
    fill(0);
    text(location.getLat() + ", " + location.getLon(), mouseX, mouseY);
  }


//if draw static whole map with each cities

  // Fixed-size marker fopr resonate
  ScreenPosition pos = map.getScreenPosition(res14);
  fill(255,0,0);
  ellipse(pos.x, pos.y, 10, 10);
  stroke(0);
  
  bgx = pos.x;
  bgy = pos.y;

  //everywhere else
  getPlaces(); //retreuve from arraylist pass to screenpos and draw

//

  image(resonatelogo, 10, height-85);
}



/////////////////////////////////////////////////////////////////////////

void getPlaces() {

  for (int counter=0; counter <places.size(); counter ++) {
    places.get(counter); //retrieve the location at set place
    ScreenPosition vec = map.getScreenPosition(places.get(counter)); //get its screen name and pass it to screenpos vector

    smooth();
    
//    float d;
//    d = dist(bgx, bgy, vec.x, vec.y);
//    
//    noStroke();
//    fill(0, 0, 0, 5);
//    ellipse(vec.x, vec.y, d*2, d*2);
    
    stroke(0);
    strokeWeight(0.2);
    line(bgx, bgy, vec.x, vec.y);
    
    //noStroke();
    fill(0, 0, 0);
    ellipse(vec.x, vec.y, 5, 5);
    
    noStroke();
    fill(255,0,0);
    ellipse(bgx, bgy, 10, 10);
  }
}


//
void keyPressed() {
  switch (key) {
  case 'm':
    mouseON=!mouseON;
    break;
  case 's':
    saveFrame("output/res14_mapimage-###.jpg");
    break;
  case 'a':
    break;  
  }
}

