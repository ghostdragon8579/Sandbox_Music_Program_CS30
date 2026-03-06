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
