       IDENTIFICATION DIVISION.
       PROGRAM-ID.  BASEM.
      *****************************************************************
      * Implementation des TIC TACT TOE Spiels.
      *****************************************************************       
       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 Hand.
           02 Karte OCCURS 5.
               03 Farbe PIC X(6).
               03 Wert PIC X(5).

       01 BILD PIC X(6).
           88 ASS VALUE "Ass".
           88 KOENIG VALUE "Koenig".
           88 DAME VALUE "Dame".
           88 BUBE VALUE "Bube".
       01 AUSGABE PIC X(20).
        
       PROCEDURE DIVISION.
       DISPLAY "HH"
       MOVE "Bube" TO BILD
       DISPLAY BILD
       EVALUATE TRUE
           WHEN ASS DISPLAY "14"
           WHEN Koenig DISPLAY "13"
           WHEN DAME DISPLAY "12"
           WHEN Bube DISPLAY "11"
       END-EVALUATE

       

       STOP RUN.
