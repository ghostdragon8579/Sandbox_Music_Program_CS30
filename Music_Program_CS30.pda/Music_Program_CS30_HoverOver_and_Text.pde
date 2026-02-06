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
void Music_Program_CS20_HoverOver () {
  color hoverOverColor=color(255, 255, 255, 64);
  if (!Attributions) {
  if (MouseIsOver(ButtonDivs[0], ButtonDivs[1], ButtonDivs[2], ButtonDivs[3])) {
    fill(hoverOverColor);
    rect(ButtonDivs[0], ButtonDivs[1], ButtonDivs[2], ButtonDivs[3]);
    fill(resetDefaultInk);
  } else if (MouseIsOver(ButtonDivs[4], ButtonDivs[5], ButtonDivs[6], ButtonDivs[7])) {
    fill(hoverOverColor);
    rect(ButtonDivs[4], ButtonDivs[5], ButtonDivs[6], ButtonDivs[7]);
    fill(resetDefaultInk);
   } else if (MouseIsOver(ButtonDivs[8], ButtonDivs[9], ButtonDivs[10], ButtonDivs[11])) {
    fill(hoverOverColor);
    rect(ButtonDivs[8], ButtonDivs[9], ButtonDivs[10], ButtonDivs[11]);
    fill(resetDefaultInk);
  } else if (MouseIsOver(ButtonDivs[12], ButtonDivs[13], ButtonDivs[14], ButtonDivs[15])) {
    fill(hoverOverColor);
    rect(ButtonDivs[12], ButtonDivs[13], ButtonDivs[14], ButtonDivs[15]);
    fill(resetDefaultInk);
  } else if (MouseIsOver(ButtonDivs[16], ButtonDivs[17], ButtonDivs[18], ButtonDivs[19])) {
    fill(hoverOverColor);
    rect(ButtonDivs[16], ButtonDivs[17], ButtonDivs[18], ButtonDivs[19]);
    fill(resetDefaultInk);
  } else if (MouseIsOver(ButtonDivs[20], ButtonDivs[21], ButtonDivs[22], ButtonDivs[23])) {
    fill(hoverOverColor);
    rect(ButtonDivs[20], ButtonDivs[21], ButtonDivs[22], ButtonDivs[23]);
    fill(resetDefaultInk);
  } else if (MouseIsOver(ButtonDivs[24], ButtonDivs[25], ButtonDivs[26], ButtonDivs[27])) {
    fill(hoverOverColor);
    rect(ButtonDivs[24], ButtonDivs[25], ButtonDivs[26], ButtonDivs[27]);
    fill(resetDefaultInk);
  } else if (MouseIsOver(ButtonDivs[28], ButtonDivs[29], ButtonDivs[30], ButtonDivs[31])) {
    fill(hoverOverColor);
    rect(ButtonDivs[28], ButtonDivs[29], ButtonDivs[30], ButtonDivs[31]);
    fill(resetDefaultInk);
  } else if (MouseIsOver(ButtonDivs[32], ButtonDivs[33], ButtonDivs[34], ButtonDivs[35])) {
    fill(hoverOverColor);
    rect(ButtonDivs[32], ButtonDivs[33], ButtonDivs[34], ButtonDivs[35]);
    fill(resetDefaultInk);
  }
  }
  if (MouseIsOver(xAttributions, yAttributions, TextDIVWidth[3], TextDIVHeight[3])) {
    fill(hoverOverColor);
    rect(xAttributions, yAttributions, TextDIVWidth[3], TextDIVHeight[3]);
    fill(resetDefaultInk);
  }
}
