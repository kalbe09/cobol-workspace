       IDENTIFICATION DIVISION.
       PROGRAM-ID. DIAMONDM.
       ENVIRONMENT DIVISION.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
           01 Letter PIC X(1).
           01 AlphabetList PIC X(26) VALUE 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'. 
           01 Letter-Index PIC 99. *> Index des Buchstabens im Alphabet
           01 ITINDEX PIC 99 VALUE 1. *> Index des Buchstabens 
           01 IND PIC 99. *> Index am Anfang der OutputLine
           01 INDREV PIC 99. *> Index am Ende der OutputLine 
           01 STATUSREV PIC 9 VALUE 0. *> Status zur Verkleinerung 
           01 OutputLine PIC A(51) VALUES SPACES.
           


       PROCEDURE DIVISION.
       MAIN.
           *> Terminaleingabe
           *> Nimmt immer den ersten Buchstaben als Großbuchstabe entg.
           DISPLAY "Enter a letter: " WITH NO ADVANCING
           ACCEPT Letter
           MOVE FUNCTION UPPER-CASE(Letter) TO Letter
           
           *> Wenn Input eine Zahl ist exit
           IF Letter IS NUMERIC THEN
               DISPLAY "Not a Letter!"
               STOP RUN.
           
           *> Index des Buchstabens im Alphabet suchen: Letter-Index
           PERFORM FIND-INDEX
           MOVE IND TO Letter-Index
      *    DISPLAY Letter-Index

           PERFORM WRITE-LINES
           STOP RUN.




       WRITE-LINES.
           MOVE Letter-Index TO INDREV
           
           *> Erste Hälfte des Diamanten
           PERFORM VARYING IND FROM Letter-Index BY -1
               UNTIL IND = 0
                    
               *> Leeren der OutputLine
               MOVE SPACES TO OutputLine
               *> Einfügen der Buchstaben
               MOVE AlphabetList (ITINDEX:1) TO OutputLine (IND:1)
               MOVE AlphabetList (ITINDEX:1) 
                   TO OutputLine (INDREV:1)                   
               DISPLAY OutputLine 
                   
               *> Ausblenden der Leerzeile 
               IF IND NOT EQUAL 1 THEN
                   ADD 1 TO ITINDEX
                   ADD 1 TO INDREV
               END-IF
           END-PERFORM
          
           *> Zweite Hälfte des Diamanten 
           PERFORM VARYING IND FROM 0 BY 1
               UNTIL IND = Letter-Index + 1
               
               *> STATUSREV eigentlich überflüssig 
               *> Beim Entfernen treten aber Fehler auf
               IF STATUSREV = 1 AND IND NOT EQUAL 1 THEN
                   SUBTRACT 1 FROM INDREV    
                   SUBTRACT 1 FROM ITINDEX
                   *> Leeren der OutputLine
                   MOVE SPACES TO OutputLine
                   *> Einfügen der Buchstaben
                   MOVE AlphabetList (ITINDEX:1) TO OutputLine (IND:1)
                   MOVE AlphabetList (ITINDEX:1) 
                       TO OutputLine (INDREV:1)                   
                   DISPLAY OutputLine 
                   
                   
               END-IF
               IF ITINDEX = Letter-Index THEN 
                   MOVE 1 TO STATUSREV
               END-IF
           END-PERFORM.
           
                 
       FIND-INDEX.
           *> WHILE-SCHLEIFE
           *> Gibt den Index des Buchstabens im Alphabet aus
           PERFORM VARYING Letter-Index FROM 1 BY 1
               UNTIL Letter-Index = 27
                   IF AlphabetList (Letter-Index:1) = Letter
                          MOVE Letter-Index TO IND
           END-PERFORM.
    
