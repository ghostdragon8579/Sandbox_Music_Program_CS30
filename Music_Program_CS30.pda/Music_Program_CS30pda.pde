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
float xPlayPause, yPlayPause, widthPlayPause, heightPlayPause;
float xPlayPauseTriangle1, yPlayPauseTriangle1, xPlayPauseTriangle2, yPlayPauseTriangle2, xPlayPauseTriangle3, yPlayPauseTriangle3;
float xFastForward, yFastForward, widthFastForward, heightFastForward;
float xFastForwardTriangleOne1, yFastForwardTriangleOne1, xFastForwardTriangleOne2, yFastForwardTriangleOne2, xFastForwardTriangleOne3, yFastForwardTriangleOne3;
float xFastForwardTriangleTwo1, yFastForwardTriangleTwo1, xFastForwardTriangleTwo2, yFastForwardTriangleTwo2, xFastForwardTriangleTwo3, yFastForwardTriangleTwo3;
float xRewind, yRewind, widthRewind, heightRewind;
float xRewindTriangleOne1, yRewindTriangleOne1, xRewindTriangleOne2, yRewindTriangleOne2, xRewindTriangleOne3, yRewindTriangleOne3;
float xRewindTriangleTwo1, yRewindTriangleTwo1, xRewindTriangleTwo2, yRewindTriangleTwo2, xRewindTriangleTwo3, yRewindTriangleTwo3;
float xNext, yNext, widthNext, heightNext;
float xNextTriangleOne1, yNextTriangleOne1, xNextTriangleOne2, yNextTriangleOne2, xNextTriangleOne3, yNextTriangleOne3;
float xNextTriangleTwo1, yNextTriangleTwo1, xNextTriangleTwo2, yNextTriangleTwo2, xNextTriangleTwo3, yNextTriangleTwo3;
float xPrevious, yPrevious, widthPrevious, heightPrevious;
float xPreviousTriangleOne1, yPreviousTriangleOne1, xPreviousTriangleOne2, yPreviousTriangleOne2, xPreviousTriangleOne3, yPreviousTriangleOne3;
float xPreviousTriangleTwo1, yPreviousTriangleTwo1, xPreviousTriangleTwo2, yPreviousTriangleTwo2, xPreviousTriangleTwo3, yPreviousTriangleTwo3;
float xQuit, yQuit, widthQuit, heightQuit;
float xShuffle, yShuffle, widthShuffle, heightShuffle;
float xReplay, yReplay, widthReplay, heightReplay;
float xLoop, yLoop, widthLoop, heightLoop;
float xIcons8Location;
float xVecteezyLocation;
float ProgressWidth;
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
  xQuit = appWidth*23/24; yQuit = appHeight*0; widthQuit = appWidth*1/24; heightQuit = appHeight*1/30;
  xPrevious = appWidth*5/26; yPrevious = appHeight*24/40; widthPrevious = appWidth*1/26; heightPrevious = widthPrevious;
  xRewind = appWidth*9/26; yRewind = yPrevious; widthRewind = widthPrevious; heightRewind = heightPrevious;
  xPlayPause = appWidth*25/52; yPlayPause = yPrevious; widthPlayPause = widthPrevious; heightPlayPause = heightPrevious;
  xFastForward = appWidth*16/26; yFastForward = yPlayPause; widthFastForward = widthPrevious; heightFastForward = heightPrevious; 
  xNext = appWidth*20/26; yNext = yPrevious; widthNext = widthPrevious; heightNext = heightPrevious; 
  xShuffle = xPlayPause; yShuffle = yPlayPause+heightPrevious*1.5; widthShuffle = widthPrevious; heightShuffle = heightPrevious;
  xReplay = xRewind; yReplay = yShuffle; widthReplay = widthPrevious; heightReplay = heightPrevious;
  xLoop = xFastForward; yLoop = yShuffle; widthLoop = widthPrevious; heightLoop = heightPrevious;
  xAttributions = appWidth*0; yAttributions = appHeight*23/24; TextDIVWidth[3] = appWidth*1/12; TextDIVHeight[3] = appHeight*1/24;
  //
  //Music Button Icons
  xPlayPauseTriangle1 = xPlayPause+widthPlayPause*1/5; yPlayPauseTriangle1 = yPlayPause+heightPlayPause*1/5;
  xPlayPauseTriangle2 = xPlayPauseTriangle1; yPlayPauseTriangle2 = yPlayPause+heightPlayPause*4/5;
  xPlayPauseTriangle3 = xPlayPause+widthPlayPause*4/5; yPlayPauseTriangle3 = yPlayPause+heightPlayPause*1/2;
  xFastForwardTriangleOne1 = xFastForward+widthFastForward*1/6; yFastForwardTriangleOne1 = yPlayPauseTriangle1;
  xFastForwardTriangleOne2 = xFastForwardTriangleOne1; yFastForwardTriangleOne2 = yPlayPauseTriangle2;
  xFastForwardTriangleOne3 = xFastForward+widthFastForward*1/2; yFastForwardTriangleOne3 = yPlayPauseTriangle3;
  xFastForwardTriangleTwo1 = xFastForwardTriangleOne3; yFastForwardTriangleTwo1 = yPlayPauseTriangle1;
  xFastForwardTriangleTwo2 = xFastForwardTriangleOne3; yFastForwardTriangleTwo2 = yPlayPauseTriangle2;
  xFastForwardTriangleTwo3 = xFastForward+widthFastForward*5/6; yFastForwardTriangleTwo3 = yPlayPauseTriangle3;
  xRewindTriangleOne1 = xRewind+widthRewind*1/6; yRewindTriangleOne1 = yPlayPauseTriangle3;
  xRewindTriangleOne2 = xRewind+widthRewind*1/2; yRewindTriangleOne2 = yPlayPauseTriangle1;
  xRewindTriangleOne3 = xRewindTriangleOne2; yRewindTriangleOne3 = yPlayPauseTriangle2; 
  xRewindTriangleTwo1 = xRewindTriangleOne2; yRewindTriangleTwo1 = yPlayPauseTriangle3;
  xRewindTriangleTwo2 = xRewind+widthRewind*5/6; yRewindTriangleTwo2 = yPlayPauseTriangle1;
  xRewindTriangleTwo3 = xRewindTriangleTwo2; yRewindTriangleTwo3 = yPlayPauseTriangle2;
  xNextTriangleOne1 = xNext+widthNext*1/6; yNextTriangleOne1 = yPlayPauseTriangle1;
  xNextTriangleOne2 = xNextTriangleOne1; yNextTriangleOne2 = yPlayPauseTriangle2;
  xNextTriangleOne3 = xNext+widthNext*3/4; yNextTriangleOne3 = yPlayPauseTriangle3;
  xNextTriangleTwo1 = xNext+widthNext*5/6; yNextTriangleTwo1 = yPlayPauseTriangle1;
  xNextTriangleTwo2 = xNextTriangleTwo1; yNextTriangleTwo2 = yPlayPauseTriangle2;
  xNextTriangleTwo3 = xNextTriangleTwo1; yNextTriangleTwo3 = yPlayPauseTriangle3;
  xPreviousTriangleOne1 = xPrevious+widthPrevious*5/6; yPreviousTriangleOne1 = yPlayPauseTriangle1;
  xPreviousTriangleOne2 = xPreviousTriangleOne1; yPreviousTriangleOne2 = yPlayPauseTriangle2;
  xPreviousTriangleOne3 = xPrevious+widthPrevious*1/4; yPreviousTriangleOne3 = yPlayPauseTriangle3;
  xPreviousTriangleTwo1 = xPrevious+widthPrevious*1/6; yPreviousTriangleTwo1 = yPlayPauseTriangle1;
  xPreviousTriangleTwo2 = xPreviousTriangleTwo1; yPreviousTriangleTwo2 = yPlayPauseTriangle2;
  xPreviousTriangleTwo3 = xPreviousTriangleTwo1; yPreviousTriangleTwo3 = yPlayPauseTriangle3;
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
  //Background
  fill(Black);
  rect(xPopupBackground, yPopupBackground, widthPopupBackground, heightPopupBackground);
  image(MusicProgramImage[4], xPopupBackground, yPopupBackground, widthPopupBackground, heightPopupBackground);
  fill(resetDefaultInk);
  //
  //Music Player Panel
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
    rect(xPlayPause, yPlayPause, widthPlayPause, heightPlayPause);
    rect(xFastForward, yFastForward, widthFastForward, heightFastForward);
    rect(xRewind, yRewind, widthRewind, heightRewind);
    rect(xNext, yNext, widthNext, heightNext);
    rect(xPrevious, yPrevious, widthPrevious, heightPrevious);
    rect(xQuit, yQuit, widthQuit, heightQuit);
    rect(xShuffle, yShuffle, widthShuffle, heightShuffle);
    rect(xLoop, yLoop, widthLoop, heightLoop);
    rect(xReplay, yReplay, widthReplay, heightReplay);
    //
    //Music Button Icons
    stroke(TextPurple);
    fill(TextPurple);
    triangle(xPlayPauseTriangle1, yPlayPauseTriangle1, xPlayPauseTriangle2, yPlayPauseTriangle2, xPlayPauseTriangle3, yPlayPauseTriangle3);
    triangle(xFastForwardTriangleOne1, yFastForwardTriangleOne1, xFastForwardTriangleOne2, yFastForwardTriangleOne2, xFastForwardTriangleOne3, yFastForwardTriangleOne3);
    triangle(xFastForwardTriangleTwo1, yFastForwardTriangleTwo1, xFastForwardTriangleTwo2, yFastForwardTriangleTwo2, xFastForwardTriangleTwo3, yFastForwardTriangleTwo3);
    triangle(xRewindTriangleOne1, yRewindTriangleOne1, xRewindTriangleOne2, yRewindTriangleOne2, xRewindTriangleOne3, yRewindTriangleOne3);
    triangle(xRewindTriangleTwo1, yRewindTriangleTwo1, xRewindTriangleTwo2, yRewindTriangleTwo2, xRewindTriangleTwo3, yRewindTriangleTwo3);
    triangle(xNextTriangleOne1, yNextTriangleOne1, xNextTriangleOne2, yNextTriangleOne2, xNextTriangleOne3, yNextTriangleOne3);
    triangle(xNextTriangleTwo1, yNextTriangleTwo1, xNextTriangleTwo2, yNextTriangleTwo2, xNextTriangleTwo3, yNextTriangleTwo3);
    triangle(xPreviousTriangleOne1, yPreviousTriangleOne1, xPreviousTriangleOne2, yPreviousTriangleOne2, xPreviousTriangleOne3, yPreviousTriangleOne3);
    triangle(xPreviousTriangleTwo1, yPreviousTriangleTwo1, xPreviousTriangleTwo2, yPreviousTriangleTwo2, xPreviousTriangleTwo3, yPreviousTriangleTwo3);
    strokeWeight(1);
    stroke(Black);
    fill(resetDefaultInk);
    //
    //Images
    image(MusicProgramImage[0], xQuit, yQuit, widthQuit, heightQuit);
    image(MusicProgramImage[1], xLoop, yLoop, widthLoop, heightLoop);
    image(MusicProgramImage[2], xReplay, yReplay, widthReplay, heightReplay);
    image(MusicProgramImage[3], xShuffle, yShuffle, widthShuffle, heightShuffle);
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
  if (Attributions) {
    ImageMusicAttributions();
  }
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
      float ProgressBarPositionClicked = mouseX-xMusicProgressBar*12/11;
      ProgressBarPositionClicked = constrain(ProgressBarPositionClicked, 0, widthMusicProgressBar);
      float SongPercentageAtClickPoint = ProgressBarPositionClicked/widthMusicProgressBar;
      int ClickedSongPosition = int(SongPercentageAtClickPoint*SongPlayList[SongPlaying].length());
      SongPlayList[SongPlaying].cue(ClickedSongPosition);
    }
    //
    //Buttons
    if (MouseIsOver(xPlayPause, yPlayPause, widthPlayPause, heightPlayPause)) {
      PlayPauseFunction();
    } else if (MouseIsOver(xNext, yNext, widthNext, heightNext)) {
      NextSongFunction();
    } else if (MouseIsOver(xPrevious, yPrevious, widthPrevious, heightPrevious)) {
      PreviousSongFunction();
    } else if (MouseIsOver(xFastForward, yFastForward, widthFastForward, heightFastForward)) {
      SongPlayList[SongPlaying].skip(SongSkipTime);
    } else if (MouseIsOver(xRewind, yRewind, widthRewind, heightRewind)) {
      SongPlayList[SongPlaying].skip(-SongSkipTime);
    } else if (MouseIsOver(xReplay, yReplay, widthReplay, heightReplay)) {
      SongPlayList[SongPlaying].rewind();
    } else if (MouseIsOver(xShuffle, yShuffle, widthShuffle, heightShuffle)) {
      ShuffleSongFunction();
    } else if (MouseIsOver(xLoop, yLoop, widthLoop, heightLoop)) {
      SongLoop = true;
    } else if (SongLoop == true) {
      SongLoop = false;
    } else if (MouseIsOver(xQuit, yQuit, widthQuit, heightQuit)) {
      SaveLastSongState();
      exit();
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
//
//End MAIN Program
