#import <Foundation/Foundation.h>

/*********************************/
@interface Circuitboard:NSObject 

-(Circuitboard*)init;
-(void)addToDict:(NSString*)key value:(NSInteger)value;
-(NSInteger)getRegister:(NSString*)name;
-(BOOL)isNumeric:(NSString*)key;
-(void)rshift:(NSString*)src shifts:(NSInteger)shifts dest:(NSString*)dest;
-(void)lshift:(NSString*)src shifts:(NSInteger)shifts dest:(NSString*)dest;
-(void)band:(NSString*)src1 src2:(NSString*)src2 dest:(NSString*)dest;
-(void)print;

@end
/*********************************/
@implementation Circuitboard 

NSMutableDictionary *board;

-(Circuitboard*)init {
    if (self = [super init]) {
        board =  [[NSMutableDictionary alloc] initWithCapacity:1];
    }
    return self;
}

-(void)addToDict:(NSString*)key value:(NSInteger)value {
    NSNumber* valObj= [NSNumber numberWithInt:value];
    [board setObject:valObj forKey:key];
}

-(NSInteger)getRegister:(NSString*)name {
    NSNumber* retVal = board[name];
    return [retVal integerValue];
}

-(void)rshift:(NSString*)src shifts:(NSInteger)shifts dest:(NSString*)dest {
    NSLog(@"running RSHIFT case: src: %@, shifts: %ld, dest: %@", src, shifts, dest);
    NSNumber* val = [board objectForKey:src];
    NSLog(@"retrieved %@", val);
    NSInteger retVal = 0;
    if (val == nil) {
        retVal = 0;
    } else {
        retVal = [val integerValue] >> shifts;
    }
    NSLog(@"retVal: %ld", retVal);
    [self addToDict:dest value:retVal];
}

-(void)lshift:(NSString*)src shifts:(NSInteger)shifts dest:(NSString*)dest {
    NSLog(@"running LSHIFT case: src: %@, shifts: %ld, dest: %@", src, shifts, dest);
    NSNumber* val = [board objectForKey:src];
    NSLog(@"retrieved %@", val);
    NSInteger retVal = 0;
    if (val == nil) {
        retVal = 0;
    } else {
        retVal = [val integerValue] << shifts;
    }
    NSLog(@"retVal: %ld", retVal);
    [self addToDict:dest value:retVal];
}

-(void)band:(NSString*)src1 src2:(NSString*)src2 dest:(NSString*)dest {
    NSLog(@"running bAnd case: src1: %@ src2: %@ dest: %@", src1, src2, dest);
    NSNumber* src1val = [board objectForKey:src1];
    NSNumber* src2val = [board objectForKey:src1];
    NSInteger retVal = [src1val integerValue] & [src2val integerValue];
    NSLog(@"retVal: %ld", retVal);
    [self addToDict:dest value:retVal];
}


-(void)print {
    NSLog(@"board: %@", board);
}

-(BOOL)isNumeric:(NSString*)str {
    // NSLog(@"testing: %@", str);
    NSUInteger len = [str length];
    for (int i = 0; i < len; i++) {
        unichar ch = [str characterAtIndex:i];
        // NSLog(@"testing %C", ch);
        switch(ch) {
            case '0':
                break;
            case '1':
                break;
            case '2':
                break;
            case '3':
                break;
            case '4':
                break;
            case '5':
                break;
            case '6':
                break;
            case '7':
                break;
            case '8':
                break;
            case '9':
                break;
            default:
                return NO;
        }
    }
    return YES;
}
@end
/*********************************/

int main() {
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
    NSString* filePath = @"input.txt";
    NSString* fileContent = [NSString stringWithContentsOfFile:@"input.txt"
                            encoding:NSUTF8StringEncoding error:nil];
    NSArray* lines = [fileContent componentsSeparatedByString:(NSString *)@"\n"];
    Circuitboard *circuitboard = [[Circuitboard alloc] init];
    for (NSString* line in lines) {
        NSLog(@"*** line: %@", line);
        NSArray* words = [line componentsSeparatedByString:(NSString *)@" "];
        if ([words[1] isEqualTo:@"RSHIFT"]) {
            NSString* src = words[0];
            int shiftAmount = [words[2] integerValue];
            NSString* dest = words[4];
            // NSLog(@"running RSHIFT case: src: %@, shiftAmount: %d, dest: %@", src, shiftAmount, dest);
            [circuitboard rshift:src shifts:shiftAmount dest:dest];
        } else if ([words[1] isEqualTo:@"LSHIFT"]) {
            NSString* src = words[0];
            int shiftAmount = [words[2] integerValue];
            NSString* dest = words[4];
            [circuitboard lshift:src shifts:shiftAmount dest:dest];
       } else if ([words[1] isEqualTo:@"AND"]) {
            NSString* src1 = words[0];
            NSString* src2 = words[2];
            NSString* dest = words[4];
            [circuitboard band:src1 src2:src2 dest:dest];
        }
 

        else if ([circuitboard isNumeric:words[0]]) {
            // NSLog(@"running numeric case");
        } else {
            // NSLog(@"running the default case");
        }
        
    }
    [circuitboard print];

    [pool drain];
    return 0;
}