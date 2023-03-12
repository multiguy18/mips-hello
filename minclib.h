#ifndef MINCLIB
#define MINCLIB

#define NULL 0

enum boolean_e {
    FALSE,
    TRUE
};

typedef int bool;

int atoi(char *chars);
void itoa(int value, char *chars);
bool isspace(char c);

#endif // MINCLIB
