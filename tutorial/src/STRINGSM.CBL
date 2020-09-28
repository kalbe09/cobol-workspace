       IDENTIFICATION DIVISION.
       PROGRAM-ID. STRINGSM.
       *> COBOL provides many ways to work with strings
 
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 SampStr     PIC X(18) VALUE 'eerie beef sneezed'.
       01 NumChars    PIC 99 VALUE 0.
       01 NumEs       PIC 99 VALUE 0.
       01 FName       PIC X(6) VALUE 'Martin'.
       01 MName       PIC X(11) VALUE 'Luther King'.
       01 LName       PIC X(4) VALUE 'King'.
       01 FLName      PIC X(11).
       01 FMLName     PIC X(18).
       01 SStr1       PIC X(7) VALUE "The egg".
       01 SStr2       PIC X(9) VALUE "is #1 and".
       01 Dest        PIC X(33) VALUE "is the big chicken". 
       01 Ptr         PIC 9 VALUE 1.
       01 SStr3       PIC X(3).
       01 SStr4       PIC X(3).
 
       PROCEDURE DIVISION.
       *> Zählt alle Buchstaben in SampStr 
       *> Speichert die Länge in NumChars
       INSPECT SampStr TALLYING NumChars FOR CHARACTERS.
       DISPLAY "Number of Characters : " NumChars.
       DISPLAY " " 
       
       *> Zählt das Vorkommen von e
       INSPECT SampStr TALLYING NumEs FOR ALL 'e'.
       DISPLAY "Number of e's : " NumEs.
       DISPLAY " " 
       
       *> Großbuchstaben
       DISPLAY FUNCTION UPPER-CASE(SampStr).
       *> Kleinbuchstaben
       DISPLAY FUNCTION LOWER-CASE(SampStr).
       DISPLAY " "  
       
       
       *> Join 2 strings with a space between them
       STRING FName DELIMITED BY SIZE *> volle Länge von FNAME
       SPACE *> Trennung mit Whitespace
       LName DELIMITED BY SIZE *> volle Länge von LName
       INTO FLName.
       DISPLAY FLName.
 
       *> erstes Wort 
       STRING FLName DELIMITED BY SPACES *> erstes Wort
       SPACE
       MName DELIMITED BY SIZE
       SPACE
       LName DELIMITED BY SIZE
       INTO FMLName
       *> Wenn Länge von FMLName überschrittten wird
       ON OVERFLOW DISPLAY 'Overflowed'. 
       DISPLAY FMLName.
        

       *> Grab The egg
       STRING SStr1 DELIMITED BY SIZE
       SPACE
       *> Grab is and the space up to #
       SStr2 DELIMITED BY "#"
       *> Insert the above starting at index 1 as defined
       *> by pointer
       INTO Dest
       WITH POINTER Ptr *> (= 1)
       ON OVERFLOW DISPLAY 'Overflowed'.
       DISPLAY Dest.
 
       *> Replacing 
       INSPECT Dest REPLACING ALL 'egg' BY 'dog'.
       DISPLAY Dest.
 
       *> Speicherung in mehreren Variablen
       UNSTRING SStr1 DELIMITED BY SPACE
       INTO SStr3, SStr4
       END-UNSTRING.
       DISPLAY SStr4.
 
       STOP RUN.