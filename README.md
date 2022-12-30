### 땡기는 민족
<p align="center">
  <br>
  <img src="https://user-images.githubusercontent.com/108394995/209459760-55d55c80-0e1a-4daa-bce3-408d8a356335.png">
  <br>
</p>


# 프로젝트 개요

<br>
<img src ="https://user-images.githubusercontent.com/108394995/209460006-6e3b12fe-1fc0-4d29-b321-af51c08e267c.png">
<br>

# 개발 환경 및 사용 언어

Tool ![Android Studio](https://img.shields.io/badge/Android%20Studio-3DDC84.svg?style=for-the-badge&logo=android-studio&logoColor=white) ![Visual Studio Code](https://img.shields.io/badge/Visual%20Studio%20Code-0078d7.svg?style=for-the-badge&logo=visual-studio-code&logoColor=white)

FrontEnd ![Dart](https://img.shields.io/badge/dart-%230175C2.svg?style=for-the-badge&logo=dart&logoColor=white) 
![Flutter](https://img.shields.io/badge/Flutter-%2302569B.svg?style=for-the-badge&logo=Flutter&logoColor=white)

BackEnd ![Java](https://img.shields.io/badge/java-%23ED8B00.svg?style=for-the-badge&logo=java&logoColor=white) 
![Spring](https://img.shields.io/badge/spring-%236DB33F.svg?style=for-the-badge&logo=spring&logoColor=white) 
![Apache Tomcat](https://img.shields.io/badge/apache%20tomcat-%23F8DC75.svg?style=for-the-badge&logo=apache-tomcat&logoColor=black) ![Gradle](https://img.shields.io/badge/Gradle-02303A.svg?style=for-the-badge&logo=Gradle&logoColor=white) ![Postman](https://img.shields.io/badge/Postman-FF6C37?style=for-the-badge&logo=postman&logoColor=white) ![JWT](https://img.shields.io/badge/JWT-black?style=for-the-badge&logo=JSON%20web%20tokens)

Database ![MariaDB](https://img.shields.io/badge/MariaDB-003545?style=for-the-badge&logo=mariadb&logoColor=white) 

Team ![Git](https://img.shields.io/badge/git-%23F05033.svg?style=for-the-badge&logo=git&logoColor=white) ![GitHub](https://img.shields.io/badge/github-%23121011.svg?style=for-the-badge&logo=github&logoColor=white) ![Figma](https://img.shields.io/badge/figma-%23F24E1E.svg?style=for-the-badge&logo=figma&logoColor=white) ![Notion](https://img.shields.io/badge/Notion-%23000000.svg?style=for-the-badge&logo=notion&logoColor=white) ![Discord](https://img.shields.io/badge/Discord-%235865F2.svg?style=for-the-badge&logo=discord&logoColor=white)

# 시연 영상

https://www.youtube.com/watch?v=5i710ncxHWU


# 아키텍쳐
프론트 엔드 - MVVM
![image](https://user-images.githubusercontent.com/108394995/210052726-2b6e1b8b-3f04-493a-840d-9989d92d1964.png)

* view : 클라이언트에게 직접적으로 보여지는 레이어
* model : 데이터를 들고 있는 레이어
* viewModel : 데이터에 이벤트가 발생하면 model에 변화된 값을 적용시킴. view는 viewModel을 watch하고 있다.

###### 장점

* view와 model이 독립적이므로 비즈니스 로직을 분리할 수 있다.
* 모듈화하여 개발 가능
* 여러개의 view가 하나의 viewModel을 의존할 수 있다.


