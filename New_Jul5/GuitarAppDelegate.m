//
//  GuitarAppDelegate.m
//  Jul5
//
//  Created by Axel Nunez on 7/12/12.
//  Copyright (c) 2012 CUNY. All rights reserved.
//

#import "GuitarAppDelegate.h"
#import "View.h"
#import "Eddy.h"
#import "Ate.h"
#import "Dynamite.h"
#import "Good.h"
#import "Bye.h"
#import "Ed.h"

@implementation GuitarAppDelegate

@synthesize window = _window;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    NSBundle *bundle = [NSBundle mainBundle];
	NSLog(@"bundle.bundlePath == \"%@\"", bundle.bundlePath);	
    
	NSString *filename = [bundle pathForResource: @"6" ofType: @"m4a"];
	NSLog(@"filename == \"%@\"", filename);
    
	NSURL *url = [NSURL fileURLWithPath: filename isDirectory: NO];
	NSLog(@"url == \"%@\"", url);
    
	OSStatus error = AudioServicesCreateSystemSoundID((__bridge CFURLRef)url, &sid);
	if (error != kAudioServicesNoError) {
		NSLog(@"AudioServicesCreateSystemSoundID error == %ld", error);
	}
    
    
    
    UIScreen *screen = [UIScreen mainScreen];
    view = [[View alloc] initWithFrame:screen.applicationFrame];
    self.window = [[UIWindow alloc] initWithFrame:screen.bounds];
    
    CGRect eddyf = CGRectMake(77, 0, 10, screen.bounds.size.height);
    eddy = [[Eddy alloc] initWithFrame: eddyf];
    
    CGRect atef = CGRectMake(107, 0, 10, screen.bounds.size.height);
    ate = [[Ate alloc] initWithFrame: atef];
    
    CGRect dynf = CGRectMake(147, 0, 10, screen.bounds.size.height);
    dyno = [[Dynamite alloc] initWithFrame: dynf];
    
    CGRect goodf = CGRectMake(177, 0, 10, screen.bounds.size.height);
    good = [[Good alloc] initWithFrame: goodf];
    
    CGRect byef = CGRectMake(217, 0, 10, screen.bounds.size.height);
    bye = [[Bye alloc] initWithFrame: byef];
    
    CGRect edf = CGRectMake(247, 0, 10, screen.bounds.size.height);
    ed = [[Ed alloc] initWithFrame: edf];


    CGRect label = CGRectMake(0, 40, 400, 40);
    directions = [[UILabel alloc] initWithFrame:label];
    
    directions.text = @"Swipe from middle of string to play sound.";
    directions.backgroundColor = [UIColor yellowColor];
    
  //  [self.window makeKeyAndVisible];
    [self.window addSubview:view];
    
    [self.window addSubview: eddy];
    [self.window addSubview: ate];
    [self.window addSubview: dyno];
    [self.window addSubview: good];
    [self.window addSubview: bye];
    [self.window addSubview: ed];
    [self.window addSubview: directions];

    // Override point for customization after application launch.
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)touchUpInside:(id)sender{
    
	NSLog(@"The \"%@\" button was pressed.",
		  [sender titleForState: UIControlStateNormal]);
    
	//AudioServicesPlaySystemSound(kSystemSoundID_Vibrate);
	AudioServicesPlaySystemSound(sid);
}


- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}



- (void) dealloc {
	OSStatus error = AudioServicesDisposeSystemSoundID(sid);
	if (error != kAudioServicesNoError) {
		NSLog(@"AudioServicesDisposeSystemSoundID error == %ld", error);
	}
}

@end
