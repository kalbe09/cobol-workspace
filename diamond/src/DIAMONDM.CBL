       IDENTIFICATION DIVISION.
       PROGRAM-ID. DIAMONDM.
       ENVIRONMENT DIVISION.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
           01 Letter PIC X(1). *> PIC X(1).
           01 CHAR-COUNT  PIC 99 VALUE 0. 
           01 AlphabetList PIC X(26) VALUE 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'. 
           01  Letter-Index PIC 99.
           01  X PIC 99.
           01  IND PIC 99.
           01  ITINDEX PIC 99 VALUE 1.
           01  STATUSREV PIC 9 VALUE 0.
           01  WHITESPACES PIC X(26).
           01  OutputLine PIC A(51) VALUES SPACES.
           01 TESTs PIC A(51).

           01  TEMP-FELDER.
                  05 HOEHE PIC 99.
               05 AUSGABE OCCURS 40.
               07 ZEILE PIC X(40).

       PROCEDURE DIVISION.
       MAIN.
           *> Terminaleingabe
           *> Nimmt immer den ersten Buchstaben als Großbuchstabe entg.
           DISPLAY "Enter a letter: " WITH NO ADVANCING
           ACCEPT Letter
           MOVE FUNCTION UPPER-CASE(Letter) TO Letter
           DISPLAY Letter
           
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
           PERFORM VARYING IND FROM Letter-Index BY -1
               UNTIL IND = 0
               DISPLAY IND *> - 1
           END-PERFORM.
           
           
           
           *> Join 2 strings with a space between them
      *     STRING FName DELIMITED BY SIZE *> volle Länge von FNAME
      *     SPACE
      *     INTO FLName.
      *     DISPLAY FLName.
     
           *> erstes Wort 
      *     STRING TESTs DELIMITED BY SIZE *> erstes Wort
      *     SPACE
      *     INTO TESTs
      *     DISPLAY TESTs

           *> Wenn Länge von FMLName überschrittten wird
      *     ON OVERFLOW DISPLAY 'Overflowed'. 
      *     DISPLAY FMLName.
      *         END-PERFORM.

      *     PERFORM X TIMES
      *         IF STATUSREV = 0 Then
      *             DISPLAY AlphabetList (ITINDEX:1) 
      *             ADD 1 TO ITINDEX 
      *         END-IF
      *         IF STATUSREV = 1 THEN
      *             DISPLAY AlphabetList (ITINDEX:1)
      *             SUBTRACT 1 FROM ITINDEX
      *         END-IF
      *         IF ITINDEX = Letter-Index + 1 THEN 
      *             MOVE 1 TO STATUSREV
      *         END-IF
      *     END-PERFORM

       
       *> 
       FIND-INDEX.
           *> WHILE-SCHLEIFE
           *> Gibt den Index des Buchstabens im Alphabet aus
           PERFORM VARYING Letter-Index FROM 1 BY 1
               UNTIL Letter-Index = 26
                   IF AlphabetList (Letter-Index:1) = Letter
                          MOVE Letter-Index TO IND
           END-PERFORM.
    
       ZEICHNE-DIAMANT SECTION.
           MOVE "X"
             TO ZEILE (1)
           .
           EXIT.
       END PROGRAM DIAMONDM.
