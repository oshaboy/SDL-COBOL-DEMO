      ******************************************************************
      * Author:
      * Date:
      * Purpose:
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. MAIN-METHOD.
       DATA DIVISION.
       FILE SECTION.
       WORKING-STORAGE SECTION.

       77 SDL-WINDOW USAGE POINTER.
       77 WINDOW-TITLE PIC X(20) VALUE Z"SDL COBOL DEMO".
       77 SDL-RENDERER USAGE POINTER.
       77 WIDTH PIC 9(3) VALUE 640.
       77 HEIGHT PIC 9(3) VALUE 480.
       77 X1 PIC 9(3).
       77 X2 PIC 9(3).
       77 Y1 PIC 9(3).
       77 Y2 PIC 9(3).
       77 COLOR_R PIC 9(3).
       77 COLOR_G PIC 9(3).
       77 COLOR_B PIC 9(3).
       01 E.
        05 E_TYPE USAGE BINARY-INT UNSIGNED.
        05 USAGE BINARY-CHAR OCCURS 60 TIMES.
       77 E_RETURN PIC 9(1).
       PROCEDURE DIVISION.
       MAIN-PROCEDURE.
       
	    CALL "SDL_Init" USING
	    BY VALUE 62001
	    END-CALL.
	    
            CALL "SDL_CreateWindow" USING
            BY CONTENT WINDOW-TITLE
            BY VALUE WIDTH
            BY VALUE HEIGHT
            BY VALUE WIDTH
            BY VALUE HEIGHT
            BY VALUE 2
            RETURNING SDL-WINDOW
            END-CALL.

            CALL "SDL_CreateRenderer" USING
             BY VALUE SDL-WINDOW
             BY VALUE -1
             BY VALUE 1
             RETURNING SDL-RENDERER
            END-CALL.

            CALL "SDL_SetRenderDrawColor" USING
             BY VALUE SDL-RENDERER
             BY VALUE 255
             BY VALUE 255
             BY VALUE 255
             BY VALUE 255
            END-CALL.


            CALL "SDL_RenderClear" USING BY VALUE SDL-RENDERER END-CALL.
            PERFORM DRAW-LINE 9999 TIMES.
           GOBACK.
        DRAW-LINE.
         COMPUTE COLOR_R=FUNCTION RANDOM()*256.
         COMPUTE COLOR_G=FUNCTION RANDOM()*256.
         COMPUTE COLOR_B=FUNCTION RANDOM()*256.
         CALL "SDL_SetRenderDrawColor" USING
           BY VALUE SDL-RENDERER
           BY VALUE COLOR_R
           BY VALUE COLOR_G
           BY VALUE COLOR_B
           BY VALUE 255
         END-CALL.
         DISPLAY "Color = (" WITH NO ADVANCING.
         DISPLAY COLOR_R WITH NO ADVANCING.
         DISPLAY ", " WITH NO ADVANCING.
         DISPLAY COLOR_G WITH NO ADVANCING.
         DISPLAY ", " WITH NO ADVANCING.
         DISPLAY COLOR_B WITH NO ADVANCING.
         DISPLAY ")".
         COMPUTE X1=FUNCTION RANDOM()*WIDTH.
         COMPUTE X2=FUNCTION RANDOM()*WIDTH.
         COMPUTE Y1=FUNCTION RANDOM()*HEIGHT.
         COMPUTE Y2=FUNCTION RANDOM()*HEIGHT.

         DISPLAY "Line = (" WITH NO ADVANCING.
         DISPLAY X1 WITH NO ADVANCING.
         DISPLAY ", " WITH NO ADVANCING.
         DISPLAY Y1 WITH NO ADVANCING.
         DISPLAY ", " WITH NO ADVANCING.
         DISPLAY X2 WITH NO ADVANCING.
         DISPLAY ", " WITH NO ADVANCING.
         DISPLAY Y2 WITH NO ADVANCING.
         DISPLAY ")".
         CALL "SDL_RenderDrawLine" USING
           BY VALUE SDL-RENDERER
           BY VALUE X1
           BY VALUE Y1
           BY VALUE X2
           BY VALUE Y2
         END-CALL.
         CALL "SDL_RenderPresent"
            USING BY VALUE SDL-RENDERER
         END-CALL.
         CALL "SDL_Delay" USING BY VALUE 1 END-CALL.
        PERFORM CHECK_QUIT.
       CHECK_QUIT.
        CALL "SDL_PollEvent"
         USING BY REFERENCE E
         RETURNING E_RETURN
        END-CALL.

        PERFORM UNTIL E_RETURN EQUALS 0

         IF E_TYPE=256 THEN
          DISPLAY "EXIT"
          STOP RUN
         END-IF
         CALL "SDL_PollEvent"
          USING BY REFERENCE E
          RETURNING E_RETURN
         END-CALL
        END-PERFORM.


       END PROGRAM MAIN-METHOD.
