# Web_Service_BBS
1. 웹 서버 환경

아마존의 웹 서버환경인 AWS 중 EC2를 이용하여 서버를 구축하였습니다.
 ![image](https://github.com/jeonwonjun/Web_Service_BBS/assets/84172525/ff84959d-3cb6-44d9-b6b9-f55d2dbe91d6)

위와 같이 Ubuntu Server을 이용하여 구축하였습니다.
 ![image](https://github.com/jeonwonjun/Web_Service_BBS/assets/84172525/bd5e815d-024b-499e-9709-79ecf2cac37d)

InCom-BBS-Project라는 이름으로 인스턴스를 생성하고
 ![image](https://github.com/jeonwonjun/Web_Service_BBS/assets/84172525/a48c6279-f37b-41fc-80b4-7f4630d1ba3c)

탄력적 IP 주소를 할당 받아서 위의 인스턴스와 연동하였습니다.
 ![image](https://github.com/jeonwonjun/Web_Service_BBS/assets/84172525/bffce772-0bc7-4598-88fb-ddc1cfc840ac)

보안그룹도 설정하여 인바운드 규칙, 아웃바운드 규칙을 따로 설정해주었습니다.
PuTTY를 통해 서버에 접속 한 후 github에 올려놓은 프로젝트로 접속하여 할당된 ip주소로 외부에서 접속할 수 있도록 하였습니다.
 ![image](https://github.com/jeonwonjun/Web_Service_BBS/assets/84172525/84b59951-541d-4d95-8b99-ceb620512b8e)

추가로 PuTTy Gen을 통해 AWS EC2 인스턴스에서 생성한 .pem키를 .ppk라는 private 키로 새로 생성하여 안전하게 서버에 접속할 수 있도록 했습니다.
 
2. 외부 접속 Domain Name 또는 ip:port

외부 접속은 Public IPv4와 Public IPv4 DNS를 통해 접속할 수 있습니다.

IPv4 링크: http://13.124.131.189:8080/BBS/main.jsp
IPv4 DNS 링크: http://ec2-13-124-131-189.ap-northeast-2.compute.amazonaws.com:8080/BBS/main.jsp

3. 웹 페이지 작성에 대한 설명, 중요 코드
프로젝트는 JSP와 부트스트랩을 기반으로 제작하였습니다. 데이터베이스는 MySQL을 사용하여 관리할 수 있도록 했고, Tomcat으로 서버연결하였습니다.
 ![image](https://github.com/jeonwonjun/Web_Service_BBS/assets/84172525/ad4e1085-a23a-4ede-a3b1-05be460b289f)

DB의 정보를 MySQL과 연결할 수 있도록 정보를 넣어주었습니다.
 ![image](https://github.com/jeonwonjun/Web_Service_BBS/assets/84172525/ce32ea64-8614-403c-839e-beb941339b35)

위와 같이 회원정보 데이터베이스인 user table을 만들어서 데이터를 관리할 수 있도록 했습니다.

<회원가입 페이지>
 ![image](https://github.com/jeonwonjun/Web_Service_BBS/assets/84172525/b741cf1a-2255-4dde-99cf-e95fee174f5a)

<로그인 페이지>
 ![image](https://github.com/jeonwonjun/Web_Service_BBS/assets/84172525/a55b3868-301f-4c93-9867-b410fb2b10b8)

아이디, 비밀번호, 이름, 성별, 이메일을 입력하여 회원가입 할 수 있고 회원가입 페이지에서 입력된 정보가 데이터베이스에 저장된 후 로그인 페이지에서 로그인하여 접속할 수 있도록 제작하였습니다.
<게시판 목록 페이지>
 ![image](https://github.com/jeonwonjun/Web_Service_BBS/assets/84172525/62e971b1-c119-41bc-82be-5d489195cab5)

 ![image](https://github.com/jeonwonjun/Web_Service_BBS/assets/84172525/4ca04fb7-d84d-4ba3-8c9b-4b33c6b0dde0)

 ![image](https://github.com/jeonwonjun/Web_Service_BBS/assets/84172525/6cabc102-d433-4c46-97eb-b45995f2eb11)

게시판에서 write함수를 만들어서 게시판에 적은 글을 SQL에 INSERT 하도록 제작하였습니다.
<게시글 보기>
 ![image](https://github.com/jeonwonjun/Web_Service_BBS/assets/84172525/f7c6b705-b983-4e05-9920-1e709a76023e)

 ![image](https://github.com/jeonwonjun/Web_Service_BBS/assets/84172525/9f7c6f02-8890-48ce-a581-b56643a68e8d)

제목을 누르면 내가 적은 content와 로그인한 정보, 현재 시간이 나오며 작성자가 같은 글의 페이지를 들어가면 ‘수정’,’삭제’ 기능을 사용할 수 있습니다.
 
4. 개인적 소감 / 어려웠던 점 및 해결 과정
<개인적 소감>
프로젝트에는 JSP, 서버로는 Tomcat과 AWS EC2, 데이터베이스로는 MySQL, 리눅스로 Ubuntu를 사용하였습니다. 프로젝트를 진행하면서 클라이언트부터 서버와 데이터베이스까지 처음 다뤄보는 것들이 많았는데 내가 직접 제작한 사이트를 다른 사람이 들어와서 사용할 수 있다는 점이 새로웠고 재밌었습니다. 직접 풀스택으로 개발해본 경험은 처음인데 정말 값진 경험이 되었고, 대체로 구글링을 통해서 제작하였는데 생각보다 구글링으로 해결안되는 부분이 많았습니다. 어느정도 이해해야 구글링에서 나온 정보들을 활용하여 사용할 수 있다는 것을 배웠고 이번 프로젝트로 한 발자국 더 성장하게 되었습니다. 이런 프로젝트를 많이 경험해봐야 되겠다는 생각을 하게되었고 이번 프로젝트에서 다뤄본 플랫폼 말고 다른 플랫폼도 사용해보고 싶습니다.

<어려웠던 점 및 해결 과정>
가장 어려웠던 것은 저의 프로젝트를 외부서버로 배포하는 부분이었습니다. ip:port 정보만 있다고 해서 배포 되는 것이 아니라 보안 그룹의 범위가 중요하다는 것을 알게되었습니다. 인바운드 규칙에 기본 port, SSH port, MySQL port 규칙을 추가해서 연동할 수 있도록 해야했습니다. 특히 MySQL을 연동하는 데 많은 어려움을 느꼈고, MySQL의 bind-address를 변경하여 문제를 해결하였습니다. 프로젝트를 war로 배포하여 git에 업로드하는 부분에서 github를 다루는데 어려운부분이 있어서 git도 공부해가면서 문제를 해결해나갔습니다.
