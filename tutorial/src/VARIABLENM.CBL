       IDENTIFICATION DIVISION.
       PROGRAM-ID.  VARIABLENM.
      *****************************************************************
      * Implementation des TIC TACT TOE Spiels.
      *****************************************************************       
       ENVIRONMENT DIVISION.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 SampleData PIC X(10) VALUE "Stuff".
       01 JustLetters PIC AAA VALUE "ABC".
       01 JustNumbers PIC 9(4) Value 1234.
       01 SignedInt PIC S9(4) VALUE -1234.
       01 PayCheck PIC 9(4)V99 VALUE ZEROS.
       01 Customer.
           02 Ident PIC 9(3).
           02 CustName PIC X(20).
           02 DateOfBirth.
               03 MOB PIC 99.
               03 DOB PIC 99.
               03 YOB PIC 9(4).
       01 Num1 PIC 99 VALUE 50.
       01 Num2 PIC 9 VALUE 4.
       01 Num3 PIC 9 VALUE 3.
       01 Ans PIC 99V99 VALUE 0.
       01 Rem PIC 9V99.
       
       PROCEDURE DIVISION.
      * Variable neue Werte zuweisen     
           MOVE "More Stuff" TO SampleData
           MOVE "123" TO SampleData
           MOVE 123 TO SampleData
           DISPLAY SampleData
           
      * Variablengruppen
           MOVE "123Bob Smith          12211974" TO Customer
           DISPLAY "CustName: " CustName
           DISPLAY "DateOfBirth: " DOB "." MOB "." YOB


      * Variablen mit Werten füllen           
           *> Nullen
           MOVE ZEROS TO SampleData
           DISPLAY "Nullen: " SampleData
           
           *> Whitespaces 
           MOVE SPACE TO SampleData
           DISPLAY "Whitespaces: " SampleData

           *> (???)
           MOVE HIGH-VALUE TO SampleData
           DISPLAY "High: " SampleData
           MOVE LOW-VALUE TO SampleData
           DISPLAY "Low: " SampleData
      
           *> "" 
           MOVE QUOTE TO SampleData
           DISPLAY "Quotes: " SampleData
      
           *> Mustern, Zahlen, Buchstaben     
           MOVE ALL "2B" TO SampleData
           DISPLAY "Pattern: " SampleData

           STOP RUN.
