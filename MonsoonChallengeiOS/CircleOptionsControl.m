//
//  CircleOptionsControl.m
//  MonsoonChallengeiOS
//
//  Created by Piotr on 10/11/14.
//  Copyright (c) 2014 pz. All rights reserved.
//

#import "CircleOptionsControl.h"
#import "UtilFunctions.h"
#import "CGDrawing.h"

#define kSpacingBetweenArcAndCircle (10)
#define kSpacingBetweenArcAndBounds (5)

#define kColorUnselectedArc RGB(85,0,41)
#define kColorSelectedArc RGB(255,105,121)

#define kAnglePaddingBetweenEachArc (10)
#define kArcLineWidth (2.0)

@implementation CircleOptionsControl
{
    UILabel *_lblOption;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super initWithCoder:aDecoder])
    {
        [self commonInit];
       
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame])
    {
        [self commonInit];
    }
    return self;
}

- (void)commonInit
{
    UILabel *lbl = [UILabel new];
    lbl.textColor = [UIColor whiteColor];
    lbl.frame = self.bounds;
    lbl.textAlignment = NSTextAlignmentCenter;
    [self addSubview:lbl];
    _lblOption = lbl;
    
    [self addTarget:self action:@selector(onTap) forControlEvents:UIControlEventTouchDown];

    self.backgroundColor = [UIColor clearColor];
}

- (void)setOptions:(NSArray *)options
{
    _options = options;
    _lblOption.text = options[0];
    _selectedIndex = 0;
    [self setNeedsDisplay];
}

- (NSString *)selectedOption
{
    return _options[_selectedIndex];
}

- (void)drawRect:(CGRect)rect
{
    [super drawRect:rect];
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    [self drawCircleInTheMiddle:ctx];
    [self drawArcs:ctx];
}

- (void)drawCircleInTheMiddle:(CGContextRef)ctx
{
    CGRect frameForCircle = self.bounds;
    frameForCircle.origin.x += kSpacingBetweenArcAndCircle;
    frameForCircle.size.width -= kSpacingBetweenArcAndCircle * 2;
    frameForCircle.origin.y += kSpacingBetweenArcAndCircle;
    frameForCircle.size.height -= kSpacingBetweenArcAndCircle * 2;
    
    CGContextSetAlpha(ctx, 0.25f);
    
    CGContextFillEllipseInRect(ctx, frameForCircle);
    CGContextSetAlpha(ctx, 1.0f);
}

- (void)drawArcs:(CGContextRef)ctx
{
    int numberOfArcs =  _options.count;
    float arcAngle = 360.0 / numberOfArcs;
    float startingAngle = kAnglePaddingBetweenEachArc;
    
    NSUInteger selectedIndex = self.selectedIndex;
    
    for (int i = 0; i < numberOfArcs; i++)
    {
        CGContextSetStrokeColorWithColor(ctx, i == selectedIndex?  kColorSelectedArc.CGColor : kColorUnselectedArc.CGColor);
        
        [CGDrawing
            drawUnfilledArcInContext:ctx
            center:self.middlePoint
            radius:self.frame.size.width/2 - kSpacingBetweenArcAndBounds
            lineWidth:kArcLineWidth
            fromAngleFromNorth:startingAngle
            toAngleFromNorth:startingAngle + arcAngle - kAnglePaddingBetweenEachArc*2
         ];
        startingAngle += arcAngle;
    }
}

- (CGPoint)middlePoint
{
    return CGPointMake(self.bounds.size.width * 0.5, self.bounds.size.height * 0.5);
}

- (void)onTap
{
    [self selectNextOption];
}

- (void)selectNextOption
{
    _selectedIndex++;
    if (_selectedIndex == _options.count)
        _selectedIndex = 0;
    self.selectedIndex = _selectedIndex;
}

- (void)setSelectedIndex:(NSUInteger)selectedIndex
{
    _selectedIndex = selectedIndex % _options.count;
    _lblOption.text = _options[_selectedIndex];
    [self setNeedsDisplay];
}

- (void)shuffle
{
    int newIndex = arc4random_uniform(_options.count);
    self.selectedIndex = newIndex;
}

@end
