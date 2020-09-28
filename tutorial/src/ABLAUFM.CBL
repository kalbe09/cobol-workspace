       IDENTIFICATION DIVISION.
       PROGRAM-ID.  ABLAUFM.
      *****************************************************************
      * Implementation des TIC TACT TOE Spiels.
      *****************************************************************       
       ENVIRONMENT DIVISION.
       CONFIGURATION SECTION.
       SPECIAL-NAMES.
           CLASS PassingSCore IS "A" THRU "C", "D".
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 Age PIC 99 VALUE 0.
       01 Grade PIC 99 VALUE 0.
       01 Score PIC X(1) VALUE "B".
      
      * BOOLEAN 
       01 CanVoteFlag PIC 9 VALUE 0.
           88 CanVote VALUE 1.
           88 CantVote VALUE 0.
      
      * CASES
       01 TestNumber PIC X.
           88 IsPrime VALUE "1", "3", "5", "7".
           88 IsOdd VALUE "1", "3", "5", "7", "9".
           88 LessThan5 VALUE "1" THRU "4".
           88 ANumber VALUE "0" THRU "9".

       
       PROCEDURE DIVISION.
       DISPLAY "Enter Age: " WITH NO ADVANCING
       ACCEPT Age
      
      * IF Else 
       *> LESS THAN                <
       *> LESS THAN OR EQUAL       <=
       *> GREATER THAN             >
       *> GREATER THAN OR EQUAL    >=
       *> EQUAL THAN               =
       *> NOT EQUAL THAN           <>

       IF Age >= 18 THEN
           DISPLAY "You can vote"
       ELSE    
           DISPLAY "You cant vote"
       END-IF

       IF Age GREATER THAN 5 AND Age LESS THAN 10 THEN 
           DISPLAY "Go home"
           COMPUTE Grade = Age - 5
           DISPLAY "Go to Grade: " Grade
       END-IF
       
      * Classification (?)
       IF Score IS PassingScore THEN
           DISPLAY "You Passed"
       ELSE
           DISPLAY "You Failed"
       END-IF

      * Typüberprüfung
       IF Score IS NOT NUMERIC THEN
           DISPLAY "Not a number" 
       END-IF
       
      * BOOLEAN
       IF Age GREATER THAN OR EQUAL 18 THEN 
           SET CanVote TO TRUE
       ELSE
           SET CantVote TO TRUE
       END-IF
       DISPLAY "Vote " CanVoteFlag


      * SELECT-CASE
       DISPLAY "Enter a single Number or X to Exit: "
       ACCEPT TestNumber
       PERFORM UNTIL NOT ANumber
           EVALUATE TRUE
               WHEN IsPrime DISPLAY "PRIME"
               WHEN IsOdd DISPLAY "Odd"                              
               WHEN LessThan5 DISPLAY "Less than 5"
               WHEN OTHER DISPLAY "Default Action"
           END-EVALUATE
           ACCEPT TestNumber
       END-PERFORM                   

       STOP RUN.
