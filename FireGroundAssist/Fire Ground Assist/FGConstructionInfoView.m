//
//  FGConstructionInfoView.m
//  Fire Ground Assist
//
//  Created by Charlie Jacobson on 3/12/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "FGConstructionInfoView.h"

@implementation FGConstructionInfoView

@synthesize constructClassLabel;
@synthesize constructClassText;
@synthesize occupLabel;
@synthesize occupText;
@synthesize roofConstructLabel;
@synthesize roofConstructText;
@synthesize roofMatLabel;
@synthesize roofMatText;
@synthesize dimensionsLabel;
@synthesize lengthText;
@synthesize lengthLabel;
@synthesize widthText;
@synthesize widthLabel;
@synthesize heightText;
@synthesize heightLabel;
@synthesize floorsText;
@synthesize floorsLabel;
@synthesize basementLabel;
@synthesize basementsText;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
		super.titleLabel.text = @"Construction Info";
		
		//Construction Class 
		constructClassLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 40, self.frame.size.width-60, 20)];
		constructClassLabel.backgroundColor = [UIColor grayColor];
		constructClassLabel.text = @"Construction Class";
		[self addSubview:constructClassLabel];
		
		constructClassText = [[UITextField alloc] initWithFrame:CGRectMake(50, 70, self.frame.size.width-60, 20)];
		constructClassText.backgroundColor = [UIColor whiteColor];
		[self addSubview:constructClassText];
		
		// Occupancy
		occupLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 100, self.frame.size.width-60, 20)];
		occupLabel.backgroundColor = [UIColor grayColor];
		occupLabel.text = @"Occupancy";
		[self addSubview:occupLabel];
		
		occupText = [[UITextField alloc] initWithFrame:CGRectMake(50, 130, self.frame.size.width-60, 20)];
		occupText.backgroundColor = [UIColor whiteColor];
		[self addSubview:occupText];
		
		// Roof Construction
		roofConstructLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 160, self.frame.size.width-60, 20)];
		roofConstructLabel.backgroundColor = [UIColor grayColor];
		roofConstructLabel.text = @"Roof Construction";
		[self addSubview:roofConstructLabel];
		
		roofConstructText = [[UITextField alloc] initWithFrame:CGRectMake(50, 190, self.frame.size.width-60, 20)];
		roofConstructText.backgroundColor = [UIColor whiteColor];
		[self addSubview:roofConstructText];
		
		// Roof Material
		roofMatLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 220, self.frame.size.width-60, 20)];
		roofMatLabel.backgroundColor = [UIColor grayColor];
		roofMatLabel.text = @"Roof Material";
		[self addSubview:roofMatLabel];
		
		roofMatText = [[UITextField alloc] initWithFrame:CGRectMake(50, 250, self.frame.size.width-60, 20)];
		roofMatText.backgroundColor = [UIColor whiteColor];
		[self addSubview:roofMatText];
		
		// Dimensions
		dimensionsLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 280, self.frame.size.width-60, 20)];
		dimensionsLabel.backgroundColor = [UIColor grayColor];
		dimensionsLabel.text = @"Dimensions";
		[self addSubview:dimensionsLabel];
		
		// Length
		lengthLabel = [[UILabel alloc] initWithFrame:CGRectMake(50, 310, (self.frame.size.width-30)/2-40, 20)];
		lengthLabel.backgroundColor = [UIColor grayColor];
		lengthLabel.text = @"Length";
		[self addSubview:lengthLabel];
		
		lengthText = [[UITextField alloc] initWithFrame:CGRectMake(20+(self.frame.size.width-30)/2, 310, (self.frame.size.width-30)/2, 20)];
		lengthText.backgroundColor = [UIColor whiteColor];
		[self addSubview:lengthText];
		
		// Width
		widthLabel = [[UILabel alloc] initWithFrame:CGRectMake(50, 340, (self.frame.size.width-30)/2-40, 20)];
		widthLabel.backgroundColor = [UIColor grayColor];
		widthLabel.text = @"Width";
		[self addSubview:widthLabel];
		
		widthText = [[UITextField alloc] initWithFrame:CGRectMake(20+(self.frame.size.width-30)/2, 340, (self.frame.size.width-30)/2, 20)];
		widthText.backgroundColor = [UIColor whiteColor];
		[self addSubview:widthText];
		
		// Height
		heightLabel = [[UILabel alloc] initWithFrame:CGRectMake(50, 370, (self.frame.size.width-30)/2-40, 20)];
		heightLabel.backgroundColor = [UIColor grayColor];
		heightLabel.text = @"Height";
		[self addSubview:heightLabel];
		
		heightText = [[UITextField alloc] initWithFrame:CGRectMake(20+(self.frame.size.width-30)/2, 370, (self.frame.size.width-30)/2, 20)];
		heightText.backgroundColor = [UIColor whiteColor];
		[self addSubview:heightText];
		
		// Floors
		floorsLabel = [[UILabel alloc] initWithFrame:CGRectMake(50, 400, (self.frame.size.width-30)/2-40, 20)];
		floorsLabel.backgroundColor = [UIColor grayColor];
		floorsLabel.text = @"Floors";
		[self addSubview:floorsLabel];
		
		floorsText = [[UITextField alloc] initWithFrame:CGRectMake(20+(self.frame.size.width-30)/2, 400, (self.frame.size.width-30)/2, 20)];
		floorsText.backgroundColor = [UIColor whiteColor];
		[self addSubview:floorsText];
		
		// Basements
		basementLabel = [[UILabel alloc] initWithFrame:CGRectMake(50, 430, (self.frame.size.width-30)/2-40, 20)];
		basementLabel.backgroundColor = [UIColor grayColor];
		basementLabel.text = @"Basements";
		[self addSubview:basementLabel];
		
		basementsText = [[UITextField alloc] initWithFrame:CGRectMake(20+(self.frame.size.width-30)/2, 430, (self.frame.size.width-30)/2, 20)];
		basementsText.backgroundColor = [UIColor whiteColor];
		[self addSubview:basementsText];
    }
    return self;
}

- (void)updateData:(NSDictionary *)data
{
	constructClassText.text = [data objectForKey:@"construct_class"];
	occupText.text = [data objectForKey:@"occup"];
	roofConstructText.text = [data objectForKey:@"roof_construct"];
	roofMatText.text = [data objectForKey:@"roof_mat"];
	lengthText.text = [data objectForKey:@"size_length"];
	widthText.text = [data objectForKey:@"size_width"];
	heightText.text = [data objectForKey:@"size_height"];
	floorsText.text = [data objectForKey:@"floors"];
	basementsText.text = [data objectForKey:@"basements"];

}

- (void)clearData
{
	constructClassText.text = @"";
	occupText.text = @"";
	roofConstructText.text = @"";
	roofMatText.text = @"";
	lengthText.text = @"";
	widthText.text = @"";
	heightText.text = @"";
	floorsText.text = @"";
	basementsText.text = @"";
	
}

- (void)dealloc
{
	[ constructClassLabel release];
	[ constructClassText release];
	[ occupLabel  release];
	[ occupText release];
	[ roofConstructLabel release];
	[ roofConstructText release];
	[ roofMatLabel release];
	[ roofMatText release];
	[ dimensionsLabel release];
	[ lengthText release];
	[ lengthLabel release];
	[ widthText release];
	[ widthLabel release];
	[ heightText release];
	[ heightLabel release];
	[ floorsText release];
	[ floorsLabel release];
	[ basementLabel release];
	[ basementsText release];
	
	[super dealloc];
	
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
