cobc -x -O3 -c -fstatic-call SDL_DEMO.CBL
gcc -o SDL_DEMO SDL_DEMO.o $(cob-config --libs) -lSDL2
