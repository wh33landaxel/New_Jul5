//
//  Ed.m
//  New_Jul5
//
//  Created by Axel Nunez on 7/17/12.
//  Copyright (c) 2012 CUNY. All rights reserved.
//

#import "Ed.h"

@implementation Ed

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor blueColor];
        
        
        UISwipeGestureRecognizer *recognizer = [[UISwipeGestureRecognizer alloc]
                                                initWithTarget: self action: @selector(swipe:)
                                                ];
		recognizer.direction = UISwipeGestureRecognizerDirectionRight;
		[self addGestureRecognizer: recognizer];
        
		recognizer = [[UISwipeGestureRecognizer alloc]
                      initWithTarget: self action: @selector(swipe:)
                      ];
		recognizer.direction = UISwipeGestureRecognizerDirectionLeft;
		[self addGestureRecognizer: recognizer];
        
		recognizer = [[UISwipeGestureRecognizer alloc]
                      initWithTarget: self action: @selector(swipe:)
                      ];
		recognizer.direction = UISwipeGestureRecognizerDirectionUp;
		[self addGestureRecognizer: recognizer];
        
		recognizer = [[UISwipeGestureRecognizer alloc]
                      initWithTarget: self action: @selector(swipe:)
                      ];
		recognizer.direction = UISwipeGestureRecognizerDirectionDown;
		[self addGestureRecognizer: recognizer];
		
        // Initialization code
    }
    return self;
}

- (void) swipe: (UISwipeGestureRecognizer *) recognizer {
	CGPoint p = [recognizer locationInView: self];
    
	NSString *direction = @"unknown";
	if (recognizer.direction == UISwipeGestureRecognizerDirectionRight) {
        direction = @"←";
        self.backgroundColor = [UIColor whiteColor];
        NSLog(@"hello");
        
        NSBundle *bundle = [NSBundle mainBundle];
        if (bundle == nil) {
            NSLog(@"could not get the main bundle");
            
        }
        
        //The path is the filename.
        NSString *path =
        [bundle pathForResource: @"1" ofType: @"m4a"];
        if (path == nil) {
            NSLog(@"could not get the path");
            
        }
        NSLog(@"path == \"%@\"", path);
        
        NSURL *url = [NSURL fileURLWithPath: path isDirectory: NO];
        NSLog(@"url == \"%@\"", url);
        
        NSError *error = nil;
        player = [[AVAudioPlayer alloc] initWithContentsOfURL: url error: &error];
        if (player == nil) {
            NSLog(@"error == %@", error);
            
        }
        
        player.volume = 1.0;		//the default
        player.numberOfLoops = 0;	//negative number for infinite loop
        /*
         NSLog(@"player.numberOfChannels == %u",
         player.numberOfChannels); //mono or stereo
         */
        
        if (![player prepareToPlay]) {
            NSLog(@"could not prepare to play");
        }
        
        if (![player play]) {
            NSLog(@"could not play");
        }
        
        
        
        
        
        //  player.play;
        
	} else if (recognizer.direction == UISwipeGestureRecognizerDirectionLeft) {
		direction = @"←";
	} else if (recognizer.direction == UISwipeGestureRecognizerDirectionUp) {
		;
	} else if (recognizer.direction == UISwipeGestureRecognizerDirectionDown) {
		;
	}
    
    
    
}
/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect
 {
 // Drawing code
 }
 */

@end
