//class MusicPlayerDivs {
int NumberOfMusicPanelDIVs = 7; //All Music Panel components
float[][] MusicPanelDivRatios = new float[NumberOfMusicPanelDIVs][4]; //Store ratios (Rectangles)
float[] MusicPanelDivs = new float [NumberOfMusicPanelDIVs*4]; //Music Panel Position and Size of components
int NumberOfButtonDIVs = 10; //All Music Player Buttons
float[][] ButtonDivRatios = new float[NumberOfButtonDIVs][4]; //Store ratios (Rectangles)
float[] ButtonDivs = new float [NumberOfButtonDIVs*4]; //Button Positions and Size
int NumberOfButtonIconDIVs = 9; //All Music Player Button Icons
float[][] ButtonIconDivRatios = new float[NumberOfButtonIconDIVs][6]; //Store ratios (Triangles)
float[] ButtonIconDivs = new float [NumberOfButtonIconDIVs*6]; //Icon Positions and Size
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
  //
void MusicProgramDivs() {
  //void setup() {
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
  ButtonIconDivRatios[3] = new float[]{9.0/26+2.0/104+2.0/156, 24.0/40+1.3/104, 9.0/26+2.0/104+2.0/156, 24.0/40+4.7/104, 9.0/26+2.0/104, 25.0/40+1.0/208}; //Rewind Button Triangle Two
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
  TextDivRatios[12] = new float[]{2.0/27+23/432, 23.0/100+22.0/243+4.0/135, 23.0/27, 1.0/42}; //Song Attribution 1 line 2
  TextDivRatios[13] = new float[]{2.0/27+23/432, 23.0/100+44.0/243+4.0/135, 23.0/27, 1.0/42}; //Song Attribution 2 line 2
  TextDivRatios[14] = new float[]{2.0/27+23/432, 23.0/100+65.0/243+4.0/135, 23.0/27, 1.0/42}; //Song Attribution 3 line 2
  TextDivRatios[15] = new float[]{2.0/27+23/432, 23.0/100+86.0/243+4.0/135, 23.0/27, 1.0/42}; //Song Attribution 4 line 2
  TextDivRatios[16] = new float[]{2.0/27+23/432, 23.0/100+108.0/243+4.0/135, 23.0/27, 1.0/42}; //Song Attribution 5 line 2
  TextDivRatios[17] = new float[]{2.0/27+23/432, 23.0/100+130.0/243+4.0/135, 23.0/27, 1.0/42}; //Song Attribution 6 line 2
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
/*
void setup() {
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
  //
  println(SongPlaying);
  */
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
}
//*/
