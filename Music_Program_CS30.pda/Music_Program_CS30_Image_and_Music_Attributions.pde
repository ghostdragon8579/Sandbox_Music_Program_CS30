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
