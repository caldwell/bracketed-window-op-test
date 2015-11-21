//
//  BracketedTest.m
//  bracketed-window-op-test
//
//  Created by David Caldwell on 11/21/15.
//  Copyright © 2015 David Caldwell. All rights reserved.
//

#import "BracketedTest.h"

@implementation BracketedTest

- (void)drawRect:(NSRect)dirtyRect {
    [super drawRect:dirtyRect];
    
    // Drawing code here.
    [[NSColor blackColor] set];
    NSPoint topright = NSMakePoint(0,0);
    NSPoint bottleft = NSMakePoint(-self.bounds.size.width,self.bounds.size.height);
    for (; bottleft.x < self.bounds.size.width; topright.x+=20, bottleft.x+=20)
        [NSBezierPath strokeLineFromPoint:topright toPoint:bottleft];
}

- (void)test {
    NSRect r, surr;
    NSPoint dim = NSMakePoint (128, 128);
    
    r = [self bounds];
    r.origin.x += (r.size.width - dim.x) / 2;
    r.origin.y += (r.size.height - dim.y) / 2;
    r.size.width = dim.x;
    r.size.height = dim.y;
    surr = NSInsetRect (r, -2, -2);

    NSGraphicsContext *ctx;
    [NSGraphicsContext setCurrentContext: ctx = [[self window] graphicsContext]];
    [[self window] cacheImageInRect: [self convertRect: surr toView:nil]];
    [[NSColor blackColor] set];
    [NSBezierPath fillRect: r];
    [[self window] flushWindow];
    [[self window] restoreCachedImage];
    [[self window] flushWindow];
}

@end
