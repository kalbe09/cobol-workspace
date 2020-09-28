       IDENTIFICATION DIVISION.
       PROGRAM-ID. FILES_WRITEM.
 
       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       *> Connect the name of the customer file name in this
       *> code to a file. Records on separate lines
       FILE-CONTROL.
              SELECT CustomerFile ASSIGN TO "Customer.dat"
               ORGANIZATION IS LINE SEQUENTIAL
               ACCESS IS SEQUENTIAL.
 
       DATA DIVISION.
       *> File section describes data in files
       FILE SECTION.
       *> FD (File Description) describes the file layout
       FD CustomerFile.
       *> Design the customer record
       01 CustomerData.
              02 IDNum    PIC 9(8).
              02 CustName.
               03 FirstName    PIC X(15).
               03 LastName     PIC X(15).
 
       WORKING-STORAGE SECTION.
       01 WSCustomer.
              02 WSIDNum    PIC 9(5).
              02 WSCustName.
               03 WSFirstName    PIC X(15).
               03 WSLastName     PIC X(15).
               
       PROCEDURE DIVISION.       
       *> Datensätze hardcoded eingeben
       *> OPEN OUTPUT CustomerFile.
              *>MOVE 00001 TO IDNum.
              *>MOVE 'Doug' TO FirstName.
              *>MOVE 'Thomas' TO LastName.

       *> Mit dem Terminal Daten schreiben        
       OPEN EXTEND CustomerFile.
               DISPLAY "Customer ID " WITH NO ADVANCING
               ACCEPT IDNum.
               DISPLAY "Customer First Name " WITH NO ADVANCING
               ACCEPT FirstName.
               DISPLAY "Customer Last Name " WITH NO ADVANCING
               ACCEPT LastName.  
              
              WRITE CustomerData
              END-WRITE.
       CLOSE CustomerFile.
       STOP RUN.
