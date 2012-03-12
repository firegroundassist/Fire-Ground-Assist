//
//  FGAccessInfoView.h
//  Fire Ground Assist
//
//  Created by Charlie Jacobson on 3/12/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FGSideInfoView.h"

@interface FGAccessInfoView : FGSideInfoView

@property (retain, nonatomic) UILabel* knoxBoxLabel;
@property (retain, nonatomic) UITextField* knoxBoxText;

@property (retain, nonatomic) UILabel* mainEntLabel;
@property (retain, nonatomic) UITextField* mainEntText;

@property (retain, nonatomic) UILabel* roofAccLabel;
@property (retain, nonatomic) UITextField* roofAccText;

@property (retain, nonatomic) UILabel* alarmPanLocLabel;
@property (retain, nonatomic) UITextField* alarmPanLocText;

@property (retain, nonatomic) UILabel* alarmAnnunLocLabel;
@property (retain, nonatomic) UITextField* alarmAnnunLocText;

@end
