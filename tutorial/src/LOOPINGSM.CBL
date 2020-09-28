       IDENTIFICATION DIVISION.
       PROGRAM-ID.  LOOPINGSM.
      *****************************************************************
      * Implementation des TIC TACT TOE Spiels.
      *****************************************************************       
       ENVIRONMENT DIVISION.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 Ind    PIC 9(1)    VALUE 0.
       
       
       
       
       PROCEDURE DIVISION.
       
       PERFORM OutputData WITH TEST AFTER UNTIL Ind > 5
           GO TO ForLoop.

       OutputData.
           DISPLAY Ind.
           ADD 1 TO Ind.

       ForLoop.
           PERFORM OutputData2 VARYING Ind FROM 1 BY 1 UNTIL Ind=5
           STOP RUN.
 
       OutputData2.
           DISPLAY Ind.
           
           