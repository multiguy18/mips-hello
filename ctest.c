#include "minclib.h"
#include "system.h"

void __attribute__((used)) testfun() {
    char number[] = "933";
    char buffer[5];

    int parsed = atoi(number);
    itoa(parsed, buffer);

    sys_print(1, buffer, 5);
}

int __attribute__((used)) add(int val1, int val2) {
    return val1 + val2;
}
