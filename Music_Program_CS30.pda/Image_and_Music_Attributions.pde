void ImageMusicAttributions () {
  //Image Attributions
  fill(TextPurple);
  textAlign(CENTER, CENTER);
  textFont(TitleFont, FontSizes[5]);
  text(Text[4], xIconAttribution, yIconAttribution, TextDIVWidth[4], TextDIVHeight[4]);
  text(Text[5], xBackgroundAttribution, yBackgroundAttribution, TextDIVWidth[5], TextDIVHeight[5]);
  //Song Attributions
  text(Text[6], xSongAttribution1, ySongAttribution1, TextDIVWidth[6], TextDIVHeight[6]);
  text(Text[7], xSongAttribution2, ySongAttribution2, TextDIVWidth[7], TextDIVHeight[7]);
  text(Text[8], xSongAttribution3, ySongAttribution3, TextDIVWidth[8], TextDIVHeight[8]);
  text(Text[9], xSongAttribution4, ySongAttribution4, TextDIVWidth[9], TextDIVHeight[9]);
  text(Text[10], xSongAttribution5, ySongAttribution5, TextDIVWidth[10], TextDIVHeight[10]);
  text(Text[11], xSongAttribution6, ySongAttribution6, TextDIVWidth[11], TextDIVHeight[11]);
  text(Text[12], xSongAttribution1Line2, ySongAttribution1Line2, TextDIVWidth[12], TextDIVHeight[12]);
  text(Text[13], xSongAttribution2Line2, ySongAttribution2Line2, TextDIVWidth[13], TextDIVHeight[13]);
  text(Text[14], xSongAttribution3Line2, ySongAttribution3Line2, TextDIVWidth[14], TextDIVHeight[14]);
  text(Text[15], xSongAttribution4Line2, ySongAttribution4Line2, TextDIVWidth[15], TextDIVHeight[15]);
  text(Text[16], xSongAttribution5Line2, ySongAttribution5Line2, TextDIVWidth[16], TextDIVHeight[16]);
  text(Text[17], xSongAttribution6Line2, ySongAttribution6Line2, TextDIVWidth[17], TextDIVHeight[17]);
  fill(resetDefaultInk);
  //
}
void ImageMusicAttributionsMousePressed () {
  //Attribution Links
  if (MouseIsOver(xIconAttribution, yIconAttribution, TextDIVWidth[4], TextDIVHeight[4])) {
    link("https://icons8.com/");
  } else if (MouseIsOver(xBackgroundAttribution, yBackgroundAttribution, TextDIVWidth[5], TextDIVHeight[5]) ||
    MouseIsOver(xSongAttribution1Line2, ySongAttribution1Line2, TextDIVWidth[12], TextDIVHeight[12])) {
    link("https://www.vecteezy.com/members/earthtin");
  } else if (MouseIsOver(xSongAttribution1, ySongAttribution1, TextDIVWidth[6], TextDIVHeight[6]) ||
    MouseIsOver(xSongAttribution1Line2, ySongAttribution1Line2, TextDIVWidth[12], TextDIVHeight[12])) {
    link("https://ncs.io/TGOA?_gl=1*11fgkyd*_up*MQ..*_ga*MTg1NDEyNjkzNS4xNzQ4ODk2MzQ4*_ga_PFS54FR7NV*czE3NDg4OTYzNDgkbzEkZzAkdDE3NDg4OTYzNTkkajQ5JGwwJGgw");
  } else if (MouseIsOver(xSongAttribution2, ySongAttribution2, TextDIVWidth[7], TextDIVHeight[7]) ||
    MouseIsOver(xSongAttribution2Line2, ySongAttribution2Line2, TextDIVWidth[13], TextDIVHeight[13])) {
    link("https://ncs.io/TheReturn?_gl=1*11fgkyd*_up*MQ..*_ga*MTg1NDEyNjkzNS4xNzQ4ODk2MzQ4*_ga_PFS54FR7NV*czE3NDg4OTYzNDgkbzEkZzAkdDE3NDg4OTYzNTkkajQ5JGwwJGgw");
  } else if (MouseIsOver(xSongAttribution3, ySongAttribution3, TextDIVWidth[8], TextDIVHeight[8]) ||
    MouseIsOver(xSongAttribution3Line2, ySongAttribution3Line2, TextDIVWidth[14], TextDIVHeight[14])) {
    link("https://ncs.io/HAY?_gl=1*qypa9b*_up*MQ..*_ga*MTI1NTA0Njg2Ny4xNzQ4ODk2MzE4*_ga_PFS54FR7NV*czE3NDg4OTYzMTckbzEkZzAkdDE3NDg4OTYzMTckajYwJGwwJGgw");
  } else if (MouseIsOver(xSongAttribution4, ySongAttribution4, TextDIVWidth[9], TextDIVHeight[9]) ||
    MouseIsOver(xSongAttribution4Line2, ySongAttribution4Line2, TextDIVWidth[15], TextDIVHeight[15])) {
    link("https://ncs.io/WhereWeStarted?_gl=1*14ytkaj*_up*MQ..*_ga*NTgyNDIwNDA3LjE3NDg4OTYzODc.*_ga_PFS54FR7NV*czE3NDg4OTYzODckbzEkZzAkdDE3NDg4OTYzODckajYwJGwwJGgw");
  } else if (MouseIsOver(xSongAttribution5, ySongAttribution5, TextDIVWidth[10], TextDIVHeight[10]) ||
    MouseIsOver(xSongAttribution5Line2, ySongAttribution5Line2, TextDIVWidth[16], TextDIVHeight[16])) {
    link("https://ncs.io/Oblivion?_gl=1*17yx1my*_up*MQ..*_ga*MTMwNTA5MTEyMi4xNzQ4ODk2Mzk2*_ga_PFS54FR7NV*czE3NDg4OTYzOTYkbzEkZzAkdDE3NDg4OTYzOTYkajYwJGwwJGgw");
  } else if (MouseIsOver(xSongAttribution6, ySongAttribution6, TextDIVWidth[11], TextDIVHeight[11]) ||
    MouseIsOver(xSongAttribution6Line2, ySongAttribution6Line2, TextDIVWidth[17], TextDIVHeight[17])) {
    link("https://ncs.io/whywelose?_gl=1*rnka34*_up*MQ..*_ga*MTc5MzgxODQwMC4xNzQ4ODk2MjY4*_ga_PFS54FR7NV*czE3NDg4OTYyNjckbzEkZzAkdDE3NDg4OTYyNjckajYwJGwwJGgw");
  }
}
