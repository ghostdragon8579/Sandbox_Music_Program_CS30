void Music_Program_CS20_ProgressBar () {
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
void Music_Program_CS20_ProgressTimer () {
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
    nf(TotalSongMinutes, 2)+":"+nf(TotalSongSeconds, 2)
    ),
    yMusicProgressBar+heightMusicProgressBar+appHeight*3/160
  );
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
