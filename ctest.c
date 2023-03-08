#define NULL 0

enum boolean_e {
    FALSE,
    TRUE
};

typedef int bool;

int atoi(char *chars);
void itoa(int value, char *chars);
bool isspace(char c);

extern void sys_print(int stream, char *str, int len);

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

int __attribute__((used)) atoi(char *chars) {
    int retval = 0;
    int i = -1;
    bool firstparse = TRUE;
    bool sign = FALSE;
    char lowest = '0';
    char highest = '9';

    while (chars[++i] != NULL)
    {
        if (isspace(chars[i])) {
            if (firstparse) {
                continue;
            }
            else {
                return 0x80000000;
            }
        }

        if (chars[i] == '-') {
            if (firstparse) {
                firstparse = FALSE;
                sign = TRUE;
                continue;
            }
            else {
                return 0x80000000;
            }
        }

        if (chars[i] >= lowest && chars[i] <= highest) {
            retval *= 10;
            retval += chars[i] - lowest;
        }
    }

    return retval;
}

void __attribute__((used)) itoa(int value, char *chars) {
    int i;
    int ihalf;
    int j;
    bool sign = FALSE;
    char lowest = '0';

    if (value & 0x80000000) {
        sign = TRUE;
        value *= -1;
        i += 1;
    }

    do {
        chars[i++] = (value % 10) + lowest;

        value /= 10;
    } while (value != 0);

    if (sign) {
        i -= 1;
    }

    i -= 1;

    ihalf = i / 2;

    if (sign) {
        i += 1;
        ihalf += 1;
        j += 1;
        chars[0] = '-';
    }

    while (i > ihalf) {
        char temp = chars[i];
        chars[i--] = chars[j];
        chars[j++] = temp;
    }
}

bool isspace(char c) {
    if (c == ' ' || c == '\t' || c == '\r' || c == '\n' || c == '\v' || c == '\f') {
        return TRUE;
    }

    return FALSE;
}