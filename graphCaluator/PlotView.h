#import <UIKit/UIKit.h>

#import "AxesDrawer.h"

@protocol PlotViewDataSource
@required
- (double)valueWhenXEquals:(double)x;
@end

@interface PlotView : UIView {
    
}

@property (nonatomic,weak) IBOutlet id <PlotViewDataSource> dataSource;

@property (nonatomic,assign) CGFloat scale;
@property (nonatomic,assign) CGPoint origin;

@end
