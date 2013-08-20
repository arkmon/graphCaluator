//
//  PortraitViewController.h
//  graphCaluator
//
//  Created by Damir Okic on 26/03/2013.
//  Copyright (c) 2013 OkicDowejko. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PortraitViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *display;
@property (weak, nonatomic) IBOutlet UILabel *operatorDisplay;
@property (weak, nonatomic) IBOutlet UIButton *special;
@property (weak, nonatomic) IBOutlet UIButton *buttonSine;
@property (weak, nonatomic) IBOutlet UIButton *buttonCosine;
@property (weak, nonatomic) IBOutlet UIButton *buttonTangent;

@end
