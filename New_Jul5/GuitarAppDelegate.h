//
//  GuitarAppDelegate.h
//  Jul5
//
//  Created by Axel Nunez on 7/12/12.
//  Copyright (c) 2012 CUNY. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AudioToolbox/AudioToolbox.h>
@class View;
@class Eddy;
@class Ate;
@class Dynamite;
@class Good;
@class Bye;
@class Ed;
@interface GuitarAppDelegate : UIResponder <UIApplicationDelegate>{
    View *view;
    Eddy *eddy;
    Ate *ate;
    Dynamite *dyno;
    Good *good;
    Bye *bye;
    Ed *ed;
    UIWindow *_window;
    SystemSoundID sid;
    UILabel *directions;
}

- (void) touchUpInside: (id) sender;

@property (strong, nonatomic) UIWindow *window;


@end
