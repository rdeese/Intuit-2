//
//  IT1SquaresView.m
//  Intuit 2
//
//  Created by Rupert Deese on 2/10/13.
//  Copyright (c) 2013 Rupert Deese. All rights reserved.
//

#import "IT1SquaresView.h"

@implementation IT1SquaresView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGRect bounds = [self bounds];
    CGRect rectangle = CGRectMake(0,0, 30, 30);
    
    for (int i = 0; i < 50; i++) {
        CGContextSaveGState(context);
        CGContextSetRGBFillColor(context, arc4random()%256/255.0,
                                 arc4random()%256/255.0,
                                 arc4random()%256/255.0,
                                 arc4random()%256/255.0);
        
        CGContextTranslateCTM(context, (double) (arc4random()%(int)bounds.size.width),
                              (double) (arc4random()%(int)bounds.size.height));
        
        CGContextScaleCTM(context, (double) (arc4random()%20), (double) (arc4random()%20));
        
        CGContextRotateCTM(context, (double) (arc4random()%360));
        
        CGContextAddRect(context, rectangle);
        CGContextFillPath(context);
        CGContextRestoreGState(context);
    }
}


@end
