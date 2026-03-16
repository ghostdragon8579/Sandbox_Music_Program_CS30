class MusicPlayerDivs {
//
//Global Variables
float[] TextDIVWidth = new float[18];
float[] TextDIVHeight = new float[18];
float xMusicProgressBar, yMusicProgressBar, widthMusicProgressBar, heightMusicProgressBar;
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
int SongPlaying = SongNumber-SongNumber;
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
//
int NumberOfMusicPanelDIVs = 7; //All Music Panel components
float[][] MusicPanelDivRatios = new float[NumberOfMusicPanelDIVs][4]; //Store ratios (Rectangles)
float[] MusicPanelDivs = new float [NumberOfMusicPanelDIVs*4]; //Music Panel Position and Size of components
int NumberOfButtonDIVs = 10; //All Music Player Buttons
float[][] ButtonDivRatios = new float[NumberOfButtonDIVs][4]; //Store ratios (Rectangles)
float[] ButtonDivs = new float [NumberOfButtonDIVs*4]; //Button Positions and Size
int NumberOfButtonIconDIVs = 9; //All Music Player Button Icons
float[][] ButtonIconDivRatios = new float[NumberOfButtonIconDIVs][6]; //Store ratios (Triangles)
float[] ButtonIconDivs = new float [NumberOfButtonIconDIVs*6]; //Icon Positions and Size
//int NumberOfAltButtonIconDIVs = 9; //All Alternate Music Player Button Icons
//float[][] AftButtonIconDivRatios = new float[NumberOfAltButtonIconDIVs][4]; //Store ratios (rectangle)
//float[] AltButtonIconDivs = new float [NumberOfAltButtonIconDIVs*4]; //Icon Positions and Size
int NumberOfTextDIVs = 18; //All Text instances
float[][] TextDivRatios = new float[NumberOfTextDIVs][4]; //Store ratios (Rectangles)
float[] TextDivs = new float [NumberOfTextDIVs*4]; //Text Positions and Size
  //
  /*
  Each matrix array contains two different arrays so I will use the Music Panel array as an example. In this array it creates a string of four variables per div called MusicPanelDiveRatios which stores
  coordinates as ratios in groups of four as the array MusicPanelDivs and gives them a designation depending on if it is the 1st, 2nd, 3rd, or 4th ratio in the group. The designations are as follows:
  1st ratio: X which is the Position from left as a fraction of appWidth, 2nd ratio: Y which is the Position from left as a fraction of appHeight, 3rd ratio: Width as a fraction of appWidth and
  4th ratio: Height as a fraction of appHeight. The ratios are given their values by inputing them into MusicPanelDiveRatios thus giving each value in MusicPanelDivs a ratio. Every ratio is then
  converted into a function of either appWidth for the x and width ratios or appHeight for the y and height ratios. Finally every group is generated as a rectangle in the Music Panel. The same process
  is used in ButtonIconDivRatios except there are 6 ratios and the 1st, 3rd and 5th are ratios of X and the 2nd, 4th and 6th are ratios of Y as triangles do not use a width or height when being created.
  However the function conversion and generation are the same but creating triangles instead of rectangles.
  */
  MusicPlayerDivs() {
    MusicProgramDivs();
    MusicPlayerSetup();
  }
  //
void MusicProgramDivs() {
  //
  //Music Panel Divs
  //{X value in ratio of appwidth, Y value in ratio of appwidth, width value in ratio of appwidth, height value in ratio of appheight}
  MusicPanelDivRatios[0] = new float[]{0.0, 0.0, 1.0/1, 1.0/1}; //Background Component
  MusicPanelDivRatios[1] = new float[]{2.0/27, 1.0/10, 23.0/27, 4.0/5}; //Music Panel Component
  MusicPanelDivRatios[2] = new float[]{2.0/7, 3.0/20, 3.0/7, 1.0/11}; //Song Title Component
  MusicPanelDivRatios[3] = new float[]{1.0/3, 3.0/20+1.0/11, 1.0/3, 1.0/18}; //Song Author Component
  MusicPanelDivRatios[4] = new float[]{1.0/3, 3.0/20+1.0/11+1.0/18, 1.0/3, 1.0/18}; //Date of Publish/Release
  MusicPanelDivRatios[5] = new float[]{1.0/3, 3.0/20+1.0/11+1.0/9, 1.0/3, 1.0/6}; //Song Image Component
  MusicPanelDivRatios[6] = new float[]{5.0/26, 13.0/16, 8.0/13, 1.0/48}; //Song Progress Bar
  //
  //Button Divs
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
  //
  //Button Icon Divs
  //{The first, third and fifth ratios are X values in ratio of appwidth. The second, fourth and sixth ratios are y values in ratio of appheight}
  ButtonIconDivRatios[0] = new float[]{5.0/26+5.0/156, 24.0/40+1.2/104, 5.0/26+5.0/156, 24.0/40+4.8/104, 2.0/10, 25.0/40+1.0/208}; //Previous Button Triangle One
  ButtonIconDivRatios[1] = new float[]{5.0/26+1.0/156, 24.0/40+1.0/104, 5.0/26+1.0/156, 24.0/40+5.0/104, 5.0/26+1.0/156, 25.0/40+1.0/208}; //Previous Button Triangle Two
  ButtonIconDivRatios[2] = new float[]{9.0/26+2.0/104, 24.0/40+1.3/104, 9.0/26+2.0/104, 24.0/40+4.7/104, 9.0/26+1.0/156, 25.0/40+1.0/208}; //Rewind Button Triangle One
  ButtonIconDivRatios[3] = new float[]{9.0/26+5.0/156, 24.0/40+1.3/104, 9.0/26+5.0/156, 24.0/40+4.7/104, 9.0/26+2.0/104, 25.0/40+1.0/208}; //Rewind Button Triangle Two
  ButtonIconDivRatios[4] = new float[]{25.4/52, 24.0/40+1.0/104, 25.4/52, 24.0/40+5.0/104, 26.6/52, 25.0/40+1.0/208}; //Play/Pause Button Triangle
  ButtonIconDivRatios[5] = new float[]{16.0/26+1.0/156, 24.0/40+1.3/104, 16.0/26+1.0/156, 24.0/40+4.7/104, 16.0/26+3.0/156, 25.0/40+1.0/208}; //Fast Forward Button Triangle One
  ButtonIconDivRatios[6] = new float[]{16.0/26+3.0/156, 24.0/40+1.3/104, 16.0/26+3.0/156, 24.0/40+4.7/104, 16.0/26+5.0/156, 25.0/40+1.0/208}; //Fast Forward Button Triangle Two
  ButtonIconDivRatios[7] = new float[]{20.0/26+1.0/156, 24.0/40+1.2/104, 20.0/26+1.0/156, 24.0/40+4.8/104, 20.0/26+4.7/156, 25.0/40+1.0/208}; //Next Button Triangle One
  ButtonIconDivRatios[8] = new float[]{20.0/26+5.0/156, 24.0/40+1.0/104, 20.0/26+5.0/156, 24.0/40+5.0/104, 20.0/26+5.0/156, 25.0/40+1.0/208}; //Next Button Triangle Two
  //
  //Text Divs
  //{The first, third and fifth ratios are X values in ratio of appwidth. The second, fourth and sixth ratios are y values in ratio of appheight}
  TextDivRatios[0] = new float[]{2.0/7, 3.0/20, 3.0/7, 1.0/11}; //Song Title
  TextDivRatios[1] = new float[]{1.0/3, 3.0/20+1.0/11, 1.0/3, 1.0/18}; //Song Author
  TextDivRatios[2] = new float[]{1.0/3, 3.0/20+1.0/11+1.0/18, 1.0/3, 1.0/18}; //Song Publish Date
  TextDivRatios[3] = new float[]{0.0, 23.0/24, 1.0/12, 1.0/24}; //Attribution Button Text
  TextDivRatios[4] = new float[]{2.0/27+23/432, 1.0/10+1.0/20, 23.0/27, 1.0/42}; //Icon Attribution
  TextDivRatios[5] = new float[]{2.0/27+23/432, 23.0/100, 23.0/27, 1.0/42}; //Background Attribution
  TextDivRatios[6] = new float[]{2.0/27+23/432, 23.0/100+22.0/243, 23.0/27, 1.0/42}; //Song Attribution 1
  TextDivRatios[7] = new float[]{2.0/27+23/432, 23.0/100+44.0/243, 23.0/27, 1.0/42}; //Song Attribution 2
  TextDivRatios[8] = new float[]{2.0/27+23/432, 23.0/100+65.0/243, 23.0/27, 1.0/42}; //Song Attribution 3
  TextDivRatios[9] = new float[]{2.0/27+23/432, 23.0/100+86.0/243, 23.0/27, 1.0/42}; //Song Attribution 4
  TextDivRatios[10] = new float[]{2.0/27+23/432, 23.0/100+108.0/243, 23.0/27, 1.0/42}; //Song Attribution 5
  TextDivRatios[11] = new float[]{2.0/27+23/432, 23.0/100+130.0/243, 23.0/27, 1.0/42}; //Song Attribution 6
  TextDivRatios[12] = new float[]{2.0/27+23/432, 23.0/100+146.0/1215, 23.0/27, 1.0/42}; //Song Attribution 1 line 2
  TextDivRatios[13] = new float[]{2.0/27+23/432, 23.0/100+256.0/1215, 23.0/27, 1.0/42}; //Song Attribution 2 line 2
  TextDivRatios[14] = new float[]{2.0/27+23/432, 23.0/100+361.0/1215, 23.0/27, 1.0/42}; //Song Attribution 3 line 2
  TextDivRatios[15] = new float[]{2.0/27+23/432, 23.0/100+466.0/1215, 23.0/27, 1.0/42}; //Song Attribution 4 line 2
  TextDivRatios[16] = new float[]{2.0/27+23/432, 23.0/100+64.0/135, 23.0/27, 1.0/42}; //Song Attribution 5 line 2
  TextDivRatios[17] = new float[]{2.0/27+23/432, 23.0/100+686.0/1215, 23.0/27, 1.0/42}; //Song Attribution 6 line 2
  //
  CalculateDIVs();
  //
}
void CalculateDIVs() {
  for (int i = 0; i < NumberOfMusicPanelDIVs; i++) {
    int baseIndex = i * 4;
    MusicPanelDivs[baseIndex] = appWidth*MusicPanelDivRatios[i][0]; //X position
    MusicPanelDivs[baseIndex+1] = appHeight*MusicPanelDivRatios[i][1]; //Y position
    MusicPanelDivs[baseIndex+2] = appWidth*MusicPanelDivRatios[i][2]; //Width
    MusicPanelDivs[baseIndex+3] = appHeight*MusicPanelDivRatios[i][3]; //Height
  }
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
  for (int i = 0; i < NumberOfButtonIconDIVs; i++) {
    int baseIndex = i * 6;
    ButtonIconDivs[baseIndex] = appWidth*ButtonIconDivRatios[i][0]; // X1 position
    ButtonIconDivs[baseIndex+1] = appHeight*ButtonIconDivRatios[i][1]; // Y1 position
    ButtonIconDivs[baseIndex+2] = appWidth*ButtonIconDivRatios[i][2]; // X2 position
    ButtonIconDivs[baseIndex+3] = appHeight*ButtonIconDivRatios[i][3]; // Y2 position
    ButtonIconDivs[baseIndex+4] = appWidth*ButtonIconDivRatios[i][4]; // X3 position
    ButtonIconDivs[baseIndex+5] = appHeight*ButtonIconDivRatios[i][5]; // Y3 position
  }
  for (int i = 0; i < NumberOfTextDIVs; i++) {
    int baseIndex = i * 4;
    TextDivs[baseIndex] = appWidth*TextDivRatios[i][0];
    TextDivs[baseIndex+1] = appHeight*TextDivRatios[i][1];
    TextDivs[baseIndex+2] = appWidth*TextDivRatios[i][2];
    TextDivs[baseIndex+3] = appHeight*TextDivRatios[i][3];
    TextDIVWidth[i] = TextDivs[baseIndex+2];
    TextDIVHeight[i] = TextDivs[baseIndex+3];
  }
} 
void MusicPlayerSetup() {
  //
  //Music Panel
  xMusicProgressBar = appWidth*5/26; yMusicProgressBar = appHeight*13/16; widthMusicProgressBar = appWidth*8/13; heightMusicProgressBar = appHeight*1/48;
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
  */
  //
  println(SongPlaying);
  //
  xIcons8Location = TextDivs[16]+textWidth("Loop, Shuffle, and Rewind icons by ");
  xVecteezyLocation = TextDivs[20]+textWidth("Background Image by Tinnapon Wuttichaikitcharoen on ");
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
}
void draw() {
  //
  MusicPanelTextSetup1();
  MusicPanelTextSetup2();
  //
  //  
  //Music Player Panel
  fill(Black);
  image(MusicProgramImage[4], MusicPanelDivs[0], MusicPanelDivs[1], MusicPanelDivs[2], MusicPanelDivs[3]);
  fill(resetDefaultInk);
  strokeWeight(3);
  stroke(Purple);
  fill(Black);
  rect(MusicPanelDivs[4], MusicPanelDivs[5], MusicPanelDivs[6], MusicPanelDivs[7]);
  if (!Attributions) {
    strokeWeight(3);
    stroke(Purple);
    fill(Black);
    for (int i = 1; i < NumberOfMusicPanelDIVs; i++) {
      int baseIndex = i*4;
      rect(MusicPanelDivs[baseIndex], MusicPanelDivs[baseIndex+1], MusicPanelDivs[baseIndex+2], MusicPanelDivs[baseIndex+3]);
    }
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
    AspectRatioMusicImage(MusicImage[SongPlaying], MusicPanelDivs[20], MusicPanelDivs[21], MusicPanelDivs[22], MusicPanelDivs[23]);
    //
    //Text
    fill(TextPurple);
    textAlign(CENTER, CENTER);
    textFont(TitleFont, FontSizes[0]);
    text(Text[0], TextDivs[0], TextDivs[1], TextDivs[2], TextDivs[3]);
    textFont(TitleFont, FontSizes[1]);
    text(Text[1], TextDivs[4], TextDivs[5], TextDivs[6], TextDivs[7]);
    textFont(TitleFont, FontSizes[1]);
    text(Text[2], TextDivs[8], TextDivs[9], TextDivs[10], TextDivs[11]);
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
  rect(ButtonDivs[36], ButtonDivs[37], ButtonDivs[38], ButtonDivs[39]);
  textAlign(CENTER, CENTER);
  textFont(TitleFont, FontSizes[3]);
  fill(TextPurple);
  text(Text[3], TextDivs[12], TextDivs[13], TextDivs[14], TextDivs[15]);
  //
  if (!Attributions) {
    //Progress Bar and Progress Timer
    textFont(TitleFont, size);
    Music_Program_CS30_ProgressBar();
    Music_Program_CS30_ProgressTimer();
  }
  //
  //HoverOverColors
  Music_Program_CS30_HoverOver();
  //
}
void Music_Program_CS30_ProgressBar () {
  if (SongPlayList[SongPlaying].isPlaying()) {
    SongTimeCounter = millis();
  }
  ProgressWidth = map(SongPlayList[SongPlaying].position(), 0, AlteredCurrentSongLength, 0, widthMusicProgressBar);
  ProgressWidth = constrain(ProgressWidth, 0, widthMusicProgressBar);
  noStroke();
  fill(TextPurple);
  rect(xMusicProgressBar, yMusicProgressBar, ProgressWidth, heightMusicProgressBar);
  strokeWeight(4);
  stroke(Purple);
  noFill();
  rect(xMusicProgressBar, yMusicProgressBar,  widthMusicProgressBar, heightMusicProgressBar);
  strokeWeight(1);
  stroke(Black);
  fill(resetDefaultInk);
}
void Music_Program_CS30_ProgressTimer () {
  int CurrentSongTime = SongPlayList[SongPlaying].position();
  int TotalSongTime = AlteredCurrentSongLength;
  int CurrentSongPositionMinutes = CurrentSongTime/60000;
  int CurrentSongPositionSeconds = (CurrentSongTime/1000) % 60;
  int TotalSongMinutes = TotalSongTime/60000;
  int TotalSongSeconds = (TotalSongTime/1000) % 60;
  fill(TextPurple);
  textAlign(CENTER, CENTER);
  textSize(appHeight*1/40);
  text(
    nf(CurrentSongPositionMinutes, 2)+":"+nf(CurrentSongPositionSeconds, 2)+" / "+
    nf(TotalSongMinutes, 2)+":"+nf(TotalSongSeconds, 2),
    xMusicProgressBar+widthMusicProgressBar-textWidth("/"+
    nf(TotalSongMinutes, 2)+":"+nf(TotalSongSeconds, 2)),
    yMusicProgressBar+heightMusicProgressBar+appHeight*3/160);
  fill(resetDefaultInk);
}
void AspectRatioMusicImage(PImage img, float x, float y, float Width, float Height) {
  float imgAspectRatio = float(img.width)/float(img.height);
  float rectAspect = Width/Height;
  float drawWidth, drawHeight;
  if (imgAspectRatio>rectAspect) {
    drawHeight = Width/imgAspectRatio-appHeight*1/200;
    drawWidth = drawHeight;
  } else {
    drawHeight = Height-appHeight*1/200;
    drawWidth = Height*imgAspectRatio;
  }
  float drawX =x+(Width-drawWidth)/2;
  float drawY =y+(Height-drawHeight)/2;
  image(img, drawX, drawY, drawWidth, drawHeight);
}
//
void ImageMusicAttributions () {
  //Image Attributions
  fill(TextPurple);
  textAlign(CENTER, CENTER);
  textFont(TitleFont, FontSizes[5]);
  //
  //Attributions
  for (int i = 4; i < NumberOfTextDIVs; i++) {
    int baseIndex = i*4;
    text(Text[i], TextDivs[baseIndex], TextDivs[baseIndex+1], TextDivs[baseIndex+2], TextDivs[baseIndex+3]);
  }
  //
}
void ImageMusicAttributionsMousePressed () {
  //Attribution Links
  if (MouseIsOver(TextDivs[16], TextDivs[17], TextDivs[18], TextDivs[19])) { //Icon Attribution
    link("https://icons8.com/");
  } else if (MouseIsOver(TextDivs[20], TextDivs[21], TextDivs[22], TextDivs[23])) { //Background Attribution
    link("https://www.vecteezy.com/members/earthtin");
  } else if (MouseIsOver(TextDivs[24], TextDivs[25], TextDivs[26], TextDivs[27]) ||
    MouseIsOver(TextDivs[48], TextDivs[49], TextDivs[50], TextDivs[51])) { //Song Attribution 1 (The Guardian of Angels)
    link("https://ncs.io/TGOA?_gl=1*11fgkyd*_up*MQ..*_ga*MTg1NDEyNjkzNS4xNzQ4ODk2MzQ4*_ga_PFS54FR7NV*czE3NDg4OTYzNDgkbzEkZzAkdDE3NDg4OTYzNTkkajQ5JGwwJGgw");
  } else if (MouseIsOver(TextDivs[28], TextDivs[29], TextDivs[30], TextDivs[31]) ||
    MouseIsOver(TextDivs[52], TextDivs[53], TextDivs[54], TextDivs[55])) { //Song Attribution 2 (The Return)
    link("https://ncs.io/TheReturn?_gl=1*11fgkyd*_up*MQ..*_ga*MTg1NDEyNjkzNS4xNzQ4ODk2MzQ4*_ga_PFS54FR7NV*czE3NDg4OTYzNDgkbzEkZzAkdDE3NDg4OTYzNTkkajQ5JGwwJGgw");
  } else if (MouseIsOver(TextDivs[32], TextDivs[33], TextDivs[34], TextDivs[35]) ||
    MouseIsOver(TextDivs[56], TextDivs[57], TextDivs[58], TextDivs[59])) { //Song Attribution 3 (H.A.Y)
    link("https://ncs.io/HAY?_gl=1*qypa9b*_up*MQ..*_ga*MTI1NTA0Njg2Ny4xNzQ4ODk2MzE4*_ga_PFS54FR7NV*czE3NDg4OTYzMTckbzEkZzAkdDE3NDg4OTYzMTckajYwJGwwJGgw");
  } else if (MouseIsOver(TextDivs[36], TextDivs[37], TextDivs[38], TextDivs[39]) ||
    MouseIsOver(TextDivs[60], TextDivs[61], TextDivs[62], TextDivs[63])) { //Song Attribution 4 (Where We Started)
    link("https://ncs.io/WhereWeStarted?_gl=1*14ytkaj*_up*MQ..*_ga*NTgyNDIwNDA3LjE3NDg4OTYzODc.*_ga_PFS54FR7NV*czE3NDg4OTYzODckbzEkZzAkdDE3NDg4OTYzODckajYwJGwwJGgw");
  } else if (MouseIsOver(TextDivs[40], TextDivs[41], TextDivs[42], TextDivs[43]) ||
    MouseIsOver(TextDivs[64], TextDivs[65], TextDivs[66], TextDivs[67])) { //Song Attribution 5 (Oblivion)
    link("https://ncs.io/Oblivion?_gl=1*17yx1my*_up*MQ..*_ga*MTMwNTA5MTEyMi4xNzQ4ODk2Mzk2*_ga_PFS54FR7NV*czE3NDg4OTYzOTYkbzEkZzAkdDE3NDg4OTYzOTYkajYwJGwwJGgw");
  } else if (MouseIsOver(TextDivs[44], TextDivs[45], TextDivs[46], TextDivs[47]) ||
    MouseIsOver(TextDivs[68], TextDivs[69], TextDivs[70], TextDivs[71])) { //Song Attribution 6 (Why We Lose)
    link("https://ncs.io/whywelose?_gl=1*rnka34*_up*MQ..*_ga*MTc5MzgxODQwMC4xNzQ4ODk2MjY4*_ga_PFS54FR7NV*czE3NDg4OTYyNjckbzEkZzAkdDE3NDg4OTYyNjckajYwJGwwJGgw");
  }
}
//
float TitleFontSize;
float[] InitialFontSizes = new float[TextDIVHeight.length];
float[] FontSizes = new float[TextDIVHeight.length];
String[] Text = new String[18];
void MusicPanelTextSetup1() {
  //
  TitleFontSize = ShorterSide;
  TitleFont = createFont("Times New Roman Bold", TitleFontSize);
  //
  stringVarsEntry();
}
void stringVarsEntry() {
  Text[0] = SongPlayListMetaData[SongPlaying].title();
  Text[1] = "Author: "+SongPlayListMetaData[SongPlaying].author();
  Text[2] = "Released in: "+SongPlayListMetaData[SongPlaying].date();
  if (!Attributions) {
  Text[3] = "Attributions";
  } else if (Attributions) {
  Text[3] = "Return";
  }
  Text[4] = "Loop, Shuffle, and Rewind icons by Icons8";
  Text[5] = "Background Image by Tinnapon Wuttichaikitcharoen on Vecteezy";
  Text[6] = "Song: NIVIRO - The Guardian Of Angels [NCS Release] Music provided by NoCopyrightSounds";
  Text[7] = "Song: NIVIRO - The Return [NCS Release] Music provided by NoCopyrightSounds";
  Text[8] = "Song: Clarx - H.A.Y [NCS Release] Music provided by NoCopyrightSounds";
  Text[9] = "Song: Lost Sky - Where We Started (feat. Jex) [NCS Release] Music provided by NoCopyrightSounds";
  Text[10] = "Song: Dirty Palm - Oblivion (feat. Micah Martin) [NCS Release] Music provided by NoCopyrightSounds";
  Text[11] = "Song: Cartoon, Jéja - Why We Lose (feat. Coleman Trapp) [NCS Release] Music provided by";
  Text[12] = "Free Download/Stream: http://ncs.io/TGOA Watch: http://youtu.be/yHU6g3-35IU";
  Text[13] = "Free Download/Stream: http://ncs.io/TheReturn Watch: http://youtu.be/R0QkZOyuqIs";
  Text[14] = "Free Download/Stream: http://ncs.io/HAY Watch: http://youtu.be/mj9KRKSvdbk";
  Text[15] = "Free Download/Stream: http://ncs.io/WhereWeStarted Watch: http://youtu.be/U9pGr6KMdyg";
  Text[16] = "Free Download/Stream: http://ncs.io/Oblivion Watch: http://youtu.be/8Yue9YYdNLM";
  Text[17] = "NoCopyrightSounds Free Download/Stream: http://ncs.io/whywelose Watch: http://youtu.be/zyXmsVwZqX4";
}
void MusicPanelTextSetup2() {
  TitleFontSize = ShorterSide;
  for (int i=0; i<TextDIVHeight.length; i++) {
    if (TitleFontSize > TextDIVHeight[i]) TitleFontSize = TextDIVHeight[i];
  }
  float TimesNewRomanBoldAspectRatio = 1.04;
  TitleFontSize = TitleFontSize * TimesNewRomanBoldAspectRatio;
  //
  for (int i = 0; i<TextDIVHeight.length; i++) {
    float TemporaryFontSize = TextDIVHeight[i];
    textFont(TitleFont, TemporaryFontSize);
    while (textWidth(Text[i]) > TextDIVWidth[i]) {
      TemporaryFontSize *= 0.99;
      if (TemporaryFontSize < 8) {
        TemporaryFontSize = 8;
        break;
      }
      textFont(TitleFont, TemporaryFontSize);    
    }
    if (TemporaryFontSize < 8) TemporaryFontSize = 8;
    FontSizes[i] = TemporaryFontSize;
    textFont(TitleFont, TemporaryFontSize);
  }
}
void Music_Program_CS30_HoverOver () {
  color hoverOverColor=color(255, 255, 255, 64);
if (!Attributions) {
    for (int i = 0; i < 9; i++) {
      int baseIndex = i * 4;
    if (MouseIsOver(ButtonDivs[baseIndex], ButtonDivs[baseIndex+1], ButtonDivs[baseIndex+2], ButtonDivs[baseIndex+3])) {
      fill(hoverOverColor);
      rect(ButtonDivs[baseIndex], ButtonDivs[baseIndex+1], ButtonDivs[baseIndex+2], ButtonDivs[baseIndex+3]);
      fill(resetDefaultInk);
      return;
    }
  }
}
if (MouseIsOver(ButtonDivs[36], ButtonDivs[37], ButtonDivs[38], ButtonDivs[39])) {
    fill(hoverOverColor);
    rect(ButtonDivs[36], ButtonDivs[37], ButtonDivs[38], ButtonDivs[39]);
    fill(resetDefaultInk);
  }
}
//
void keyPressed() {
    if (!Attributions) {
    if (key=='p' || key=='P') {
      KeyPlayPauseFunction();
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
      KeyBasedLocationFunction();
    }
  }
}
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
    ButtonPressed();
    //
  }
  if (Attributions) {
    ImageMusicAttributionsMousePressed();
  }
  if (MouseIsOver(ButtonDivs[36], ButtonDivs[37], ButtonDivs[38], ButtonDivs[39])) {
    ToggleAttributions();
  }
  //
}
void PlayPauseFunction () {
  if (SongPlayList[SongPlaying].isPlaying()) {
    SongPlayList[SongPlaying].pause();
  } else if (SongPlayList[SongPlaying].position() == 0) {
    SongPlayList[SongPlaying].play();
  } else {
    SongPlayList[SongPlaying].play(SongPlayList[SongPlaying].position());
  }
}
void NextSongFunction () {
  if (SongPlayList[SongPlaying].isPlaying()) {
    SongPlayList[SongPlaying].pause();
    SongPlayList[SongPlaying].rewind();
    SongPlaying += 1;
  if (SongPlaying > SongNumber -1) {
    SongPlaying = 0; }
    SongPlayList[SongPlaying].play();
  } else {
    SongPlayList[SongPlaying].pause();
    SongPlayList[SongPlaying].rewind();
    SongPlaying += 1;
  if (SongPlaying > SongNumber -1) {
    SongPlaying = 0; }
  }
}
void PreviousSongFunction () {
  if (SongPlayList[SongPlaying].isPlaying()) {
    SongPlayList[SongPlaying].pause();
    SongPlayList[SongPlaying].rewind();
    SongPlaying -= 1;
  if (SongPlaying < 0) {
    SongPlaying = SongNumber -1; }
    SongPlayList[SongPlaying].play(); 
  } else {
    SongPlayList[SongPlaying].pause();
    SongPlayList[SongPlaying].rewind();
    SongPlaying -= 1;
  if (SongPlaying < 0) {
    SongPlaying = SongNumber -1; } 
  }
}
void ShuffleSongFunction () {
    SongPlayList[SongPlaying].rewind();
    SongPlaying=int (random(0, SongNumber-1));
}
void ToggleAttributions () {
  if (!Attributions) {
    Attributions = true;
  } else if (Attributions) {
    Attributions = false;
  }
}
void KeyPlayPauseFunction () {
  if (SongPlayList[SongPlaying].isPlaying()) {
    SongPlayList[SongPlaying].pause();
  } else {
  if (SongPlayList[SongPlaying].position() == 0) {
    SongPlayList[SongPlaying].play();
  } else {
    SongPlayList[SongPlaying].play(SongPlayList[SongPlaying].position());
    }
  }
}
void KeyMuteFunction () {
  if (SongPlayList[SongPlaying].isPlaying()) {
    SongPlayList[SongPlaying].mute();
  } else {
    SongPlayList[SongPlaying].unmute();
  }  
}
void KeyBasedLocationFunction () {
  KeySongPosition = int(SongPlayList[SongPlaying].length()*(key-'0')*0.1)-5000;
  SongPlayList[SongPlaying].cue(max(KeySongPosition, 0));
}
void SaveLastSongState() {
  PrintWriter SaveSong = createWriter(SongStateTxtPath_LastSongState);
  SaveSong.println(SongPlaying);
  SaveSong.close();
}
void LoadLastSongState() {
  File SongStateFile = new File(SongStateTxtPath_LastSongState);
  if (SongStateFile.exists()) {
    String[] lines = loadStrings(SongStateTxtPath_LastSongState);
    if (lines.length > 0) {
      SongPlaying = constrain(int(lines[0]), 0, SongNumber - 1);
    }
  } else {
    println("Error Last_Song_State.txt not found");
  }
}
void ButtonPressed() {
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
}
//*/
