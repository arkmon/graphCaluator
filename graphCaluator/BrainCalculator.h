//
//  BrainCalculator.h
//  graphCaluator
//
//  Created by Damir Okic on 26/03/2013.
//  Copyright (c) 2013 OkicDowejko. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BrainCalculator : NSObject

@property (nonatomic)double operand,operand2;
@property (nonatomic,weak)NSString *OperationEntered;
@property BOOL waitingForOperation;
@property BOOL waitingForOperand;
@property (nonatomic) BOOL radian;
@property (nonatomic) BOOL secondFunction;


- (double) performOperation: (NSString *) operation;

@end
