String [] lines;
int index = 0;
String [] latlong;

float lati=0;
float longi=0;
String name;
float dia=0;


void loadData(){
lines = loadStrings("res14.csv");
}



void checkData(){
  
  for (int i=0; i<lines.length; i++) {
 //if (index < lines.length) {
    String[] latlong = split(lines[i], ',');
  
      lati = float(latlong[0]);
      longi = float(latlong[1]);
      name = latlong[2];
    //  dia = float(latlong[3]); //final entry after city name
      
      places.add(new Location(lati,longi)); //add into the list
    
    // Go to the next line for the next run through draw()
   // index = index + 1;
  }
 
 
  
}
