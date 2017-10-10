class NBack {
  int numberN; // N의 횟수
  int[] randomNumber = new int[2]; // 계산에 사용될 숫자 2개
  int[] calcNumbers1 = new int[20]; // 랜덤하게 생성된 숫자를 저장할 첫번째 배열
  int[] calcNumbers2 = new int[20]; // 랜덤하게 생성된 숫자를 저장할 두번째 배열
  int[] calcTypes = new int [20];
  int[] answers = new int[20]; // 정답 리스트를 저장할 배열
  int calcType; // 계산될 연산 종류 1(+) 2(-) 3(*) 4(/)
  int difficulty; // 난이도
  int wrongAnswers; // 오답 수
  int timer;
  boolean isGameRunning;
  
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
    cp5.addKnob("NBacktimer")
       .setRadius(50)
       .setRange(0, 2000)
       .setStartAngle(0.5f * PI)
       .setAngleRange(TWO_PI)
       .lock();
       ;
    isGameRunning = false;
  }
  
  void run() { 
    //if(millis() - timer > 2000) {
      cp5.getController("NBacktimer").setValue(millis() - timer);
    //}
    //timer = millis();
  }
  void randomize() {
    // 우선 한 자리수로 계산되는 경우.
    for(int i = 0; i < 20; i++) {
      calcType = int(random(1, 5));
      switch(calcType) {
        case 1:
        randomNumber[0] = int(random(4, 10));
        randomNumber[1] = int(random(4, 10));
        answers[i] = randomNumber[0] + randomNumber[1];
        break;
        case 2:
        randomNumber[0] = int(random(6, 20));
        randomNumber[1] = int(random(1, 10));    
        while(randomNumber[0] - randomNumber[1] <= 0) {
          randomNumber[0] = int(random(6, 20));
          randomNumber[1] = int(random(1, 10));
        }
        answers[i] = randomNumber[0] - randomNumber[1];
        break;
        case 3:
        randomNumber[0] = int(random(5, 10));
        randomNumber[1] = int(random(3, 10));
        answers[i] = randomNumber[0] * randomNumber[1];
        break;
        case 4:
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
      calcTypes[i] = calcType;
    }
  } //randomize
   //<>//
} //class NBack