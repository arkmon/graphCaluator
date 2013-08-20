//
//  GCMasterViewController.h
//  graphCaluator
//
//  Created by Damir Okic on 26/03/2013.
//  Copyright (c) 2013 OkicDowejko. All rights reserved.
//

#import <UIKit/UIKit.h>

@class GCDetailViewController;

@interface GCMasterViewController : UITableViewController

@property (strong, nonatomic) GCDetailViewController *detailViewController;
@property (strong, nonatomic) IBOutlet UITableView *landscapeMaster;

@end
