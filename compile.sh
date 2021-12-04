cobc -x -O3 -c  SDL_DEMO.CBL
cc -export-dynamic -o SDL_DEMO SDL_DEMO.o -lSDL2 -lcob -lm
