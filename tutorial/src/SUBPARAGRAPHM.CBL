       IDENTIFICATION DIVISION.
       PROGRAM-ID.  SUBPARAGRAPHM.
     
       ENVIRONMENT DIVISION.
       CONFIGURATION SECTION.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 Num1    PIC 9 VALUE 5.
       01 Num2    PIC 9 VALUE 4.
       01 Sum1     PIC 99.

       PROCEDURE DIVISION.
       *> Gravity driven programming falls through the
       *> code until a condition or goto redirects it 
       *> Open paragraphs are executed through gravity
       *> while closed paragraphs are executed by name.
       *> Open paragraphs are basically ways to name blocks
       *> of code (tags).
       *> Data created in a closed paragraph can't be
       *> accessed outside of it. They are traditional functions.
 
       *> This demonstrates the flow
       SubOne.
              DISPLAY "In Paragraph 1"
              
              *> Andere Dateien nutzen
              CALL 'GETSUM' USING Num1, Num2, Sum1.
              DISPLAY "Call: " Num1 " + " Num2 " = " Sum1.
              
              PERFORM SubTwo
              DISPLAY "Returned to Paragraph 1"
              *> Execute code multiple times
              PERFORM 2 TIMES
              DISPLAY "Repeat"
              END-PERFORM
              

              STOP RUN.
 
       SubThree.
              DISPLAY "In Paragraph 3".
       
       SubTwo.
              DISPLAY "In Paragraph 2"
              PERFORM SubThree
              DISPLAY "Returned to Paragraph 2".
              STOP RUN.
       

          
