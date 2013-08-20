//
//  PortraitViewController.m
//  graphCaluator
//
//  Created by Damir Okic on 26/03/2013.
//  Copyright (c) 2013 OkicDowejko. All rights reserved.
//

#import "PortraitViewController.h"
#import "BrainCalculator.h"

@interface PortraitViewController ()
@property (nonatomic) BOOL userIsInTheMiddleOfEnteringNumber;
@property (nonatomic, strong) BrainCalculator *brain;

@end

@implementation PortraitViewController


@synthesize display;
@synthesize brain;

- (BrainCalculator *)brain
{
    if (!brain) {
        
        brain= [[BrainCalculator alloc] init];
        self.brain.radian = YES;
        self.brain.secondFunction= NO;
        
    }
    return brain;
    
}


- (void)clearDisplay
{

display.text = @"Error";
}

- (IBAction)digitPressed:(id)sender {
    
    
    NSString *digit = [sender currentTitle];
    if ([@"π" isEqual:digit]){
        
        digit=@"3.14159265";
        _userIsInTheMiddleOfEnteringNumber = NO;
        
    }
    
    else if ([@"0" isEqual:digit] && [@"0" isEqual:display.text]){
		_userIsInTheMiddleOfEnteringNumber = NO;
       		return;
	}
    
    if (self.userIsInTheMiddleOfEnteringNumber){
        
        if (![@"." isEqual:digit] || ([@"." isEqual:digit] &&
                                      [display.text rangeOfString:@"."].location == NSNotFound)){
            
            
            self.display.text = [self.display.text stringByAppendingString:digit];
            
        }
    }
    else {
        self.display.text = digit;
         self.userIsInTheMiddleOfEnteringNumber =YES;
    }
    
    
}

- (IBAction)operationPressed:(id)sender {
    
    NSString *operation = [sender currentTitle];
    
    
    
    if (self.userIsInTheMiddleOfEnteringNumber || [@"=" isEqual:operation]){
        self.brain.operand = display.text.doubleValue;
		self.userIsInTheMiddleOfEnteringNumber = NO;
        
            }
    
    double result = [self.brain performOperation:operation];
    
    //check if result is not a number or is infinite number
    
    if ( isnan(result) || isinf(result) ) {
		display.text = @"Error";
        
	}
    
    else {
		if ([@"=" isEqual:operation]){
			_operatorDisplay.text = @"";
            
		}
        else {
			_operatorDisplay.text = self.brain.OperationEntered;
		}
        
        self.display.text = [NSString stringWithFormat:@"%g", result];
        
        
    }
    
}

- (IBAction)specialFunction {
    
    self.brain.secondFunction =!self.brain.secondFunction;
    self.special.selected = !_special.selected;
    
    if (self.special.selected) {
        [NSOperationQueue.mainQueue addOperationWithBlock:^{ self.special.highlighted = YES; }];
        [self.buttonSine setTitle: @"asine" forState: UIControlStateNormal];
       [self.buttonCosine setTitle: @"acos" forState: UIControlStateNormal];
        [self.buttonTangent setTitle: @"atan" forState: UIControlStateNormal];
    }
    else
    {
        [NSOperationQueue.mainQueue addOperationWithBlock:^{ self.special.highlighted = NO; }];
        
        [self.buttonSine setTitle: @"sine" forState: UIControlStateNormal];
        [self.buttonCosine setTitle: @"cos" forState: UIControlStateNormal];
        [self.buttonTangent setTitle: @"tan" forState: UIControlStateNormal];
    
    }
}

- (IBAction)radianOrDegreeSwitch {
    self.brain.radian =!self.brain.radian;

}


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    self.display.font = [UIFont fontWithName:@"DBLCDTempBlack" size:100];
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
