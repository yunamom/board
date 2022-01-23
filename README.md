[구조] 폴더 / 파일 

1. board 
    - boardWrite.jsp
    - boardWriteSave.jsp
    - boardList.jsp
    - boardDetail.jsp
    - boardModify.jsp
    - boardModifySave.jsp
    - passWrite.jsp
    - boardDelete.jsp

2. css
    - layout.css

3. dept

4. emp

5. friend

6. include 
    - topmenu.jsp
    - leftmenu.jsp
    - footer.jsp
    - dbCon.jsp

7. main
    - main.jsp ( layout 샘플 )

8. others

<hr>
[게시판]

1. boardWrite.jsp -쓰기화면

2. boardWriteSave.jsp -저장처리

3. boardList.jsp -목록화면

4. boardDetail.jsp -상세화면

5. boardModify.jsp -수정화면

6. boardModifySave.jsp -수정처리

7. passWrite.jsp -암호화면

8. boardDelete.jsp -삭제처리


<hr>
[답변 게시판]

새로운 컬럼에 대한 이해
1. gid : 신규 글에게 ID 값을 새로 부여하고 관련 댓글들에게는 같은  ID 값을 적용한다.
2. thread: 맨윗글을 필두로 달려져 있는 댓글들에게 차등 부여하여 댓글들끼리의 순서 및 2차,3차 순서를 만든다.


만들어야 되는 파일

1. reBoardWrite.jsp -등록화면 

2. reBoardWriteSave.jsp -등록저장처리

3. reBoardlist.jsp -목록화면

4. reBoardDetail.jsp -상세화면

5. reBoardModify.jsp -수정 화면

6. reBoardModifySave.jsp -수정 저장 처리

7. passWrite.jsp -암호확인 화면

8. reBoardDelete.jsp -삭제 처리

9. replyWrite.jsp -답변 화면

10. replyWriteSave.jsp -답변 저장 처리

<br>

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
