//Libraries
//
import java.io.*;
//
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;
//
//Global Variables
float[] TextDIVWidth = new float[18];
float[] TextDIVHeight = new float[18];
float xMusicTitle, yMusicTitle;
float xMusicAuthor, yMusicAuthor;
float xMusicPublishDate, yMusicPublishDate;
float xAttributions, yAttributions;
float xIconAttribution, yIconAttribution;
float xBackgroundAttribution, yBackgroundAttribution;
float xSongAttribution1, ySongAttribution1, xSongAttribution1Line2, ySongAttribution1Line2;
float xSongAttribution2, ySongAttribution2, xSongAttribution2Line2, ySongAttribution2Line2;
float xSongAttribution3, ySongAttribution3, xSongAttribution3Line2, ySongAttribution3Line2;
float xSongAttribution4, ySongAttribution4, xSongAttribution4Line2, ySongAttribution4Line2;
float xSongAttribution5, ySongAttribution5, xSongAttribution5Line2, ySongAttribution5Line2;
float xSongAttribution6, ySongAttribution6, xSongAttribution6Line2, ySongAttribution6Line2;
float xPopupBackground, yPopupBackground, widthPopupBackground, heightPopupBackground;
float xAttributionBackground, yAttributionBackground, widthAttributionBackground, heightAttributionBackground;
float xMusicPanel, yMusicPanel, widthMusicPanel, heightMusicPanel;
float xMusicImage, yMusicImage, widthMusicImage, heightMusicImage;
float xMusicProgressBar, yMusicProgressBar, widthMusicProgressBar, heightMusicProgressBar;
float xQuit, yQuit, widthQuit, heightQuit;
float xPrevious, yPrevious, widthPrevious, heightPrevious;
float xRewind, yRewind, widthRewind, heightRewind;
float xPlayPause, yPlayPause, widthPlayPause, heightPlayPause;
float xFastForward, yFastForward, widthFastForward, heightFastForward;
float xNext, yNext, widthNext, heightNext;
float xShuffle, yShuffle, widthShuffle, heightShuffle;
float xReplay, yReplay, widthReplay, heightReplay;
float xLoop, yLoop, widthLoop, heightLoop;
float xIcons8Location;
float xVecteezyLocation;
float ProgressWidth;
int NumberOfButtonDIVs = 10; //All Music Player Buttons
float[][] ButtonDivRatios = new float[NumberOfButtonDIVs][4]; //Store ratios (Rectangles)
float[] ButtonDivs = new float [NumberOfButtonDIVs*4]; //Button Positions and Size
int NumberOfButtonIconDIVs = 9; //All Music Player Button Icons
float[][] ButtonIconDivRatios = new float[NumberOfButtonIconDIVs][6]; //Store ratios (Triangles)
float[] ButtonIconDivs = new float [NumberOfButtonIconDIVs*6]; //Icon Positions and Size
PImage[] MusicProgramImage = new PImage[7];
PImage[] MusicImage = new PImage[6];
PImage NeonBackground2;
PImage Quit;
PImage Shuffle;
PImage Loop;
PImage Replay;
PFont TitleFont;
PFont AttributionFont;
color resetDefaultInk=#FFFFFF;
color Gray=#C9C9C9;
color LightGray=#CECECE;
color Black=#000000;
color Purple=#B031E8;
color TextPurple=#F986FF;
int appWidth, appHeight;
int size;
int ShorterSide;
int SongNumber = 6;
int SongPlaying = SongNumber - SongNumber;
int SoundEffectNumber = 1;
int SoundEffectPlaying = 0;
int SongTimeCounter;
int SongLengthAlteration;
int AlteredCurrentSongLength;
int KeySongPosition;
int SongSkipTime;
int LastSongState;
String SongStateTxtPath_LastSongState;
boolean SongLoop = false;
boolean IsFontSizeUpdated = false;
boolean Attributions = false;
boolean MouseIsOver(float xVariable, float yVariable, float widthVariable, float heightVariable) {
  return mouseX > xVariable && mouseX < xVariable + widthVariable && mouseY > yVariable && mouseY < yVariable + heightVariable;
}
File file;
File AudioFiles;
File SoundEffectFiles;
File ImageFiles;
File FileImages;
Minim minim;
AudioPlayer song1;
AudioPlayer[] Song = new AudioPlayer[SongNumber];
AudioPlayer[] SongPlayList = new AudioPlayer[SongNumber];
AudioMetaData[] SongMetaData = new AudioMetaData[SongNumber];
AudioMetaData[] SongPlayListMetaData = new AudioMetaData[SongNumber];
AudioPlayer[] SoundEffect = new AudioPlayer[SoundEffectNumber];
AudioPlayer[] SoundEffectPlayList = new AudioPlayer[SoundEffectNumber];
AudioMetaData[] SoundEffectMetaData = new AudioMetaData[SoundEffectNumber];
AudioMetaData[] SoundEffectPlayListMetaData = new AudioMetaData[SoundEffectNumber];
//
void setup() {
  //
  size(1200, 800);
  appWidth = width;
  appHeight = height;
  ShorterSide = (appWidth >= appHeight) ? appHeight : appWidth;
  //
  minim = new Minim(this);
  //
  //{X value in ratio of appwidth, Y value in ratio of appwidth, width value in ratio of appwidth, height value in ratio of appheight}
  ButtonDivRatios[0] = new float[]{23.0/24, 0.0, 1.0/24, 1.0/30}; //Quit Button
  ButtonDivRatios[1] = new float[]{5.0/26, 24.0/40, 1.0/26, 1.0/26}; //Previous Song Button
  ButtonDivRatios[2] = new float[]{9.0/26, 24.0/40, 1.0/26, 1.0/26}; //Rewind Button
  ButtonDivRatios[3] = new float[]{25.0/52, 24.0/40, 1.0/26, 1.0/26}; //Play/Pause Button
  ButtonDivRatios[4] = new float[]{16.0/26, 24.0/40, 1.0/26, 1.0/26}; //Fast Forward Button
  ButtonDivRatios[5] = new float[]{20.0/26, 24.0/40, 1.0/26, 1.0/26}; //Next Song Button
  ButtonDivRatios[6] = new float[]{25.0/52, 24.0/40+2.5/26, 1.0/26, 1.0/26}; //Shuffle Songs Button
  ButtonDivRatios[7] = new float[]{9.0/26, 24.0/40+2.5/26, 1.0/26, 1.0/26}; //Replay Song Button
  ButtonDivRatios[8] = new float[]{16.0/26, 24.0/40+2.5/26, 1.0/26, 1.0/26}; //Loop Button
  ButtonDivRatios[9] = new float[]{0.0, 23.0/24, 1.0/12, 1.0/24}; //Attribution Button
  CalculateButtonDIVs();
  //
  //{The first, third and fifth ratios are X values in ratio of appwidth. The second, fourth and sixth ratios are y values in ratio of appheight}
  ButtonIconDivRatios[0] = new float[]{35.0/156, 79.0/130, 35.0/156, 82.0/130, 21.0/104, 161.0/260}; //Previous Button Triangle One
  ButtonIconDivRatios[1] = new float[]{31.0/156, 79.0/130, 31.0/156, 82.0/130, 31.0/156, 161.0/260}; //Previous Button Triangle Two
  ButtonIconDivRatios[2] = new float[]{55.0/156, 161.0/260, 19.0/52, 79.0/130, 19.0/52, 82.0/130}; //Rewind Button Triangle One
  ButtonIconDivRatios[3] = new float[]{19.0/52, 161.0/260, 59.0/156, 79.0/130, 59.0/156, 82.0/130}; //Rewind Button Triangle Two
  ButtonIconDivRatios[4] = new float[]{25.0/52+1.0/130, 24.0/40+1.0/130, 25.0/52+1.0/130, 24.0/40+5/104, 25.0/52+5/104, 24.0/40+1.0/52}; //Play/Pause Button Triangle
  ButtonIconDivRatios[5] = new float[]{97.0/156, 79.0/130, 97.0/156, 82.0/130, 19.0/52, 161.0/260}; //Fast Forward Button Triangle One
  ButtonIconDivRatios[6] = new float[]{19.0/52, 79.0/130, 19.0/52, 82.0/130, 101.0/156, 161.0/260}; //Fast Forward Button Triangle Two
  ButtonIconDivRatios[7] = new float[]{121.0/156, 79.0/130, 121.0/156, 82.0/130, 83.0/104, 161.0/260}; //Next Button Triangle One
  ButtonIconDivRatios[8] = new float[]{125.0/156, 79.0/130, 125.0/156, 82.0/130, 125.0/156, 161.0/260}; //Next Button Triangle Two
  CalculateButtonIconDIVs();
  //
  //Background
  xPopupBackground = appWidth*0; yPopupBackground = appHeight*0; widthPopupBackground = appWidth-1; heightPopupBackground = appHeight-1;
  //
  //Music Panel
  xMusicPanel = appWidth*2/27; yMusicPanel = appHeight*1/10; widthMusicPanel = appWidth*23/27; heightMusicPanel = appHeight*4/5;
  xMusicTitle = appWidth*2/7; yMusicTitle = appHeight*3/20; TextDIVWidth[0] = appWidth*3/7; TextDIVHeight[0] = appHeight*1/11;
  xMusicAuthor = appWidth*1/3; yMusicAuthor = yMusicTitle+TextDIVHeight[0]; TextDIVWidth[1] = appWidth*1/3; TextDIVHeight[1] = appHeight*1/18;
  xMusicPublishDate = xMusicAuthor; yMusicPublishDate = yMusicAuthor+TextDIVHeight[1]; TextDIVWidth[2] = TextDIVWidth[1]; TextDIVHeight[2] = TextDIVHeight[1];
  xMusicImage = appWidth*1/3; yMusicImage = yMusicPublishDate+TextDIVHeight[2]; widthMusicImage = appWidth*1/3; heightMusicImage = appHeight*1/6;
  xMusicProgressBar = appWidth*5/26; yMusicProgressBar = appHeight*13/16; widthMusicProgressBar = appWidth*8/13; heightMusicProgressBar = appHeight*1/48;
  xIconAttribution = xMusicPanel+widthMusicPanel*1/16; yIconAttribution = yMusicPanel+heightMusicPanel*1/16; TextDIVWidth[4] = widthMusicPanel*7/8; TextDIVHeight[4] = appHeight*1/42;
  xBackgroundAttribution = xIconAttribution; yBackgroundAttribution = yIconAttribution+heightMusicPanel*1/10; TextDIVWidth[5] = TextDIVWidth[4]; TextDIVHeight[5] = TextDIVHeight[4];
  xSongAttribution1 = xSongAttribution2 = xSongAttribution3 = xSongAttribution4 = xSongAttribution5 = xSongAttribution6 = xIconAttribution;
  xSongAttribution1Line2 = xSongAttribution2Line2 = xSongAttribution3Line2 = xSongAttribution4Line2 = xSongAttribution5Line2 = xSongAttribution6Line2 = xSongAttribution1;
  ySongAttribution1 = yBackgroundAttribution+heightMusicPanel*1/9; ySongAttribution2 = ySongAttribution1+heightMusicPanel*1/9;
  ySongAttribution3 = ySongAttribution2+heightMusicPanel*1/9; ySongAttribution4 = ySongAttribution3+heightMusicPanel*1/9;
  ySongAttribution5 = ySongAttribution4+heightMusicPanel*1/9; ySongAttribution6 = ySongAttribution5+heightMusicPanel*1/9;
  ySongAttribution1Line2 = ySongAttribution1+heightMusicPanel*1/27; ySongAttribution2Line2 = ySongAttribution2+heightMusicPanel*1/27;
  ySongAttribution3Line2 = ySongAttribution3+heightMusicPanel*1/27; ySongAttribution4Line2 = ySongAttribution4+heightMusicPanel*1/27;
  ySongAttribution5Line2 = ySongAttribution5+heightMusicPanel*1/27; ySongAttribution6Line2 = ySongAttribution6+heightMusicPanel*1/27;
  TextDIVWidth[6] = TextDIVWidth[7] = TextDIVWidth[8] = TextDIVWidth[9] = TextDIVWidth[10] = TextDIVWidth[11] = TextDIVWidth[4];
  TextDIVWidth[12] = TextDIVWidth[13] = TextDIVWidth[14] = TextDIVWidth[15] = TextDIVWidth[16] = TextDIVWidth[17] = TextDIVWidth[6];
  TextDIVHeight[6] = TextDIVHeight[7] = TextDIVHeight[8] = TextDIVHeight[9] = TextDIVHeight[10] = TextDIVHeight[11] = TextDIVHeight[4];
  TextDIVHeight[12] = TextDIVHeight[13] = TextDIVHeight[14] = TextDIVHeight[15] = TextDIVHeight[16] = TextDIVHeight[17] = TextDIVHeight[6];
  //
  //Buttons
  xPrevious = ButtonDivs[4]; yPrevious = ButtonDivs[5]; widthPrevious = ButtonDivs[6]; heightPrevious = ButtonDivs[7];
  xRewind = ButtonDivs[8]; yRewind = ButtonDivs[9]; widthRewind = ButtonDivs[10]; heightRewind = ButtonDivs[11];
  xPlayPause = ButtonDivs[12]; yPlayPause = ButtonDivs[13]; widthPlayPause = ButtonDivs[14]; heightPlayPause = ButtonDivs[15];
  xFastForward = ButtonDivs[16]; yFastForward = ButtonDivs[17]; widthFastForward = ButtonDivs[18]; heightFastForward = ButtonDivs[19]; 
  xNext = ButtonDivs[20]; yNext = ButtonDivs[21]; widthNext = ButtonDivs[22]; heightNext = ButtonDivs[23]; 
  xShuffle = ButtonDivs[24]; yShuffle = ButtonDivs[25]; widthShuffle = ButtonDivs[26]; heightShuffle = ButtonDivs[27];
  xReplay = ButtonDivs[28]; yReplay = ButtonDivs[29]; widthReplay = ButtonDivs[30]; heightReplay = ButtonDivs[31];
  xLoop = ButtonDivs[32]; yLoop = ButtonDivs[33]; widthLoop = ButtonDivs[34]; heightLoop = ButtonDivs[35];
  xAttributions = ButtonDivs[36]; yAttributions = ButtonDivs[37]; TextDIVWidth[3] = ButtonDivs[38]; TextDIVHeight[3] = ButtonDivs[39];

  //
  //File Pathway
  String Up = "..";
  String Open = "/";
  String Images = "Music_Program_Images";
  String Imagepathway = Up + Open;
  String QuitImage = "exit.png";
  Quit = loadImage(Imagepathway+Images+Open+QuitImage);
  //
  //Music Pathway
  String RelativeMusicPathway = "/Music_Program_CS30_Audio_Files/";
  String AbsoluteMusicPathway = sketchPath(RelativeMusicPathway);
  AudioFiles = new File(AbsoluteMusicPathway);
  int AudioFileCount = AudioFiles.list().length;
  SongNumber = AudioFiles.list().length;
  File[] SongFiles = AudioFiles.listFiles();
  String[] SongFilePathway = new String[AudioFileCount];
  for (int i = SongPlaying; i < SongFiles.length; i++) {
    SongFilePathway[i] = (SongFiles[i].toString());
  }
  //
  String PathDirectory = sketchPath(AbsoluteMusicPathway);
  println("Main Directory to Music Folder", PathDirectory);
  file = new File(PathDirectory);
  int fileCount = file.list().length;
  println("File Count of the Music Folder:", fileCount);
  File[] files = file.listFiles();
  printArray(files);
  for (int i = SongPlaying; i < files.length; i++) {
    println("File Name", files[i].getName());
  }
  //
  for (int i=SongPlaying; i<AudioFileCount; i++) {
    SongPlayList[i]= minim.loadFile(SongFilePathway[i]);
    SongPlayListMetaData[i] = SongPlayList[i].getMetaData();
  }
  //
  //Sound Effects
  String RelativeSoundEffectPathway = "../Sound Effects/";
  String AbsoluteSoundEffectPathway = sketchPath(RelativeSoundEffectPathway);
  SoundEffectFiles = new File(AbsoluteSoundEffectPathway);
  int SoundEffectFileCount = SoundEffectFiles.list().length;
  File[] SoundEffectfiles2 = SoundEffectFiles.listFiles();
  String[] SoundEffectFilePathway = new String[SoundEffectFileCount];
  for (int i = SoundEffectPlaying; i < SoundEffectfiles2.length; i++) {
    SoundEffectFilePathway[i] = (SoundEffectfiles2[i].toString());
  }
  //
  String SoundEffectPathDirectory = sketchPath(AbsoluteSoundEffectPathway);
  println("Main Directory to Sound Effect Folder", SoundEffectPathDirectory);
  file = new File(SoundEffectPathDirectory);
  int SoundEffectfileCount = file.list().length;
  println("File Count of the Sound Effect Folder:", SoundEffectfileCount);
  File[] SoundEffectfiles = file.listFiles();
  for (int i = SoundEffectPlaying; i < SoundEffectfiles.length; i++) {
    println("File Name", SoundEffectfiles[i].getName());
  }
  //
  for (int i=SoundEffectPlaying; i<SoundEffectFileCount; i++) {
    SoundEffectPlayList[i]= minim.loadFile(SoundEffectFilePathway[i]);
    SoundEffectPlayListMetaData[i] = SoundEffectPlayList[i].getMetaData();
  }
  //
  //Images
  String ImagePathwayRelative = "/Music_Program_CS30_Image_Files/";
  String ImagePathwayAbsolute = sketchPath(ImagePathwayRelative);
  File ImageFolder = new File(ImagePathwayAbsolute);
  File[] ImageFiles = ImageFolder.listFiles();
  MusicProgramImage = new PImage[ImageFiles.length];
  for (int i = 0; i < ImageFiles.length; i++) {
    if (ImageFiles[i].isFile()) {
      MusicProgramImage[i] = loadImage(ImageFiles[i].getAbsolutePath());
    }
  }
  //
  //Music Images
  String MusicImagePathwayRelative = "/Music_Program_CS30_Music_Image_Files/";
  String MusicImagePathwayAbsolute = sketchPath(MusicImagePathwayRelative);
  File MusicImageFolder = new File(MusicImagePathwayAbsolute);
  File[] MusicImageFiles = MusicImageFolder.listFiles();
  MusicImage = new PImage[MusicImageFiles.length];
  for (int i = 0; i < MusicImageFiles.length; i++) {
    if (MusicImageFiles[i].isFile()) {
      MusicImage[i] = loadImage(MusicImageFiles[i].getAbsolutePath());
    }
  }
  //
  /*
  //Song Debugging
  println("File Name", SongPlayListMetaData[SongPlaying].fileName());
  println("Song Length (in milliseconds)", SongPlayListMetaData[SongPlaying].length());
  println("Song Length (in seconds)", SongPlayListMetaData[SongPlaying].length()/1000);
  println("Song Length (in minutes and seconds)", SongPlayListMetaData[SongPlaying].length()/1000/60, "minutes", SongPlayListMetaData[SongPlaying].length()/1000 - ((SongPlayListMetaData[SongPlaying].length()/1000/60)*60), "seconds");
  println("Song Title", SongPlayListMetaData[SongPlaying].title());
  println("Author", SongPlayListMetaData[SongPlaying].author());
  println("Composer", SongPlayListMetaData[SongPlaying].composer());
  println("Orchestra", SongPlayListMetaData[SongPlaying].orchestra());
  println("Album", SongPlayListMetaData[SongPlaying].album());
  println("Disc", SongPlayListMetaData[SongPlaying].disc());
  println("Publisher", SongPlayListMetaData[SongPlaying].publisher());
  println("Date Released", SongPlayListMetaData[SongPlaying].date());
  println("Copyright", SongPlayListMetaData[SongPlaying].copyright());
  println("Comments", SongPlayListMetaData[SongPlaying].comment());
  println("Lyrics", SongPlayListMetaData[SongPlaying].lyrics());
  println("Track", SongPlayListMetaData[SongPlaying].track());
  println("Genre", SongPlayListMetaData[SongPlaying].genre());
  println("Encoded", SongPlayListMetaData[SongPlaying].encoded());
  //
  println(SongPlaying);
  */
  //
  xIcons8Location = xIconAttribution + textWidth("Loop, Shuffle, and Rewind icons by ");
  xVecteezyLocation = xBackgroundAttribution + textWidth("Background Image by Tinnapon Wuttichaikitcharoen on ");
  //
  SongSkipTime = 5000;
  SongLengthAlteration = 5000;
  AlteredCurrentSongLength = max(SongPlayList[SongPlaying].length() - SongLengthAlteration, 1);
  SongTimeCounter = 0;
  //
  TitleFont = createFont("Times New Roman Bold", 55);
  AttributionFont = createFont("Calibri Bold", 55);
  //
  //Saved Song State from last use
  SongStateTxtPath_LastSongState = sketchPath("Last_Song_State.txt");
  LoadLastSongState();
  //
  /*
  String[] fontList = PFont.list();
   printArray(fontList);
   */
  //
} //End setup
void draw() {
  //
  shapeMode(CENTER);
  //
  MusicPanelTextSetup1();
  MusicPanelTextSetup2();
  //
  //  //Music Player Panel
  fill(Black);
  rect(xPopupBackground, yPopupBackground, widthPopupBackground, heightPopupBackground);
  image(MusicProgramImage[4], xPopupBackground, yPopupBackground, widthPopupBackground, heightPopupBackground);
  fill(resetDefaultInk);
  strokeWeight(3);
  stroke(Purple);
  fill(Black);
  rect(xMusicPanel, yMusicPanel, widthMusicPanel, heightMusicPanel);
  if (!Attributions) {
    rect(xMusicTitle, yMusicTitle, TextDIVWidth[0], TextDIVHeight[0]);
    rect(xMusicAuthor, yMusicAuthor, TextDIVWidth[1], TextDIVHeight[1]);
    rect(xMusicPublishDate, yMusicPublishDate, TextDIVWidth[2], TextDIVHeight[2]);
    rect(xMusicImage, yMusicImage, widthMusicImage, heightMusicImage);
    noStroke();
    //
    //Buttons
    strokeWeight(3);
    stroke(Purple);
    fill(Black);
    for (int i = 0; i < NumberOfButtonDIVs; i++) {
      int baseIndex = i * 4;
      rect(ButtonDivs[baseIndex], ButtonDivs[baseIndex + 1], ButtonDivs[baseIndex + 2], ButtonDivs[baseIndex + 3]);
    }
    //Music Button Icons
    stroke(TextPurple);
    fill(TextPurple);
    triangle(ButtonIconDivs[24], ButtonIconDivs[25], ButtonIconDivs[26], ButtonIconDivs[27], ButtonIconDivs[28], ButtonIconDivs[29]); //Play/Pause
    triangle(ButtonIconDivs[30], ButtonIconDivs[31], ButtonIconDivs[32], ButtonIconDivs[33], ButtonIconDivs[34], ButtonIconDivs[35]); //Fast Forward One
    triangle(ButtonIconDivs[36], ButtonIconDivs[37], ButtonIconDivs[38], ButtonIconDivs[39], ButtonIconDivs[40], ButtonIconDivs[41]); //Fast Forward Two
    triangle(ButtonIconDivs[12], ButtonIconDivs[13], ButtonIconDivs[14], ButtonIconDivs[15], ButtonIconDivs[16], ButtonIconDivs[17]); //Rewind One
    triangle(ButtonIconDivs[18], ButtonIconDivs[19], ButtonIconDivs[20], ButtonIconDivs[21], ButtonIconDivs[22], ButtonIconDivs[23]); //Rewind Two
    triangle(ButtonIconDivs[42], ButtonIconDivs[43], ButtonIconDivs[44], ButtonIconDivs[45], ButtonIconDivs[46], ButtonIconDivs[47]); //Next One
    triangle(ButtonIconDivs[48], ButtonIconDivs[49], ButtonIconDivs[50], ButtonIconDivs[51], ButtonIconDivs[52], ButtonIconDivs[53]); //Next Two
    triangle(ButtonIconDivs[0], ButtonIconDivs[1], ButtonIconDivs[2], ButtonIconDivs[3], ButtonIconDivs[4], ButtonIconDivs[5]); //Previous One
    triangle(ButtonIconDivs[6], ButtonIconDivs[7], ButtonIconDivs[8], ButtonIconDivs[9], ButtonIconDivs[10], ButtonIconDivs[11]); //Previous Two
    strokeWeight(1);
    stroke(Black);
    fill(resetDefaultInk);
    //
    //Images
    image(MusicProgramImage[0], ButtonDivs[0], ButtonDivs[1], ButtonDivs[2], ButtonDivs[3]); //Quit Button Image
    image(MusicProgramImage[1], xLoop, yLoop, widthLoop, heightLoop); //Loop Button Image
    image(MusicProgramImage[2], xReplay, yReplay, widthReplay, heightReplay); //Repalay Button Image
    image(MusicProgramImage[3], xShuffle, yShuffle, widthShuffle, heightShuffle); //Shuffle Button Image
    AspectRatioMusicImage(MusicImage[SongPlaying], xMusicImage, yMusicImage, widthMusicImage, heightMusicImage);
    //
    //Text
    fill(TextPurple);
    textAlign(CENTER, CENTER);
    textFont(TitleFont, FontSizes[0]);
    text(Text[0], xMusicTitle, yMusicTitle, TextDIVWidth[0], TextDIVHeight[0]);
    textFont(TitleFont, FontSizes[1]);
    text(Text[1], xMusicAuthor, yMusicAuthor, TextDIVWidth[1], TextDIVHeight[1]);
    textFont(TitleFont, FontSizes[1]);
    text(Text[2], xMusicPublishDate, yMusicPublishDate, TextDIVWidth[2], TextDIVHeight[2]);
    fill(resetDefaultInk);
  }
  //
  if (Attributions) {
    ImageMusicAttributions();
  }
  //  
  //Attributions
  strokeWeight(3);
  stroke(Purple);
  fill(Black);
  rect(xAttributions, yAttributions, TextDIVWidth[3], TextDIVHeight[3]);
  textAlign(CENTER, CENTER);
  textFont(TitleFont, FontSizes[3]);
  fill(TextPurple);
  text(Text[3], xAttributions, yAttributions, TextDIVWidth[3], TextDIVHeight[3]);
  //
  //Song Auto Transition
  if (SongPlayList[SongPlaying].position() >= AlteredCurrentSongLength && SongLoop == false) {
    SongPlaying += 1;
    if (SongPlaying > SongNumber - 1) {
      SongPlaying = 0;
    }
    SongPlayList[SongPlaying].play();
  } else if (SongPlayList[SongPlaying].position() >= AlteredCurrentSongLength && SongLoop == true) {
    SongPlayList[SongPlaying].rewind();
  }
  //
  if (!Attributions) {
    //Progress Bar and Progress Timer
    textFont(TitleFont, size);
    Music_Program_CS30_ProgressBar();
    Music_Program_CS30_ProgressTimer();
  }
  //
  //HoverOverColors
  Music_Program_CS20_HoverOver();
  //
} //End draw
//
void keyPressed() {
  //
  if (!Attributions) {
    if (key=='p' || key=='P') {
      KeyPlayPauseFunction ();
    }
    if (key=='r' || key=='R') {
      SongPlayList[SongPlaying].rewind();
    }
    if (key=='m' || key=='M') {
      KeyMuteFunction ();
    }
    if (key == CODED && keyCode == RIGHT) {
      SongPlayList[SongPlaying].skip(+SongSkipTime);
    }
    if (key == CODED && keyCode == LEFT) {
      SongPlayList[SongPlaying].skip(-SongSkipTime);
    }
    if (key >= '1' && key <= '9') {
      KeyBasedLocationFunction ();
    }
  }
  //
} //End keyPressed
//
void keyReleased() {
  //
} //End keyReleased
//
void mousePressed() {
  //
  //Progress Bar
  if (!Attributions) {
    if (MouseIsOver(xMusicProgressBar, yMusicProgressBar, widthMusicProgressBar, heightMusicProgressBar)) {
      float ProgressBarPositionClicked = mouseX-xMusicProgressBar*15/14;
      ProgressBarPositionClicked = constrain(ProgressBarPositionClicked, 0, widthMusicProgressBar);
      float SongPercentageAtClickPoint = ProgressBarPositionClicked/widthMusicProgressBar;
      int ClickedSongPosition = int(SongPercentageAtClickPoint*SongPlayList[SongPlaying].length());
      SongPlayList[SongPlaying].cue(ClickedSongPosition);
    }
    //
    //Buttons
    if (MouseIsOver(ButtonDivs[0], ButtonDivs[1], ButtonDivs[2], ButtonDivs[3])) {
      SaveLastSongState();
      exit();
    } else if (MouseIsOver(ButtonDivs[4], ButtonDivs[5], ButtonDivs[6], ButtonDivs[7])) {
      PreviousSongFunction();
    } else if (MouseIsOver(ButtonDivs[8], ButtonDivs[9], ButtonDivs[10], ButtonDivs[11])) {
      SongPlayList[SongPlaying].skip(-SongSkipTime);
    } else if (MouseIsOver(ButtonDivs[12], ButtonDivs[13], ButtonDivs[14], ButtonDivs[15])) {
      PlayPauseFunction();
    } else if (MouseIsOver(ButtonDivs[16], ButtonDivs[17], ButtonDivs[18], ButtonDivs[19])) {
      SongPlayList[SongPlaying].skip(SongSkipTime);
    } else if (MouseIsOver(ButtonDivs[20], ButtonDivs[21], ButtonDivs[22], ButtonDivs[23])) {
      NextSongFunction();
    } else if (MouseIsOver(ButtonDivs[24], ButtonDivs[25], ButtonDivs[26], ButtonDivs[27])) {
      ShuffleSongFunction();
    } else if (MouseIsOver(ButtonDivs[28], ButtonDivs[29], ButtonDivs[30], ButtonDivs[31])) {
      SongPlayList[SongPlaying].rewind();
    } else if (MouseIsOver(ButtonDivs[32], ButtonDivs[33], ButtonDivs[34], ButtonDivs[35])) {
      SongLoop = true;
    } else if (SongLoop == true) {
      SongLoop = false;

    }
  }
  if (Attributions) {
    ImageMusicAttributionsMousePressed();
  }
  if (MouseIsOver(xAttributions, yAttributions, TextDIVWidth[3], TextDIVHeight[3])) {
    ToggleAttributions();
  }
  //
} //End mousePressed
void CalculateButtonDIVs() {
  for (int i = 0; i < NumberOfButtonDIVs; i++) {
    int baseIndex = i * 4;
    ButtonDivs[baseIndex] = appWidth*ButtonDivRatios[i][0]; //X position
    ButtonDivs[baseIndex+1] = appHeight*ButtonDivRatios[i][1]; //Y position
    ButtonDivs[baseIndex+2] = appWidth*ButtonDivRatios[i][2]; //Width
    if (i != 0 || i == 9) {
      ButtonDivs[baseIndex+3] = ButtonDivs[baseIndex+2]; //Square Buttons
    } else {
      ButtonDivs[baseIndex+3] = appHeight*ButtonDivRatios[i][3]; //Height
    }
  }
}
void CalculateButtonIconDIVs() {
  for (int i = 0; i < NumberOfButtonIconDIVs; i++) {
    int baseIndex = i*6;
    ButtonIconDivs[baseIndex] = appWidth*ButtonIconDivRatios[i][0]; //X position
    ButtonIconDivs[baseIndex+1] = appHeight*ButtonIconDivRatios[i][1]; //Y position
    ButtonIconDivs[baseIndex+2] = appWidth*ButtonIconDivRatios[i][2]; //2nd X position
    ButtonIconDivs[baseIndex+3] = appHeight*ButtonIconDivRatios[i][3]; //2nd y position
    ButtonIconDivs[baseIndex+4] = appWidth*ButtonIconDivRatios[i][4]; //3rd X position
    ButtonIconDivs[baseIndex+5] = appHeight*ButtonIconDivRatios[i][5]; //3rd y position
  }
}
//
//End MAIN Program
