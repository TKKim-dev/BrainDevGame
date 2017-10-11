class NBack {
  int numberN; // N의 횟수
  int[] randomNumber = new int[2]; // 계산에 사용될 숫자 2개
  int[] calcNumbers1 = new int[20]; // 랜덤하게 생성된 숫자를 저장할 첫번째 배열
  int[] calcNumbers2 = new int[20]; // 랜덤하게 생성된 숫자를 저장할 두번째 배열
  int[] calcTypes = new int [20]; // 계산될 연산 종류 0(+) 1(-) 2(*) 3(/)
  char[] calcChar = {'+', '-', '×', '÷'}; 
  int[] answers = new int[20]; // 정답 리스트를 저장할 배열
  int difficulty; // 난이도
  int wrongAnswers; // 오답 수
  int timer;
  int i;
  public boolean isGameRunning;
  Knob NBacktimer;
  Textfield userInput, question1, question2;
  
  NBack() {
    numberN = 2;
    difficulty = 1;
    wrongAnswers = 0;
    randomize();
    cp5.addBang("startNBack")
       .setPosition(width / 2 - 80, 50)
       .setSize(160,40)
       .setCaptionLabel("Training Start!")
       .setFont(createFont("Arial",15))
       .getCaptionLabel().align(ControlP5.CENTER, ControlP5.CENTER);
       ;
    cp5.addBang("endNBack")
       .setPosition(width / 2 - 80, height - 50)
       .setSize(160,40)
       .setCaptionLabel("End Training")
       .setFont(createFont("Arial",15))
       .getCaptionLabel().align(ControlP5.CENTER, ControlP5.CENTER);
       ;       
    NBacktimer = cp5.addKnob("NBacktimer")
       .setPosition(width / 2 - 200, height / 2 - 20)
       .setRadius(20)
       .setRange(0, 2000)
       .setStartAngle(1.5f * PI)
       .setAngleRange(TWO_PI)
       //.setColorValue(#DB0513)
       .setColorForeground(#DB0513)
       .setColorBackground(#D4E8F8)
       .setCaptionLabel("")
       .setLabelVisible(false)
       .hide()
       .lock();
       ;
    userInput = cp5.addTextfield("userInput")
       .setPosition(20,100)
       .setSize(200,40)
       .setFont(createFont("Arial",15)) 
       .setFocus(true)
       .setColor(color(255,0,0))
       .setAutoClear(false)
       .setInputFilter(ControlP5.INTEGER)
       .hide()
       ;
    question1 = cp5.addTextfield("question1")
       .setPosition(width / 2 - 150, height / 2 - 30)
       .setSize(300, 55)
       .setFont(createFont("Arial", 45))
       .setCaptionLabel("Question")
       .setColorBackground(#D4E8F8)
       .setColor(#0C0050)
       .hide()
       .lock()
       ;
    isGameRunning = false;
  }
  
  void run() { 
    if(i == 0  || millis() - timer > 2000) { // i = 0 조건은 맨 처음 문제의 경우
      setQuestion(question1);
      //cp5 show
      timer = millis();
      i++;
    } else { // 정답 텍스트 박스 표시, 프로그램 대기 중
      NBacktimer.setValue(2000 - millis() + timer);
            NBacktimer.show();
      question1.show();

      if(i > numberN - 1) userInput.show();
    }
  }
  
  void setQuestion(Textfield question) {
    question.setText("    " + calcNumbers1[i] + " " + calcChar[calcTypes[i]] + " " + calcNumbers2[i] + " = ?");
  }
  
  void randomize() {
    // 우선 한 자리수로 계산되는 경우.
    for(int i = 0; i < 20; i++) {
      calcTypes[i] = int(random(0, 4));
      switch(calcTypes[i]) {
        case 0:
        randomNumber[0] = int(random(4, 10));
        randomNumber[1] = int(random(4, 10));
        answers[i] = randomNumber[0] + randomNumber[1];
        break;
        case 1:
        randomNumber[0] = int(random(6, 20));
        randomNumber[1] = int(random(1, 10));    
        while(randomNumber[0] - randomNumber[1] <= 0) {
          randomNumber[0] = int(random(6, 20));
          randomNumber[1] = int(random(1, 10));
        }
        answers[i] = randomNumber[0] - randomNumber[1];
        break;
        case 2:
        randomNumber[0] = int(random(5, 10));
        randomNumber[1] = int(random(3, 10));
        answers[i] = randomNumber[0] * randomNumber[1];
        break;
        case 3:
        randomNumber[0] = int(random(10, 100));
        randomNumber[1] = int(random(4, 18));
        while(randomNumber[0] % randomNumber[1] != 0) {
          randomNumber[0] = int(random(10, 100));
          randomNumber[1] = int(random(4, 18));
        }
        answers[i] = randomNumber[0] / randomNumber[1];
        break;
      } //switch
      calcNumbers1[i] = randomNumber[0];
      calcNumbers2[i] = randomNumber[1];
    }
  } //randomize //<>//
} //class NBack