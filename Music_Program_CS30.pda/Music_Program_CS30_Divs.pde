int NumberOfMusicPanelDIVs = 6; //All Music Panel components
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
converted into a function of either appWidth for the x and width ratios or appHeight for the y and height ratios. Finally every group is generated as a rectangle in the Music Panel.
*/
//
void MusicProgramDivs() {
  //
  //Music Panel Divs
  //{X value in ratio of appwidth, Y value in ratio of appwidth, width value in ratio of appwidth, height value in ratio of appheight}
  MusicPanelDivRatios[0] = new float[]{2.0/27, 1.0/10, 23.0/27, 4.0/5}; //Music Panel Component
  MusicPanelDivRatios[1] = new float[]{2.0/7, 3.0/20, 3.0/7, 1.0/11}; //Song Title Component
  MusicPanelDivRatios[2] = new float[]{1.0/3, 3.0/20+1.0/11, 1.0/3, 1.0/18}; //Song Author Component
  MusicPanelDivRatios[3] = new float[]{1.0/3, 3.0/20+1.0/11+1.0/18, 1.0/3, 1.0/18}; //Date of Publish/Release
  MusicPanelDivRatios[4] = new float[]{1.0/3, 3.0/20+1.0/11+1.0/9, 1.0/3, 1.0/6}; //Song Image Component
  MusicPanelDivRatios[5] = new float[]{5.0/26, 13.0/16, 8.0/13, 1.0/48}; //Song Progress Bar
  CalculateMusicPanelDIVs();
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
  CalculateButtonDIVs();
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
  CalculateButtonIconDIVs();
  //
  //Text Divs
  //{The first, third and fifth ratios are X values in ratio of appwidth. The second, fourth and sixth ratios are y values in ratio of appheight}
  TextDivRatios[0] = new float[]{2.0/7, 3.0/20, 3.0/7, 1.0/11}; //Song Title
  TextDivRatios[1] = new float[]{1.0/3, 3.0/20+1.0/11, 1.0/3, 1.0/18}; //Song Author
  TextDivRatios[2] = new float[]{1.0/3, 3.0/20+1.0/11+1.0/18, 1.0/3, 1.0/18}; //Song Publish Date
  TextDivRatios[3] = new float[]{0.0, 23.0/24, 1.0/12, 1.0/24}; //Attribution Button Text
  TextDivRatios[4] = new float[]{2.0/27+23/432, 1.0/10+1.0/20, 7.0/8, 1.0/42}; //Icon Attribution
  TextDivRatios[5] = new float[]{2.0/27+23/432, 23.0/100+23.0/243, 7.0/8, 1.0/42}; //Background Attribution
  TextDivRatios[6] = new float[]{2.0/27+23/432, 23.0/100+46.0/243, 7.0/8, 1.0/42}; //Song Attribution 1
  TextDivRatios[7] = new float[]{2.0/27+23/432, 23.0/100+69.0/243, 7.0/8, 1.0/42}; //Song Attribution 2
  TextDivRatios[8] = new float[]{2.0/27+23/432, 23.0/100+92.0/243, 7.0/8, 1.0/42}; //Song Attribution 3
  TextDivRatios[9] = new float[]{2.0/27+23/432, 23.0/100+105.0/243, 7.0/8, 1.0/42}; //Song Attribution 4
  TextDivRatios[10] = new float[]{2.0/27+23/432, 23.0/100+128.0/243, 7.0/8, 1.0/42}; //Song Attribution 5
  TextDivRatios[11] = new float[]{2.0/27+23/432, 23.0/100+151.0/243, 7.0/8, 1.0/42}; //Song Attribution 6
  TextDivRatios[12] = new float[]{2.0/27+23/432, 23.0/100+46.0/243+4.0/135, 7.0/8, 1.0/42}; //Song Attribution 1 line 2
  TextDivRatios[13] = new float[]{2.0/27+23/432, 23.0/100+69.0/243+4.0/135, 7.0/8, 1.0/42}; //Song Attribution 2 line 2
  TextDivRatios[14] = new float[]{2.0/27+23/432, 23.0/100+92.0/243+4.0/135, 7.0/8, 1.0/42}; //Song Attribution 3 line 2
  TextDivRatios[15] = new float[]{2.0/27+23/432, 23.0/100+105.0/243+4.0/135, 7.0/8, 1.0/42}; //Song Attribution 4 line 2
  TextDivRatios[16] = new float[]{2.0/27+23/432, 23.0/100+128.0/243+4.0/135, 7.0/8, 1.0/42}; //Song Attribution 5 line 2
  TextDivRatios[17] = new float[]{2.0/27+23/432, 23.0/100+151.0/243+4.0/135, 7.0/8, 1.0/42}; //Song Attribution 6 line 2
  CalculateTextDIVs();
  //
}
void CalculateMusicPanelDIVs() {
  for (int i = 0; i < NumberOfMusicPanelDIVs; i++) {
    int baseIndex = i * 4;
    MusicPanelDivs[baseIndex] = appWidth*MusicPanelDivRatios[i][0]; //X position
    MusicPanelDivs[baseIndex+1] = appHeight*MusicPanelDivRatios[i][1]; //Y position
    MusicPanelDivs[baseIndex+2] = appWidth*MusicPanelDivRatios[i][2]; //Width
    MusicPanelDivs[baseIndex+3] = appHeight*MusicPanelDivRatios[i][3]; //Height
  }
}
void CalculateButtonDIVs() {
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
}
void CalculateButtonIconDIVs() {
  for (int i = 0; i < NumberOfButtonIconDIVs; i++) {
    int baseIndex = i * 6;
    ButtonIconDivs[baseIndex] = appWidth*ButtonIconDivRatios[i][0]; // X1 position
    ButtonIconDivs[baseIndex+1] = appHeight*ButtonIconDivRatios[i][1]; // Y1 position
    ButtonIconDivs[baseIndex+2] = appWidth*ButtonIconDivRatios[i][2]; // X2 position
    ButtonIconDivs[baseIndex+3] = appHeight*ButtonIconDivRatios[i][3]; // Y2 position
    ButtonIconDivs[baseIndex+4] = appWidth*ButtonIconDivRatios[i][4]; // X3 position
    ButtonIconDivs[baseIndex+5] = appHeight*ButtonIconDivRatios[i][5]; // Y3 position
  }
}
void CalculateTextDIVs() {
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
