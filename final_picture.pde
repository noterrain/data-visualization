ArrayList<String> words = new ArrayList();
int[] finalsort=new int[1];
int[]topsort=new int[20];
Twitter twitter; 

PFont f;

// Variable to store text currently being typed
String typing = "";

// Variable to store saved text when return is hit
String saved = "";

String[]data= {
  "the", "You", "She", "He", "is", "life", "and", "when", "in", "of", "to", "it"
};

String [] filterpunctuation= { 
  "?", ".", "!", ",", ":", "'", "*", "&", "(", ")","-","[","]"};  

float []n;
int k=0;

int winner = 0; 

ArrayList winningWords; 
ArrayList winningTotals; 
int tempSize; 
boolean repeat; 


boolean whetherpressed;
boolean circleshow=true;
int typenum=0;
int strokecolor=170;
int textcolor=240;
//create a class
Ball[]balls=new Ball[20];
Circle[]circle=new Circle[10];

void setup() {
  //Set the size of the stage, and the background to black.
  size(1000, 1000);
  background(0);
  smooth();
  //filterwords = loadStrings("ignore.txt");
  frameRate (10); 


  //Credentials
  ConfigurationBuilder cb = new ConfigurationBuilder();
  cb.setOAuthConsumerKey("e7C0AslsjU0eboqvMD1gQ");
  cb.setOAuthConsumerSecret("nkXJVZQoFxexviwxdzrg8Z59zL4TKYLIzZwfPzVK10");
  cb.setOAuthAccessToken("373773109-7T6h5Cp8dZEMuxRM8bShsK6hEc9ZsFSQCcy83hSv");
  cb.setOAuthAccessTokenSecret("PulP8NDKhu7i1F3o8ecVvPfmr3luJXsWpYo8ydrdvZU");//

  //Make the twitter object and prepare the query
  twitter = new TwitterFactory(cb.build()).getInstance();
  //frameRate(10);
  //getTweets ("#OWS");
  f = createFont("Times Rome", 50, true);
  //frameRate(10);
  //finalsort[0]=0;

  winningWords = new ArrayList(); 
  winningTotals = new ArrayList(); 

  String temp = ""; 
  winningWords.add(0, temp); 
  winningTotals.add(0, 0);
  
 // frameRate=20;
  
  for (int i = 0; i < balls.length; i ++ ) { // Initialize each Car using a for loop.
    balls[i] = new Ball(int(random(20,width-20)), int(random(20, height-20))); 
  }
  
   for (int c = 0; c < circle.length; c ++ ) { // Initialize each Car using a for loop.
    circle[c] = new Circle(); 
  }
  
 // circle=new Circle();  
}

void draw() {
  background(0);
  //Draw a faint black rectangle over what is currently on the stage so it fades over time.
  fill(0, 1);
  rect(0, 0, width, height);
  textFont(f);
  //  println(saved);
  fill(255);
  textFont(f);
  //text(saved, 200, 200);
  
  //circle.display(saved);
  //circle.drawcircle();
  text(typing, 500, 500);

  //--------------------------------
  println ("total words: " + words.size()); 
  for (int i = 0; i < words.size(); i++) {

    String word = words.get(i);
    //Wordcount(word,i);
    int howmany=Wordcount(word, i);
    // println ("word: " + word + " count: " + howmany); 

    //String ignoreWord = "empty"; 
    repeat = false; 
    for (int s=0; s<data.length; s++) {

      if (!word.equals("RT") &&!word.equals("the")&&!word.equals("You")&&!word.equals("I")&&!word.equals("I")&&!word.equals("the")&&!word.equals("you")&&!word.equals("She")&&!word.equals("He")&&!word.equals("is")&&!word.equals("when")&&!word.equals("in")&&!word.equals("of")&&!word.equals("to")&&!word.equals("it")&&!word.equals("for")&&!word.equals("a")&&!word.equals("on")&&!word.equals("from")&&!word.equals("that")&&!word.equals("with")&&!word.equals("have")&&!word.equals("all")&&!word.equals("this")&&!word.equals("my")&&!word.equals("Im")&&!word.equals("I")&&!word.equals("In")&&!word.equals("dont")&&!word.equals("how")&&!word.equals("makes")&&!word.equals("one")&&!word.equals("just")&&!word.equals("will")&&!word.equals("as")&&!word.equals("if")&&!word.equals("be")&&!word.equals("do")&&!word.equals("was")&&!word.equals("like")&&!word.equals("so")&&!word.equals("at")&&!word.equals("are")&&!word.equals("A")&&!word.equals("Just")&&!word.equals("youre") &&!word.equals("wont") &&!word.equals("what") &&!word.equals("me") &&!word.equals("are") &&!word.equals("On") &&!word.equals("If") &&!word.equals("he") &&!word.equals("your") &&!word.equals("From") &&!word.equals("Those") &&!word.equals("It") &&!word.equals("and") &&!word.equals("i") &&!word.equals("some") &&!word.equals("can") &&!word.equals("we") &&!word.equals("es") &&!word.equals("se") &&!word.equals("your") &&!word.equals("de") &&!word.equals("el") &&!word.equals("The")&&!word.equals("by")&&!word.equals("que")&&!word.equals("an")&&!word.equals("had")&&!word.equals("would")&&!word.equals("If")&&!word.equals("Them")&&!word.equals("about")&&!word.equals("out")&&!word.equals("What")&&!word.equals("Be")&&!word.equals("get")&&!word.equals("make")&&!word.equals("any")&&!word.equals("The")&&!word.equals("has")&&!word.equals("am")&&!word.equals("something")&&!word.equals("kind")&&!word.equals("They")&&!word.equals("but")&&!word.equals("cant")&&!word.equals("went")&&!word.equals("Have")&&!word.equals("")&&!word.equals("HAVA")&&!word.equals("THIS")&&!word.equals("WE")&&!word.equals("go")                                                        
      &&!word.equals("thats") &&!word.equals("im") &&!word.equals("want") &&!word.equals("did") &&!word.equals("does") &&!word.equals("And")&&!word.equals(saved)&&!word.equals("And")&&!word.equals("all")&&!word.equals("obamas")&&!word.equals("than")&&!word.equals("theyre")&&!word.equals("U")&&!word.equals("who")&&!word.equals("she")&&!word.equals("there")&&!word.equals("him")&&!word.equals("its")&&!word.equals("his")&&!word.equals("they")&&!word.equals("think")&&!word.equals("gonna")&&!word.equals("got")&&!word.equals("That")&&!word.equals("en")&&!word.equals("Your")&&!word.equals("There")&&!word.equals("That")&&!word.equals("u")) 
       Wordsort(word, howmany);
    }
  }

  println ("TOP TEN:"); 
  if(circleshow){
    for(int c = 0; c < circle.length; c ++ ){ 
    circle[c].drawcircle(typenum);
  }
  }
  
  if(whetherpressed){
     for (int i = 0; i < winningTotals.size(); i++) {
    // println (i + " is " + winningWords[i] + " at " + winningTotals[i]); 
    String wordtemp = (String) winningWords.get(i); 
    int num = (Integer) winningTotals.get(i); 
    println (i + " is " + wordtemp + " at " + num);
    balls[i].move();
    balls[i].display(wordtemp,num,strokecolor,textcolor);
    //circle.display(saved);
   // text(saved, 480, 480);
   // fill(0,200);
    //textFont(f,16);   
    //text(wordtemp,random(width),random(height)); 
  }
  // circle.drawcircle();
 //whetherpressed=false;
  //--------------------------------
}
}

/*void showwords(){
   int i=frameCount%winningTotals.size();
  String wordtemp = (String) winningWords.get(i); 
  int num = (Integer) winningTotals.get(i); 
  
  text(wordtemp,random(width),random(height));
}*/
  
  
  
  


void keyPressed() {
  whetherpressed=false;
 // int typenum=0;
  if (key=='\n') {
    saved=typing;
    getTweets(saved);
    typing=" ";
    fill(150);
   // showwords();
    //background(255);
    //text(saved, 25, 100);
    whetherpressed=true;
    //circle.display(saved);
   // circle.display();
   circleshow=false;
   typenum=0;
  }

  else {
    typing=typing+key;
     typenum++;
     circleshow=true;
  }  
}

void getTweets (String myQuery) {

  Query query = new Query(myQuery);
  query.setRpp(50000); //total number of tweets

  //Try making the query request.
  try {
    QueryResult result = twitter.search(query);
    ArrayList tweets = (ArrayList) result.getTweets();

    for (int i = 0; i < tweets.size(); i++) {
      Tweet t = (Tweet) tweets.get(i);
      String user = t.getFromUser();
      String msg = t.getText();
      Date d = t.getCreatedAt();
      println(msg);
      //println (""); 
      //Break the tweet into words
      String[] input = msg.split(" ");
      for (int j = 0;  j < input.length; j++) {
        //Put each word into the words ArrayList
        // filter
        String thisWord = input[j];
        boolean addThisWord = true;
        if ((thisWord.indexOf("http")== -1) && (thisWord.indexOf("#")== -1)&&(thisWord.indexOf("@") == -1)) {
          //println(input[j] + " contains http");
          for (int k=0; k<filterpunctuation.length;k++) {
            thisWord=thisWord.replace(filterpunctuation[k], "");
          }
          words.add(thisWord);
            }
          }
        }
      }
    


  catch (TwitterException te) {
    println("Couldn't connect: " + te);
  };
}



int Wordcount(String theword, int shu) {
  int number=0;

  for (int wordcount=0; wordcount<words.size(); wordcount++) {
    // for(int j=0; j<shu;j++){
    //int i = (frameCount % words.size());
    if ((words.get(wordcount)).equals(theword)) {
      number++;
      // }
    }
  }
  //println(number); 
  return(number);
}



void Wordsort(String word, int howMany) {
  boolean pickedOne = false;

  //check if we've seen this word before
  for (int i = 0; i < winningWords.size(); i++) {
    String thisWord = (String) winningWords.get(i); 
    if (thisWord.equals (word)) {
      repeat = true;
    }
  }

  if (repeat == false) { 

    for (int i = 0; i < winningWords.size(); i++) {

      //get the values from the arraylist
      int thisNum = (Integer) winningTotals.get(i);
      String thisWord = (String) winningWords.get(i); 

      if ( !pickedOne) {
        if (howMany > thisNum) {

          //add to the arrayList
          winningWords.add(i, word); 
          winningTotals.add(i, howMany); 
          pickedOne = true; //confirm that we have picked a position for this word

          //limit the size of the arrayList to 10. 
          if (winningWords.size() > 20) {
            winningWords.remove(20); 
            winningTotals.remove(20);
          }
        }
      }
    }
  }
}











