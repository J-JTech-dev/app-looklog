LOOKLOG

---

# app_looklog
flutter 3.27.3 dart 3.6.1

### fvm
프로젝트 별로 flutter sdk 버전을 관리하는 툴

### fvm 설정 방법
설정 참고 사이트: <https://shxrecord.tistory.com/292>


관리자모드로 실행하는 것이 좋다.

### 빌드 명령어
$ fvm flutter build apk --release
$ fvm flutter build apk --debug

### 디렉토리 구조
📦lib
 ┣ 📂apps
 ┃ ┗ 📂di
 ┣ 📂common
 ┃ ┣ 📂component
 ┃ ┣ 📂constant
 ┃ ┣ 📂provider
 ┃ ┃ ┗ 📜dio_provider.dart
 ┃ ┗ 📂theme
 ┣ 📂core
 ┃ ┣ 📂config
 ┃ ┃ ┗ 📜dio_config.dart
 ┃ ┗ 📂utils
 ┣ 📂features
 ┃ ┣ 📂colormatching
 ┃ ┃ ┣ 📂data
 ┃ ┃ ┣ 📂domain
 ┃ ┃ ┣ 📂view
 ┃ ┃ ┗ 📜color_matching_app.dart
 ┃ ┣ 📂mainhome
 ┃ ┃ ┣ 📂data
 ┃ ┃ ┣ 📂domain
 ┃ ┃ ┣ 📂view
 ┃ ┃ ┗ 📜main_home_app.dart
 ┃ ┣ 📂sizenote
 ┃ ┃ ┣ 📂data
 ┃ ┃ ┣ 📂domain
 ┃ ┃ ┣ 📂view
 ┃ ┃ ┗ 📜size_note_app.dart
 ┃ ┗ 📂todaylook
 ┃ ┃ ┣ 📂data
 ┃ ┃ ┣ 📂domain
 ┃ ┃ ┣ 📂view
 ┃ ┃ ┗ 📜today_look_app.dart
 ┗ 📜main.dart