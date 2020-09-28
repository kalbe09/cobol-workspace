       IDENTIFICATION DIVISION.
       PROGRAM-ID. TEST.
       AUTHOR. Kira Alberding.
       DATE-WRITTEN. SEPTEMBER 28st 2020
       ENVIRONMENT DIVISION.

       DATA DIVISION.
      * FILE SECTION. 
      
      * Variablen 
       WORKING-STORAGE SECTION.
      * X Alphanummerical X(30) 
      * VALUE = Default
      * PIC 99 = max Value of 99

      * Number 
       01 CURRENT-NUMBER PIC 99.
      * String 
       01 CURRENT-RESULT PIC X(8).
      * List? 
       01 SSNum.
           02 SSArea PIC 999.
           02 SSGroup PIC 99.
       01 PIValue CONSTANT AS 3.14.
      *> ZERO, ZEROES


       PROCEDURE DIVISION.
      * Eingeben einer Zahl
      * DISPLAY "Enter a number" WITH NO ADVANCING
           DISPLAY "Enter a number"
           ACCEPT CURRENT-NUMBER
           DISPLAY "Current number: " CURRENT-NUMBER  
      * SET X to Variable     
           MOVE 5 TO CURRENT-NUMBER
           DISPLAY CURRENT-NUMBER
      * Addieren
           COMPUTE CURRENT-NUMBER = CURRENT-NUMBER + CURRENT-NUMBER
           DISPLAY CURRENT-NUMBER
      * SSNUM: Gives the first 3 positions see PIC 999
           DISPLAY "Enter a number"
           ACCEPT SSNUM
           DISPLAY "AREA " SSArea




           STOP RUN.
