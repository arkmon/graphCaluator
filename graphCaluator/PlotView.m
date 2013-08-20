#import "PlotView.h"


@implementation PlotView

@synthesize dataSource = _dataSource;

@synthesize scale = _scale;
@synthesize origin = _origin;

- (void)setScale:(CGFloat)scale
{
    if (_scale == scale)
        return;
    
    _scale = scale;
    
    [self setNeedsDisplay];
    
}

- (void)setOrigin:(CGPoint)origin
{
    if ((_origin.x == origin.x) && (_origin.y == origin.y))
        return;
    
    _origin = origin;
    
    [self setNeedsDisplay];
}

#define INITIAL_SCALE 50.0
#define kGraphHeight 300
#define kDefaultGraphWidth 900
#define kOffsetX 10
#define kStepX 10
#define kGraphBottom 728
#define kGraphTop 0

#define kStepY 10
#define kOffsetY 10

- (void)awakeFromNib
{
    NSLog(@"PlotView awakeFromNib");
    
    [super awakeFromNib];
    
    self.scale = INITIAL_SCALE;
    self.bounds = self.frame;
    self.origin = self.center;
    self.contentMode = UIViewContentModeRedraw;
    self.contentScaleFactor = 2.0;
}

- (double)mappedXValueAtPoint:(CGFloat)point
{
    return (double)((-1.0)*(self.origin.x - point)/self.scale);
}

- (CGFloat)pointForMappedYValue:(double)value
{
    return (CGFloat)(rint(self.origin.y-value*self.scale));
}

- (void)drawRect:(CGRect)rect
{
    if (!self.dataSource)
        return;
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    UIGraphicsPushContext(context);
    
    [AxesDrawer drawAxesInRect:self.bounds 
                 originAtPoint:self.origin
                         scale:self.scale];
        
    // Graph drawing code. 
    
    enum {
        ON_THE_CHART,OFF_THE_CHART        
    } state;
        
    [[UIColor redColor] set];
    
    double value;
    
    state = OFF_THE_CHART;
    
    CGContextBeginPath(context);
    CGContextSetLineJoin(context, kCGLineJoinRound);
    
    CGContextMoveToPoint(context, 0, self.origin.y);

    for (CGFloat x=0.0; x<=self.bounds.size.width; x+=1.0)
    { // Two-state finite state machine is used to draw the curve.
        value=[self.dataSource valueWhenXEquals:[self mappedXValueAtPoint:x]];
        
        if ((value == INFINITY) ||
            ([self pointForMappedYValue:value]>self.bounds.size.height))
        {
            if (state == ON_THE_CHART)
            {
                CGContextClosePath(context);   
                CGContextStrokePath(context);
            }
            
            state = OFF_THE_CHART;
        }
        else
        {
            if (state == OFF_THE_CHART)
                CGContextBeginPath(context);
            else
                CGContextAddLineToPoint(context, x, 
                                        [self pointForMappedYValue:value]);
            
            CGContextMoveToPoint(context, (CGFloat)x, 
                                 [self pointForMappedYValue:value]);
            
            state = ON_THE_CHART;            
        }
        
    }
    
    CGContextStrokePath(context);
        
    UIGraphicsPopContext();
   // CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetLineWidth(context, 0.6);
    CGContextSetStrokeColorWithColor(context, [[UIColor lightGrayColor] CGColor]);
    // How many lines?
    int howMany = (kDefaultGraphWidth - kOffsetX) / kStepX;
    // Here the lines go
    for (int i = 0; i < howMany; i++)
    {
        CGContextMoveToPoint(context, kOffsetX + i * kStepX, kGraphTop);
        CGContextAddLineToPoint(context, kOffsetX + i * kStepX, kGraphBottom);
    }
    
    int howManyHorizontal = (kGraphBottom - kGraphTop - kOffsetY) / kStepY;
    for (int i = 0; i <= howManyHorizontal; i++)
    {
        CGContextMoveToPoint(context, kOffsetX, kGraphBottom - kOffsetY - i * kStepY);
        CGContextAddLineToPoint(context, kDefaultGraphWidth, kGraphBottom - kOffsetY - i * kStepY);
    }
    CGContextStrokePath(context);
    
    CGContextSetRGBFillColor(context, 0, 0, 1, 0.5);
}


@end
