//
//  FGProtectionInfoView.h
//  Fire Ground Assist
//
//  Created by Charlie Jacobson on 3/12/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FGSideInfoView.h"

@interface FGProtectionInfoView : FGSideInfoView

@property (retain, nonatomic) UILabel* sprinklerLabel;
@property (retain, nonatomic) UITextField* sprinklerText;

@property (retain, nonatomic) UILabel* FDCLocLabel;
@property (retain, nonatomic) UITextField* FDCLocText;

@property (retain, nonatomic) UILabel* standLocLabel;
@property (retain, nonatomic) UITextField* standLocText;

@property (retain, nonatomic) UILabel* standDescLabel;
@property (retain, nonatomic) UITextField* standDescText;

@property (retain, nonatomic) UILabel* gasLocLabel;
@property (retain, nonatomic) UITextField* gasLocText;

@property (retain, nonatomic) UILabel* electLocLabel;
@property (retain, nonatomic) UITextField* electLocText;

@property (retain, nonatomic) UILabel* waterLocLabel;
@property (retain, nonatomic) UITextField* waterLocText;

@end
