//
//  FGContactView.h
//  Fire Ground Assist
//
//  Created by Charlie Jacobson on 3/13/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FGContactView : UIView

@property (nonatomic) BOOL isExpanded; 

@property (retain, nonatomic) UILabel* position;
@property (retain, nonatomic) UILabel* name;
@property (retain, nonatomic) UILabel* mainNumberType;
@property (retain, nonatomic) UITextView* mainNumber; 
 

- (NSInteger) expandOrCollapseView;

@end
