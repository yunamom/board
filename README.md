# ππ»[β JSP κ²μν β](https://yunamom.duckdns.org/board/main/)<br>
<img width="1160" alt="Screen Shot 2022-03-23 at 10 55 02 AM" src="https://user-images.githubusercontent.com/91236026/159606426-1dd1f34e-49a2-485c-b07a-3548e4dad2e4.png">

## π©π»βπ»[ μ μκΈ°κ° : 2022λ 1μ 9μΌ ~ 3μ 12μΌ ] 9μ£Ό

|board - [κ²μν]|reBoard - [λ΅λ³ κ²μν]|member - [νμκ΄λ¦¬]|plan - [μΌμ κ΄λ¦¬]|
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

reBoard - [λ΅λ³ κ²μν]

μλ‘μ΄ μ»¬λΌμ λν μ΄ν΄
- gid : μ κ· κΈμκ² ID κ°μ μλ‘ λΆμ¬νκ³  κ΄λ ¨ λκΈλ€μκ²λ κ°μ  ID κ°μ μ μ©νλ€.
- thread: λ§¨μκΈμ νλλ‘ λ¬λ €μ Έ μλ λκΈλ€μκ² μ°¨λ± λΆμ¬νμ¬ λκΈλ€λΌλ¦¬μ μμ λ° 2μ°¨,3μ°¨ μμλ₯Ό λ§λ λ€.

1. λ±λ‘νλ©΄
    * μ λͺ©κ³Ό μνΈμ μ ν¨μ± μ²΄ν¬λ₯Ό νλ€.
2. λ±λ‘ μ μ₯ μ²λ¦¬
    * λ±λ‘νλ©΄μΌλ‘ λΆν° λμ΄μ¨ λ΄μ©μ μ μ₯νλ€.
    * gid κ°μ max + 1 νμ¬ μ μ₯νλ€.
    * thread κ°μ λͺ¨λ βaβ κ°μ μ μ₯νλ€.
3. λͺ©λ‘νλ©΄
    * μκΈμ λκΈλ€λ λͺ¨λ μΆλ ₯νλ€.
    * νμ΄μ§ μ²λ¦¬λ₯Ό νλ€.
    * μ λͺ©μ ν΄λ¦­νμ¬ μμΈνλ©΄μΌλ‘ μ΄λ ν  μ μλ€.
4. μμΈνλ©΄
    * DBμ μ μ₯λ μ λͺ©,μ΄λ¦,λ΄μ©,μ‘°νμ,λ±λ‘μΌμ μΆλ ₯νλ€.
    * λ΅κΈ,μμ ,μ­μ  λ²νΌμ ν΄λ¦­νμ¬ κ° νλ©΄μΌλ‘ μ΄λ ν  μ μλ€.
    * λ΅κΈ λ²νΌμ ν΄λ¦­ μ λ³ΈκΈμ gid κ°κ³Ό thread κ°μ μ λ¬νλ€.
    * μμ  λ²νΌμ ν΄λ¦­ μ λ³ΈκΈμ unq κ°μ μ λ¬νλ€.
    * μ­μ  λ²νΌμ ν΄λ¦­ μ λ³ΈκΈμ unq κ°μ μ λ¬νλ€.
5. λ΅κΈνλ©΄
    * λ±λ‘νλ©΄κ³Ό κ°μ νλ©΄μΌλ‘ κ΅¬μ±νλ€.
    * λ΄μ© μμ± ν μ μ₯ μ μκΈμ gid κ°κ³Ό thread κ°μ hidden μ²λ¦¬νμ¬ μ λ¬νλ€.
6. λ΅κΈ μ μ₯ μ²λ¦¬
    * λ΅κΈ νλ©΄μΌλ‘ λΆν° λμ΄μ¨ λ΄μ©μ μ μ₯νλ€.
    * gid κ°μ λμ΄μ¨ κ°μ κ·Έλλ‘ μ μ₯νλ€.
    * thread κ°μ μ μ₯λ κ΄λ ¨ thread κ°μ μ΄μ©νμ¬ μ²λ¦¬νλ€.

(μ‘°ν©μ­ κ°μ¬λ)
