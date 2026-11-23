#import <UIKit/UIKit.h>

__attribute__((constructor))
static void HelloWorldInit(void) {
    NSLog(@"[HelloWorld] dylib loaded into %@ (pid=%d)",
          [[NSProcessInfo processInfo] processName], getpid());
}

%hook SpringBoard
- (void)applicationDidFinishLaunching:(id)application {
    %orig;
    NSLog(@"[HelloWorld] hook fired");
}
%end
