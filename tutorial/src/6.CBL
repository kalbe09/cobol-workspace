       IDENTIFICATION DIVISION.
       PROGRAM-ID. tutorial15.
       *> Object Oriented COBOL uses classes to describe
       *> data and methods to work with that data
        
       REPOSITORY.
              CLASS ToDoCls AS "todolist".
        
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 WorkToDo USAGE OBJECT REFERENCE ToDoCls.
       01 ToDoToAdd   PIC X(20).
              88 EndOfInput   VALUE SPACES.
       01 DescToAdd   PIC X(50).
        
       PROCEDURE DIVISION.
       INVOKE ToDoCls "new" USING BY CONTENT "Work ToDo"
           RETURNING WorkToDo
        
       PERFORM AddToToDoList WITH TEST AFTER UNTIL EndOfInput
       INVOKE WorkToDo "PrintToDos"
        
       STOP RUN.
        
       AddToToDoList.
       DISPLAY "Enter To Do : " WITH NO ADVANCING
       ACCEPT ToDoToAdd
       DISPLAY "Enter Description : " WITH NO ADVANCING
       ACCEPT DescToAdd
       INVOKE WorkToDo "AddItemToToDo"
           USING BY CONTENT ToDoToAdd, DescToAdd.