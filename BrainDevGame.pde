import controlP5.*;

NBack nback;
ControlP5 cp5;
boolean shouldShowMenu;
char gameMode; // M 일 때 메뉴 표시, N 일때 NBack
String textValue = "";

void setup() {
  size(800, 800);
  shouldShowMenu = true;
  gameMode = 'M';
  PFont font = createFont("arial",20);
  
  cp5 = new ControlP5(this);
  /*cp5.addTextfield("input")
     .setPosition(20,100)
     .setSize(200,40)
     .setFont(font)
     .setFocus(true)
     .setColor(color(255,0,0))
     ;
                 
  cp5.addTextfield("textValue")
     .setPosition(20,170)
     .setSize(200,40)
     .setFont(createFont("arial",20))
     .setAutoClear(false)
     ;
  
  cp5.addTextfield("default")
     .setPosition(20,350)
     .setAutoClear(false)
     ;
     */
  cp5.addBang("menuNBack")
     .setPosition(width - 160, 50)
     .setSize(160,40)
     .setCaptionLabel("NBack Training!")
     .setFont(createFont("Arial",15))
     .getCaptionLabel().align(ControlP5.CENTER, ControlP5.CENTER);
     ;
  cp5.addTextlabel("MenuLabel")
     .setText("Please Select Game Mode")
     .setPosition(width / 2 - 150, 50)
     .setFont(createFont("Arial",20))
     ;       
  textFont(font);
}

void draw() {
  background(0);
  fill(255);
  switch(gameMode) {
    case 'M':
    cp5.getController("menuNBack").show();
    cp5.getController("MenuLabel").show();
    break;
    
    case 'N':
    if(nback.isGameRunning) nback.run();
    break;
  }
}

public void menuNBack() {
  //cp5.get(Textfield.class,"textValue").clear(); ppt에 있는 정도 + 알파면 점수 더 줌.
  cp5.getController("menuNBack").hide();
  cp5.getController("MenuLabel").hide();
  nback = new NBack();
  gameMode = 'N';
}
public void startNBack() {
  nback.isGameRunning = true;
  nback.timer = millis();
} // mtd startNBack