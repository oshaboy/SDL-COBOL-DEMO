cobc -x -O3 -c  SDL_DEMO.CBL 
cc -O3 -o SDL_DEMO SDL_DEMO.o -lcob -lSDL2
