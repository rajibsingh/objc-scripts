#include <Foundation/Foundation.h>

int main() {
    int total = 0;
    for (int i = 0; i < 1000; i++) {
        if (i % 3 == 0 || i % 5 == 0) {
            total += i;
        }
    }
    NSLog(@"total: %d", total);
}