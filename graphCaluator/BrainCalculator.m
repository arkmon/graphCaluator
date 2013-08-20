//
//  BrainCalculator.m
//  graphCaluator
//
//  Created by Damir Okic on 26/03/2013.
//  Copyright (c) 2013 OkicDowejko. All rights reserved.
//

#import "BrainCalculator.h"
#import "PortraitViewController.h"

@interface BrainCalculator()

@end

@implementation BrainCalculator


- (void)performTwoOperandOperation {  //two operand operations e.g. +,-,*,/
	if ([@"+" isEqual:_OperationEntered]) {
        _OperationEntered = @"";
		_operand = _operand2 + _operand;
	} else if ([@"*" isEqual:_OperationEntered]) {
        _OperationEntered = @"";
		_operand = _operand2 * _operand;
	} else if ([@"-" isEqual:_OperationEntered]) {
        _OperationEntered = @"";
        _operand = _operand2 - _operand;
		
	} else if ([@"/" isEqual:_OperationEntered]) {
        _OperationEntered = @"";
        _operand = _operand2 / _operand;
		
	}
    else {
		_waitingForOperand = YES;
	}
}



- (double) performOperation:(NSString *)operation

{
    
    if ([@"+/-" isEqualToString:operation]) {
        _OperationEntered = @"";
		if (_operand != 0) {
			_operand = -_operand;
		}
	}
    
    else  if ([operation isEqualToString:@"√x"]) {
		_operand = sqrt(_operand);
	}
    
    
	else if ([@"asine" isEqualToString:operation]) {
        
        if (_radian){
        _operand = asin(_operand);
        }
else{
_operand = (sin(_operand) * 180)/ M_PI ;
}
     
			}
	
    
    
	else if ([@"acos" isEqualToString:operation]) {
        
        if (_radian){
            
     _operand = acos(_operand);
        
        }
            
            else{
                 _operand = (acos(_operand )* 180 )/ M_PI ;
            
            }
		
	}
    
    
else if ([@"atan" isEqualToString:operation]) {
    
    if (_radian){
          _operand = atan(_operand);
    
    }
    
    else {
     _operand = (atan(_operand) * 180 )/ M_PI;
    
    }
		
	}
    
    
	else if ([@"x²" isEqualToString:operation]) {
		_operand = pow(_operand , 2);
	}
    
    else if ([@"sine" isEqualToString:operation]) {
        _OperationEntered = @"";
		if (_radian){
           
                _operand = sin(_operand);
            }
		else {//Degree
                      
      _operand = sin(_operand * M_PI / 180);
            
        }
	}

	else if ([@"cos" isEqualToString:operation]) {
        _OperationEntered = @"";
        
        if (_radian){
            _operand = cos(_operand);
			
		}
        else  {//Degree
            
                _operand = cos(_operand * M_PI / 180);
            
            
		}
	}

	else if ([@"tan" isEqualToString:operation]) {
        _OperationEntered = @"";
        
		if (_radian){
            
                _operand = tan(_operand);
            
		}else {//Degree
            
                _operand = tan(_operand * M_PI / 180);
            
        }
	}
    
	else if ([@"1/x" isEqualToString:operation]) {
		_operand = 1/_operand;
	}
    
    
    
    else if ([@"ln" isEqualToString:operation]) {
        _operand = log(_operand);
    }
    
    else if ([@"log₁₀" isEqualToString:operation]) {
        _operand = log10(_operand);
    }
	
	//clear
	else if ([@"C" isEqual:operation]){
        
        _operand = 0;
		_OperationEntered = @"";
		_operand2 = 0;
	}
    
    else if ([@"AC" isEqual:operation]){
		_operand = 0;
		_OperationEntered = @"";
		_operand2 = 0;
        
	}
	
	else if ([@"=" isEqual:operation]){
        
        if (!_waitingForOperand){
            
            [self performTwoOperandOperation];
            
			_waitingForOperation = YES;
		}
	}
	
    else {
        
		_operand2 = _operand;
		_OperationEntered = operation;
	}
	
	return _operand;
    
    
    
}




@end
