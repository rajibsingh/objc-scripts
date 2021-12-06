#import <Foundation/Foundation.h>


bool hasQualifyingBigram(NSString* input) {
    bool retVal = NO;
    NSMutableArray *bigrams = [[NSMutableArray alloc] init];
    for (int i = 0; i < input.length - 2; i++) {
        NSRange bigramRange = NSMakeRange(i, 2);
        NSString* bigram = [input substringWithRange:bigramRange];
        NSLog(@"bigram: %@", bigram);
        [bigrams addObject:bigram]; 
        unichar char1 = [bigram characterAtIndex:0];
        unichar char2 = [bigram characterAtIndex:1];
        unichar char3 = [bigram characterAtIndex:1];
        if (char1 == char3 && char1 != char2) {
            retVal = YES;
                NSLog(@"%@ is a matching bigram", bigram);
        }
    }
    return retVal;
}

int main() {
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
    NSString* filePath = @"input.txt";
    NSString* fileContent = [NSString stringWithContentsOfFile:@"input.txt"
                            encoding:NSUTF8StringEncoding error:nil];
    NSArray* lines = [fileContent componentsSeparatedByString:(NSString *)@"\n"];
    int count = 0;
    for (NSString* line in lines) {
        NSLog(@"line: %@", line);
        if (hasQualifyingBigram(line)) {
            count += 1;
        } 
    }
    NSLog(@"count: %d", count);
    [pool drain];
    return 0;
}