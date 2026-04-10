//Lines 309-331(Image file pathways),  511-525(Image aspect ratio) and 431(Application of aspect ratio images)
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
//Classes
MusicPlayerDivs musicPlayerDivs;
//
//all global veriables still here can't be moved without breaking the program
//Global Variables
int appWidth, appHeight;
int size;
int ShorterSide;
int SongNumber = 6;
int SoundEffectNumber = 1;
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
  musicPlayerDivs = new MusicPlayerDivs();
  //
} //End setup
void draw() {
  //
  shapeMode(CENTER);
  //
  musicPlayerDivs.draw();
  //
} //End draw
//
void keyPressed() {
  //
  musicPlayerDivs.keyPressed();
  //
} //End keyPressed
//
void keyReleased() {
  //
} //End keyReleased
//
void mousePressed() {
  //
  musicPlayerDivs.mousePressed();
  //
} //End mousePressed
//
//End MAIN Program
