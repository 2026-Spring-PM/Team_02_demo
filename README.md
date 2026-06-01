# Team_02_demo

## Run
본 데모 버전은 sfml 라이브러리를 사용하여 gui game을 구현하여 sfml이 설치되어야 실행 가능합니다. 

### Ubuntu / Debian
```bash
sudo apt update
sudo apt install -y libsfml-dev
```
### macOS
```bash
brew install sfml
```

### Docker Container 내부
```bash
apt update
apt install -y libsfml-dev
```
git repository에 대한 clone을 생성한 후 프로젝트 폴더로 이동합니다.
```bash
git clone https://github.com/2026-Spring-PM/Team_02_demo.git
cd Team_02_demo
```
아래 명령어는 실행 스크립트에 실행 권한을 부여한 뒤, Docker 컨테이너를 빌드하고 실행합니다.
```bash
chmod +x scripts/run_shell.sh
./scripts/run_shell.sh
```

실행 후 브라우저에서 아래 사이트에 접속합니다. 사이트에서 noVNC 화면이 나타나면 Connect를 눌러 농장 게임을 실행할 수 있습니다.  
http://localhost:6080/vnc.html  

# GUI Controls
- WASD: 사용자 상하좌우 한 칸씩 이동 가능
- Hotbar: Inventory에 저장된 물품 클릭 후 물품 사용
- Click farm tile: Hotbar 선택 후 농장 타일에 적용
- Enter: confirm
- I: inventory
- Q: 게임 종료

# Player
- Level: Level에 따른 사용 가능 Crop, Animal, Building 종류가 달라짐
- Experience(exp): exp를 모아 Level 상승 가능
- Energy: Player가 일을 할 수 있는 능력, 매일 100으로 복구.

# Crops
## 종류
- Wheat
- Corn
- Tomato
## 심기
Shop에서 Seed 구매
Hotbar에서 Seed 선택(초록색 정사각형 아이콘)
농장 타일 클릭(Energy 소모)

## 키우기
하루가 지날 때마다 작물 성장, 날씨, Water 상태에 따라 성장 속도 상이
- Sunny: 성장 +2, Water -2
- Cloudy: 성장 +1, Water -1
- Rainy: Water 제공
작물이 모두 성장하기 전 Water가 0이 되면 작물이 사망, Watering Can 선택하여 물 주기 가능(물 준 타일은 어두운 색으로 변함)

## 수확하기
작물 성장 -> Hotbar의 Hoe 선택 후 타일 클릭 -> Crop Product 및 exp 획득

# Animals
## 종류(생산물)
Cow(Milk), Sheep(Wool), Hen(Egg)
## 구매
- 우리: House 클릭 후 build 탭에서 동물 우리 구매 가능
- Buy: 농장에 생긴 울타리 클릭 시 Buy 탭에서 동물 구매
- Arrange: Arrange 탭에서 동물 클릭 후 barn tile 클릭하여 배치
## 관리
- Hungry: 매일 5 감소, 0이 되면 동물 사망, Feed로 Hungry +30
- Age: Young -> Adult로 성장, Adult가 된 이후부터 생산물 수확 가능
- View Livestocks: 생산물 준비되면 동물 클릭 시 생산물 수확 가능

# Building
## 종류
Bakery, Restaurant
## 건설
House 탭에서 Build - Buildings에서 종류 선택 후 농장 타일의 건설 위치 선택
## 생산
건축물 클릭 시 Bread 등 Product 생산 가능

# Market
## Buy
Crop Seeds, Items, Foods 구매 가능
## Sell
생산한 Product, Item 판매 가능
## Order
현재 level에서 접근 가능한 Crop, Animal Product, Construction Product이 랜덤으로 조합된 주문서

# weathers
- cloudy: crops이 자라지 않음
- rainy: water life 회복
- sunny: 작물 성장 +2

# random events
- 14일 이후 30일마다 랜덤으로 발생
- 전염병: 랜덤 가축 종류 전체 사망
- 홍수/태풍/가뭄: 랜덤 수의 작물 사망
