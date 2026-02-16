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
float xPopupBackground, yPopupBackground, widthPopupBackground, heightPopupBackground;
float xAttributionBackground, yAttributionBackground, widthAttributionBackground, heightAttributionBackground;
float xBackgroundAttribution, yBackgroundAttribution;
float xMusicPanel, yMusicPanel, widthMusicPanel, heightMusicPanel;
float xMusicImage, yMusicImage, widthMusicImage, heightMusicImage;
float xMusicProgressBar, yMusicProgressBar, widthMusicProgressBar, heightMusicProgressBar;
float xSongAttribution1, ySongAttribution1, xSongAttribution1Line2, ySongAttribution1Line2;
float xSongAttribution2, ySongAttribution2, xSongAttribution2Line2, ySongAttribution2Line2;
float xSongAttribution3, ySongAttribution3, xSongAttribution3Line2, ySongAttribution3Line2;
float xSongAttribution4, ySongAttribution4, xSongAttribution4Line2, ySongAttribution4Line2;
float xSongAttribution5, ySongAttribution5, xSongAttribution5Line2, ySongAttribution5Line2;
float xSongAttribution6, ySongAttribution6, xSongAttribution6Line2, ySongAttribution6Line2;
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
  ButtonIconDivRatios[0] = new float[]{5.0/26+5.0/156, 24.0/40+1.2/104, 5.0/26+5.0/156, 24.0/40+4.8/104, 2.0/10, 25.0/40+1.0/208}; //Previous Button Triangle One
  ButtonIconDivRatios[1] = new float[]{5.0/26+1.0/156, 24.0/40+1.0/104, 5.0/26+1.0/156, 24.0/40+5.0/104, 5.0/26+1.0/156, 25.0/40+1.0/208}; //Previous Button Triangle Two
  ButtonIconDivRatios[2] = new float[]{9.0/26+2.0/104, 24.0/40+1.3/104, 9.0/26+2.0/104, 24.0/40+4.7/104, 9.0/26+1.0/156, 25.0/40+1.0/208}; //Rewind Button Triangle One
  ButtonIconDivRatios[3] = new float[]{9.0/26+2.0/104+2.0/156, 24.0/40+1.3/104, 9.0/26+2.0/104+2.0/156, 24.0/40+4.7/104, 9.0/26+2.0/104, 25.0/40+1.0/208}; //Rewind Button Triangle Two
  ButtonIconDivRatios[4] = new float[]{25.4/52, 24.0/40+1.0/104, 25.4/52, 24.0/40+5.0/104, 26.6/52, 25.0/40+1.0/208}; //Play/Pause Button Triangle
  ButtonIconDivRatios[5] = new float[]{16.0/26+1.0/156, 24.0/40+1.3/104, 16.0/26+1.0/156, 24.0/40+4.7/104, 16.0/26+3.0/156, 25.0/40+1.0/208}; //Fast Forward Button Triangle One
  ButtonIconDivRatios[6] = new float[]{16.0/26+3.0/156, 24.0/40+1.3/104, 16.0/26+3.0/156, 24.0/40+4.7/104, 16.0/26+5.0/156, 25.0/40+1.0/208}; //Fast Forward Button Triangle Two
  ButtonIconDivRatios[7] = new float[]{20.0/26+1.0/156, 24.0/40+1.2/104, 20.0/26+1.0/156, 24.0/40+4.8/104, 20.0/26+4.7/156, 25.0/40+1.0/208}; //Next Button Triangle One
  ButtonIconDivRatios[8] = new float[]{20.0/26+5.0/156, 24.0/40+1.0/104, 20.0/26+5.0/156, 24.0/40+5.0/104, 20.0/26+5.0/156, 25.0/40+1.0/208}; //Next Button Triangle Two
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
      int baseIndex = i*4;
      rect(ButtonDivs[baseIndex], ButtonDivs[baseIndex+1], ButtonDivs[baseIndex+2], ButtonDivs[baseIndex+3]);
    }
    //
    //Music Button Icons
    strokeWeight(3);
    stroke(TextPurple);
    fill(TextPurple);
    for (int i = 0; i < NumberOfButtonIconDIVs; i++) {
      int baseIndex = i*6;
      triangle(ButtonIconDivs[baseIndex], ButtonIconDivs[baseIndex+1], ButtonIconDivs[baseIndex+2], ButtonIconDivs[baseIndex+3], ButtonIconDivs[baseIndex+4], ButtonIconDivs[baseIndex+5]);
    }
    //
    //Images
    image(MusicProgramImage[0], ButtonDivs[0], ButtonDivs[1], ButtonDivs[2], ButtonDivs[3]); //Quit Button Image
    image(MusicProgramImage[3], ButtonDivs[24], ButtonDivs[25], ButtonDivs[26], ButtonDivs[27]); //Shuffle Button Image
    image(MusicProgramImage[2], ButtonDivs[28], ButtonDivs[29], ButtonDivs[30], ButtonDivs[31]); //Replay Button Image
    image(MusicProgramImage[1], ButtonDivs[32], ButtonDivs[33], ButtonDivs[34], ButtonDivs[35]); //Loop Button Image
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
    int baseIndex = i * 6;
    ButtonIconDivs[baseIndex] = appWidth*ButtonIconDivRatios[i][0]; // X1 position
    ButtonIconDivs[baseIndex+1] = appHeight*ButtonIconDivRatios[i][1]; // Y1 position
    ButtonIconDivs[baseIndex+2] = appWidth*ButtonIconDivRatios[i][2]; // X2 position
    ButtonIconDivs[baseIndex+3] = appHeight*ButtonIconDivRatios[i][3]; // Y2 position
    ButtonIconDivs[baseIndex+4] = appWidth*ButtonIconDivRatios[i][4]; // X3 position
    ButtonIconDivs[baseIndex+5] = appHeight*ButtonIconDivRatios[i][5]; // Y3 position
  }
}
//
//End MAIN Program
