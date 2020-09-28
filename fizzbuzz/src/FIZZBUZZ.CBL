       IDENTIFICATION DIVISION.
       PROGRAM-ID. FIZZBUZZ.
       ENVIRONMENT DIVISION.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 CURRENT-NUMBER PIC 999 VALUE 1.
       01 CURRENT-RESULT PIC X(8).
       01 X3 PIC 99.
       01 X5 PIC 99.
       01 BIS PIC 999.
       
       PROCEDURE DIVISION.
          DISPLAY "Enter a number "
          ACCEPT BIS
      
           PERFORM BIS TIMES
      
      * Berechnung von Modulo  
      * CURRENT-NUMBER % 3
               MOVE FUNCTION MOD(CURRENT-NUMBER 3) TO X3
      * CURRENT-NUMBER  % 5
               MOVE FUNCTION MOD(CURRENT-NUMBER 5) TO X5

      * Wenn CURRENT-NUMBER durch 3 teilbar ist 
               IF X3 = 00 THEN 
      * Und durch 5 teilbar
                   IF X5 = 00 THEN               
                          DISPLAY "FIZZBUZZ"
                   ELSE
                          DISPLAY "FIZZ"
                   END-IF
      
      * Wenn CURRENT-NUMBER nicht durch 3 teilbar ist, 
      * sondern nur durch 5
               ELSE               
                   IF X5 = 00 THEN
                       DISPLAY "BUZZ"
                   ELSE
                       DISPLAY CURRENT-NUMBER
                   END-IF
               END-IF
               ADD 1 TO CURRENT-NUMBER
           END-PERFORM

           GOBACK.
           
           STOP RUN.
