# 👉🏻[∙ JSP 게시판 ∙](https://yunamom.duckdns.org/board/main/)<br>
<img width="1160" alt="Screen Shot 2022-03-23 at 10 55 02 AM" src="https://user-images.githubusercontent.com/91236026/159606426-1dd1f34e-49a2-485c-b07a-3548e4dad2e4.png">

## 👩🏻‍💻[ 제작기간 : 2022년 1월 9일 ~ 3월 12일 ] 9주

|board - [게시판]|reBoard - [답변 게시판]|member - [회원관리]|plan - [일정관리]|
|----------|----------|----------|----------|
| - boardWrite.jsp | - reBoardWrite.jsp | - memberWrite.jsp | - planList.jsp |
| - boardWriteSave.jsp | - reBoardWriteSave.jsp | - memberWriteSave.jsp | - planWrite.jsp |
| - boardList.jsp | - reBoardlist.jsp | - memeberModify.jsp | - planWriteSave.jsp |
| - boardDetail.jsp | - reBoardDetail.jsp | - memberModifySave.jsp | - planView.jsp |
| - boardModify.jsp | - reBoardModify.jsp | - idcheck.jsp | - planDelete.jsp |
| - passWrite.jsp | - reBoardModifySave.jsp| - post1.jsp | - planModify.jsp |
| - boardDelete.jsp | - passWrite.jsp | - post2.jsp | - planModifySave.jsp |
|                   | - passModify.jsp | - loginWrite.jsp | | 
|                   | - reBoardDelete.jsp | - loginWriteSub.jsp |  |
|                   | - replyWrite.jsp | - logout.jsp |       |
|| - replyWriteSave.jsp| - memberList.jsp | |

reBoard - [답변 게시판]

새로운 컬럼에 대한 이해
- gid : 신규 글에게 ID 값을 새로 부여하고 관련 댓글들에게는 같은  ID 값을 적용한다.
- thread: 맨윗글을 필두로 달려져 있는 댓글들에게 차등 부여하여 댓글들끼리의 순서 및 2차,3차 순서를 만든다.

1. 등록화면
    * 제목과 암호의 유효성 체크를 한다.
2. 등록 저장 처리
    * 등록화면으로 부터 넘어온 내용을 저장한다.
    * gid 값은 max + 1 하여 저장한다.
    * thread 값은 모두 ‘a’ 값을 저장한다.
3. 목록화면
    * 원글의 댓글들도 모두 출력한다.
    * 페이징 처리를 한다.
    * 제목을 클릭하여 상세화면으로 이동 할 수 있다.
4. 상세화면
    * DB에 저장된 제목,이름,내용,조회수,등록일을 출력한다.
    * 답글,수정,삭제 버튼을 클릭하여 각 화면으로 이동 할 수 있다.
    * 답글 버튼을 클릭 시 본글의 gid 값과 thread 값을 전달한다.
    * 수정 버튼을 클릭 시 본글의 unq 값을 전달한다.
    * 삭제 버튼을 클릭 시 본글의 unq 값을 전달한다.
5. 답글화면
    * 등록화면과 같은 화면으로 구성한다.
    * 내용 작성 후 저장 시 원글의 gid 값과 thread 값을 hidden 처리하여 전달한다.
6. 답글 저장 처리
    * 답글 화면으로 부터 넘어온 내용을 저장한다.
    * gid 값은 넘어온 값을 그대로 저장한다.
    * thread 값은 저장된 관련 thread 값을 이용하여 처리한다.

(조황섭 강사님)
