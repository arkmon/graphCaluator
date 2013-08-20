//
//  GCDetailViewController.h
//  graphCaluator
//
//  Created by Damir Okic on 26/03/2013.
//  Copyright (c) 2013 OkicDowejko. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GCDetailViewController : UIViewController <UISplitViewControllerDelegate>

@property (strong, nonatomic) id detailItem;

@property (strong, nonatomic) IBOutlet UIView *landscapeDetail;
@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;

@end
