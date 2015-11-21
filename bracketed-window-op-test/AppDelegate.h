//
//  AppDelegate.h
//  bracketed-window-op-test
//
//  Created by David Caldwell on 11/21/15.
//  Copyright © 2015 David Caldwell. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "BracketedTest.h"

@interface AppDelegate : NSObject <NSApplicationDelegate>
{
    IBOutlet BracketedTest *testView;
}

- (IBAction)doClick:(id)sender;

@end

