#import <Cocoa/Cocoa.h>

int main(int argc, char *argv[]) {
  NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
  [NSApplication sharedApplication];
  int style = NSClosableWindowMask | NSResizableWindowMask |
    NSTexturedBackgroundWindowMask | NSTitledWindowMask | NSMiniaturizableWindowMask;
  NSWindow *win = [[NSWindow alloc] initWithContentRect:NSMakeRect(50, 50, 600, 400)
                                    styleMask:style
                                    backing:NSBackingStoreBuffered
                                    defer:NO];
  NSView *view = [[NSView alloc] initWithFrame:NSMakeRect(0, 0, 100, 200)];
  [[win contentView] addSubview:view];
  [win makeKeyAndOrderFront:win];
  [NSApp run];

  [pool release];
}
