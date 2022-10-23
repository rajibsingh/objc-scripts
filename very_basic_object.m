#import <Foundation/Foundation.h>

@interface Person:NSObject
    @property NSString *name;

    -(Person*)init;
    -(Person*)init:(NSString*)name;
    +(void)sampleMethod;

@end

@implementation Person

    -(Person*) init {
        if (self = [super init]) {
            self.name = @"default";
            return self;
        }
    }

    -(Person*) init:(NSString*)name {
        NSLog(@"init received with name: %@", name);
        if (self = [super init]) {
            if (name != nil) {
                self.name = name;
            }
            else {
                self.name = @"default";
            }
        }
        return self;
    }

    +(void)sampleMethod {
        NSLog(@"Hello, World! \n");
    }

@end

int main() {
    Person *person = [[Person alloc]init:@"Rajib"];
    Person *person2 = [[Person alloc]init];
    Person *person3 = [[Person alloc]init];
    [Person sampleMethod];
    NSLog(@"%@", person.name);
    person.name = @"Raj";
    NSLog(@"%@", person.name);
    NSLog(@"%@", person2.name);
    NSLog(@"%@", person3.name);
    // NSString *resDir = [[NSBundle mainBundle] resourcePath];
    // printf("%s", resDir);
    return 0;
}