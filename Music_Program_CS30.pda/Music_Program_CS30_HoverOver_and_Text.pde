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
