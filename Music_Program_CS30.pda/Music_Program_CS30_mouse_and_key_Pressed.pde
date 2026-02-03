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
