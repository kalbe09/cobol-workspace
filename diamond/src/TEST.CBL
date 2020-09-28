       IDENTIFICATION DIVISION.
       PROGRAM-ID. OCCURRENCES.

       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.

       DATA DIVISION.
       FILE SECTION.

       WORKING-STORAGE SECTION.
           01  ALPHA-TABLE PIC X(30) VALUE 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'.
           01  SEARCH-STRING PIC X(1).
           01  MATCH-COUNT PIC 9.
           01  SEARCH-INDEX PIC 99.
           01  ITINDEX PIC 99 VALUE 1.
           01  STATUSREV PIC 9 VALUE 0.
           01  IND PIC 99.
           01  X PIC 99.
           01 CURRENTLINE PIC X(51).
           01  WHITESPACES PIC X(26).
           01  MATCH-POSITIONS.
               05  MATCH-POS PIC 99 OCCURS 9 TIMES.
      
      * CurrentSpaces: Buchstabe wird an entsprechender Stelle eingefügt
      * A wird 2x an gleicher Stelle ausgegeben 
       PROCEDURE DIVISION.
       
       MAIN.
           DISPLAY "Enter a letter"
           ACCEPT SEARCH-STRING
           DISPLAY "     "
           PERFORM FIND-MATCHES

           COMPUTE X = IND * 2 + 1 
           String "a" " " "b" INTO WHITESPACES
           DISPLAY WHITESPACES

           PERFORM X TIMES
               IF STATUSREV = 0 Then
                   DISPLAY ALPHA-TABLE (ITINDEX:1) 
                   ADD 1 TO ITINDEX 
               END-IF
               IF STATUSREV = 1 THEN
                   DISPLAY ALPHA-TABLE (ITINDEX:1)
                   SUBTRACT 1 FROM ITINDEX
               END-IF
               IF ITINDEX = IND + 1 THEN 
                   MOVE 1 TO STATUSREV
               END-IF
           END-PERFORM
           STOP RUN
           .

       FIND-MATCHES.
           MOVE ZERO TO MATCH-COUNT
           INSPECT ALPHA-TABLE   
               TALLYING MATCH-COUNT FOR ALL SEARCH-STRING
        
           PERFORM VARYING SEARCH-INDEX FROM 1 BY 1
               UNTIL SEARCH-INDEX = 26
                   IF ALPHA-TABLE (SEARCH-INDEX:1) = SEARCH-STRING
                          MOVE SEARCH-INDEX TO IND
           END-PERFORM
           .
       


