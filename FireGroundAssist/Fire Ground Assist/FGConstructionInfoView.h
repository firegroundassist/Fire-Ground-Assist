//
//  FGConstructionInfoView.h
//  Fire Ground Assist
//
//  Created by Charlie Jacobson on 3/12/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FGSideInfoView.h"

@interface FGConstructionInfoView : FGSideInfoView

@property (retain, nonatomic) UILabel* constructClassLabel;
@property (retain, nonatomic) UITextField* constructClassText;

@property (retain, nonatomic) UILabel* occupLabel;
@property (retain, nonatomic) UITextField* occupText;

@property (retain, nonatomic) UILabel* roofConstructLabel;
@property (retain, nonatomic) UITextField* roofConstructText;

@property (retain, nonatomic) UILabel* roofMatLabel;
@property (retain, nonatomic) UITextField* roofMatText;

@property (retain, nonatomic) UILabel* dimensionsLabel;

@property (retain, nonatomic) UILabel* lengthLabel;
@property (retain, nonatomic) UITextField* lengthText;
@property (retain, nonatomic) UILabel* widthLabel;
@property (retain, nonatomic) UITextField* widthText;
@property (retain, nonatomic) UILabel* heightLabel;
@property (retain, nonatomic) UITextField* heightText;
@property (retain, nonatomic) UILabel* floorsLabel;
@property (retain, nonatomic) UITextField* floorsText;
@property (retain, nonatomic) UILabel* basementLabel;
@property (retain, nonatomic) UITextField* basementsText;

@end
