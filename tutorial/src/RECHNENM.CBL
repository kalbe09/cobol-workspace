       IDENTIFICATION DIVISION.
       PROGRAM-ID.  RECHNENM.
      *****************************************************************
      * Implementation des TIC TACT TOE Spiels.
      *****************************************************************       
       ENVIRONMENT DIVISION.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 Num1 PIC 99 VALUE 50.
       01 Num2 PIC 9 VALUE 4.
       01 Num3 PIC 9 VALUE 3.
       01 Ans PIC 99V99 VALUE 0.
       01 Rem PIC 9V99.
       
       PROCEDURE DIVISION.
      * Addieren
           ADD Num1 To Num2 GIVING Ans
           DISPLAY Num1 " + " Num2 " = " Ans
           
           *> mehrere Summanden
           ADD Num1, Num3 To Num2 GIVING Ans
           DISPLAY Num1 " + " Num3 " + " Num2 " = " Ans
           
           *> kürzere Fassung
           ADD Num1, Num3, Num2 GIVING Ans
           DISPLAY Num1 " + " Num3 " + " Num2 " = " Ans
      
      * Subtraktion
           SUBTRACT Num1 FROM Num2 GIVING Ans
           DISPLAY Num1 " - " Num2 " = " Ans
      
      * Multiplikation
           MULTIPLY Num1 BY Num2 GIVING Ans
           DISPLAY Num1 " * " Num2 " = " Ans
      
      * Divisiion
           DIVIDE Num1 BY Num2 GIVING Ans
           DISPLAY Num1 " / " Num2 " = " Ans
           
           *> mit Remainder
           DIVIDE Num1 BY Num2 GIVING Ans REMAINDER Rem
           DISPLAY Num1 " / " Num2 " = " Ans
           DISPLAY Rem
           
           COMPUTE Ans = Num1 + Num2
           COMPUTE Ans = Num1 - Num2
           COMPUTE Ans = Num1 * Num2
           COMPUTE Ans = Num1 / Num2
      
      * mit Exponenten
           COMPUTE Ans = Num1 ** Num2

      * Klammer setzen 
           COMPUTE Ans = (Num1 + Num2) * Num3
      
      * Runden
           *> Ergebnis wird abgeschnitten
           COMPUTE Ans = 3.0 + 2.005
           DISPLAY Ans
           *> Ergebnis wird auf Nachkommastelle gerundet
           COMPUTE Ans ROUNDED = 3.0 + 2.005
           DISPLAY Ans

           STOP RUN.
