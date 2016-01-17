#import <mach/mach_time.h>

static inline BOOL IsEmpty(id thing) {
    return thing == nil || [thing isEqual:[NSNull null]]
    || ([thing respondsToSelector:@selector(length)]
        && [(NSData *)thing length] == 0)
    || ([thing respondsToSelector:@selector(count)]
        && [(NSArray *)thing count] == 0);
}

static inline NSString *StringFromObject(id object) {
    if (object == nil || [object isEqual:[NSNull null]]) {
        return @"";
    } else if ([object isKindOfClass:[NSString class]]) {
        return object;
    } else if ([object respondsToSelector:@selector(stringValue)]){
        return [object stringValue];
    } else {
        return [object description];
    }
}

#ifdef DEBUG
#   define THLog(fmt, ...) NSLog((@"%s [Line %d] " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__);
#else
#   define THLog(...)
#endif

#define RGBCOLOR(r, g, b)        [UIColor colorWithRed:(r) / 255.0f green:(g) / 255.0f blue:(b) / 255.0f alpha:1]
#define RGBACOLOR(r, g, b, a)    [UIColor colorWithRed:(r) / 255.0f green:(g) / 255.0f blue:(b) / 255.0f alpha:(a)]

#define SCREEN_WIDTH  [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height

#define IS_IPHONE4 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 960), [[UIScreen mainScreen] currentMode].size) : NO)
#define IS_IPHONE5 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 1136), [[UIScreen mainScreen] currentMode].size) : NO)

#pragma mark -
#pragma mark NSNumber

#define NUM_INT(int) [NSNumber numberWithInt:int]
#define NUM_INTEGER(integer) [NSNumber numberWithInteger:integer]
#define NUM_FLOAT(float) [NSNumber numberWithFloat:float]
#define NUM_BOOL(bool) [NSNumber numberWithBool:bool]

#define STR_INTEGER(integer) [NSString stringWithFormat:@"%zd", integer]

#pragma mark -
#pragma mark Blocks

#define BLOCK_SAFE_RUN(block, ...) block ? block(__VA_ARGS__) : nil

#pragma mark -
#pragma mark Frame Geometry

#define CENTER_VERTICALLY(parent,child) floor((parent.frame.size.height - child.frame.size.height) / 2)
#define CENTER_HORIZONTALLY(parent,child) floor((parent.frame.size.width - child.frame.size.width) / 2)

#define CENTER_IN_PARENT(parent,childWidth,childHeight) CGPointMake(floor((parent.frame.size.width - childWidth) / 2),floor((parent.frame.size.height - childHeight) / 2))
#define CENTER_IN_PARENT_X(parent,childWidth) floor((parent.frame.size.width - childWidth) / 2)
#define CENTER_IN_PARENT_Y(parent,childHeight) floor((parent.frame.size.height - childHeight) / 2)

#define WIDTH(view) view.frame.size.width
#define HEIGHT(view) view.frame.size.height
#define X(view) view.frame.origin.x
#define Y(view) view.frame.origin.y
#define LEFT(view) view.frame.origin.x
#define TOP(view) view.frame.origin.y
#define BOTTOM(view) (view.frame.origin.y + view.frame.size.height)
#define RIGHT(view) (view.frame.origin.x + view.frame.size.width)

#define POINTERIZE(x) ((__typeof__(x) []){ x })
#define NSVALUE(x) [NSValue valueWithBytes: POINTERIZE(x) objCType: @encode(__typeof__(x))]

// GCD
#define BACK(block) dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), block)
#define MAIN(block) dispatch_async(dispatch_get_main_queue(),block)

#pragma mark -
#pragma mark iOS Version

#define IOS_VERSION_EQUAL_TO(v)                  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedSame)
#define IOS_VERSION_GREATER_THAN(v)              ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedDescending)
#define IOS_VERSION_GREATER_THAN_OR_EQUAL_TO(v)  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedAscending)
#define IOS_VERSION_LESS_THAN(v)                 ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedAscending)
#define IOS_VERSION_LESS_THAN_OR_EQUAL_TO(v)     ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedDescending)