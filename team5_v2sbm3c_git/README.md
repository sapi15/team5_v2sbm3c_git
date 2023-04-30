# team5_v2sbm3c_git
### 1) Project Subject

Oracle 기반 모델링을 토대로 Spring Boot 기반 동작하는 도서 판매 및 구입 Website를 제작한다.
### 2) Main Function

● 테이블은 총 13개로 '도서 그룹', '도서', '컨텐츠', '회원', '장바구니', '보관함','주문상세','주문_결제','질문 답변 관리','이벤트','공지사항','자주묻는질문','faq질문그룹'이 존재한다.

● '도서 그룹' 테이블은 대분류로 역사/소설/과학/외국어 등에 대한 그룹 생성 기능을 제공한다.

● '도서' 테이블은 중분류로 대분류에 해당하는 개별 도서에 대한 생성 기능을 제공한다. '도서 그룹'의 하위테이블로 참조관계를 갖고있다.

● '컨텐츠' 테이블은 소분류로 등록된 개별 도서에 도서 정보,저자,가격,포인트 등을 등록하는 기능을한다. '도서'의 하위테이블로 참조관계를 갖고있다.

● '회원' 테이블은 회원가입 및 로그인 기능을 제공하며 이름, 아이디, 패스워드, 이메일, 주소 등의 데이터를 입력할 수있다.

● '회원' 테이블의 비밀번호 암호화를 위해 AES128 알고리즘을 사용하였다.

● 테이블 간의 참조관계 및 제약조건 설정을 통해 무결성을 유지시켰다.

● index 화면과 각각의 View는 CDN 방식의 BootStrap과 css를 활용해 UI의 접근성을 상승시켰다.

● '도서 그룹'과 '도서' 등록 및 수정 삭제 시 Spring Controller와 Ajax 통신, jQuery를 사용해 메모리 사용을 절감하였다.

● '컨텐츠'와 '회원' 레코드 등록 시 id 및 이메일 등에 대한 유효성 검사를 위해 Ajax 통신과 jQuery가 사용됐다.




### 3) Technology

O/S : Windows 10

Language : JAVA (JDK1.8.0_281)

DBMS : Oracle 11g

Web Application Server : boot DEVTOOLS

Framework : Spring Boot 2.4.3, Mybatis 3.4.1, BootStrap 3.4.1, jQuery

Technology : JDBC, HTML5, CSS, EL, Javascript, JSON, JSP, Ajax

Tools : STS 4.6.0, Amateras UML, Amateras ERD, SQLdeveloper

### 4) ERD
![team5](https://user-images.githubusercontent.com/42789806/127168572-a341fd32-bfcf-4391-81fe-a35be5becb84.png)
### 5) Action

● main(index)



![main](https://user-images.githubusercontent.com/42789806/127178849-4da53df5-7556-424d-821d-139752204156.png)

● 로그인 페이지
![login](https://user-images.githubusercontent.com/42789806/127169971-bce76549-4e54-4525-bbb9-6e7f859d9517.png)

● 자주 물어보는 질문 페이지
![fag](https://user-images.githubusercontent.com/42789806/127170935-8f016ee2-ad36-482c-b642-bdffa90819a8.png)

● 회원 가입
![gayip](https://user-images.githubusercontent.com/42789806/127171497-c640262c-a850-41e3-9bf7-e64c22874d1b.png)

● 회원 목록
![member](https://user-images.githubusercontent.com/42789806/127171244-6c1c279b-bc2a-4e3b-a30d-8d1b276915cf.png)

● 도서 등록
![create](https://user-images.githubusercontent.com/42789806/127276411-30840af2-3081-4bf4-8cd9-f780275931e2.png)

● 도서 정보
![read](https://user-images.githubusercontent.com/42789806/127276470-df9febc9-4175-4952-9b76-3ba49d0b9595.png)

● 도서 목록
![list](https://user-images.githubusercontent.com/42789806/127276523-9bab088f-ec57-4212-adb4-0a73fc9cf7bf.png)

● 장바구니
![jumun](https://user-images.githubusercontent.com/42789806/127180188-493f5012-958c-402a-8435-7035e723e6e8.png)

● 주문하기
![jumun2](https://user-images.githubusercontent.com/42789806/127180414-79138784-9351-40e4-92a4-bfc753c10ffa.png)

● 주문내역
![gz](https://user-images.githubusercontent.com/42789806/127180602-7765c056-f73f-4613-9051-d83e3e250b22.png)

● 주문상세
![order_item](https://user-images.githubusercontent.com/62326572/127650419-4ac82d54-9a44-4790-9610-64450a5d9286.PNG)

● 상품문의
![munyipng](https://user-images.githubusercontent.com/42789806/127180794-f92328d3-7681-46c8-aded-af2ea3856dba.png)

● QnA 질문
![qna_q](https://user-images.githubusercontent.com/62326572/127650481-12616dda-4ca2-4ae2-be56-8f2946b222da.PNG)
![qna_r](https://user-images.githubusercontent.com/62326572/127650487-bd653c39-ef8c-4c33-bfb4-c860462f9183.PNG)
![qna_c](https://user-images.githubusercontent.com/62326572/127650501-73de13b0-42a7-478a-8395-978558606d07.PNG)




