#import <Foundation/Foundation.h>

bool hasMatchingBigram(NSString* input){
    for (int i = 0; i < lineStr.lenth -1; i++) {
        NSRange bigramRange = NSMakeRange(i, 2);
        NSString* bigram = [input substringWithRange:bigramRange];
        if ([bigram characterAtIndex:0] == [bigram characterAtIndex:1]
                && [bigram characterAtIndex:0] != [bigram characterAtIndex:1] ) {
            NSLog(@"%@ is a matching bigram", bigram);
            return YES;
        }
    }
    return NO;
}
bool hasMatchingTrigram(NSString* trigram) {
    if ([trigram characterAtIndex:0] == [trigram characterAtIndex:1]
            && [trigram characterAtIndex:0] != [trigram characterAtIndex:1] ) {
        NSLog(@"%@ is a matching trigram", trigram);
        return YES;
    }
    return NO;
}
int main() {
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
    NSString* filePath = @"input.txt";
    NSString* fileContent = [NSString stringWithContentsOfFile:@"input.txt"
                            encoding:NSUTF8StringEncoding error:nil];
    NSArray* lines = [fileContent componentsSeparatedByString:(NSString *)@"\n"];
    int totalNice = 0;
    for (id line in lines) {
        NSString* lineStr = (NSString *)line;
        NSLog(@"lineStr: %@", lineStr);
        if (hasMatchingBigram(lineStr) && hasMatchingTrigram(lineStr)) {
            totalNice += 1;
        }
    }
    NSLog(@"total nice: %d", totalNice);

    [pool drain];
    return 0;
}