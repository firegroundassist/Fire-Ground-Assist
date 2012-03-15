//
//  FGAccessInfoView.m
//  Fire Ground Assist
//
//  Created by Charlie Jacobson on 3/12/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "FGAccessInfoView.h"

@implementation FGAccessInfoView

@synthesize knoxBoxLabel, knoxBoxText;
@synthesize mainEntLabel;
@synthesize mainEntText;
@synthesize roofAccLabel;
@synthesize roofAccText;
@synthesize alarmPanLocLabel;
@synthesize alarmPanLocText;
@synthesize alarmAnnunLocLabel;
@synthesize alarmAnnunLocText;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
		super.titleLabel.text = @"Access Info";
		
		
		
		//Knox Box
		knoxBoxLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 40, self.frame.size.width-60, 20)];
		knoxBoxLabel.backgroundColor = [UIColor grayColor];
		knoxBoxLabel.text = @"Knox Box";
		[self addSubview:knoxBoxLabel];
		
		knoxBoxText = [[UITextField alloc] initWithFrame:CGRectMake(50, 70, self.frame.size.width-60, 20)];
		knoxBoxText.backgroundColor = [UIColor whiteColor];
		[self addSubview:knoxBoxText];
		
		// Main Entrance
		mainEntLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 100, self.frame.size.width-60, 20)];
		mainEntLabel.backgroundColor = [UIColor grayColor];
		mainEntLabel.text = @"Main Entrance";
		[self addSubview:mainEntLabel];
		
		mainEntText = [[UITextField alloc] initWithFrame:CGRectMake(50, 130, self.frame.size.width-60, 20)];
		mainEntText.backgroundColor = [UIColor whiteColor];
		[self addSubview:mainEntText];
		
		// Roof Access
		roofAccLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 160, self.frame.size.width-60, 20)];
		roofAccLabel.backgroundColor = [UIColor grayColor];
		roofAccLabel.text = @"Roof Access";
		[self addSubview:roofAccLabel];
		
		roofAccText = [[UITextField alloc] initWithFrame:CGRectMake(50, 190, self.frame.size.width-60, 20)];
		roofAccText.backgroundColor = [UIColor whiteColor];
		[self addSubview:roofAccText];
		
		// Alarm Panel
		alarmPanLocLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 220, self.frame.size.width-60, 20)];
		alarmPanLocLabel.backgroundColor = [UIColor grayColor];
		alarmPanLocLabel.text = @"Alarm Panel";
		[self addSubview:alarmPanLocLabel];
		
		alarmPanLocText = [[UITextField alloc] initWithFrame:CGRectMake(50, 250, self.frame.size.width-60, 20)];
		alarmPanLocText.backgroundColor = [UIColor whiteColor];
		[self addSubview:alarmPanLocText];
		
		// Alarm Annunciator
		alarmAnnunLocLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 280, self.frame.size.width-60, 20)];
		alarmAnnunLocLabel.backgroundColor = [UIColor grayColor];
		alarmAnnunLocLabel.text = @"Alarm Annunciator";
		[self addSubview:alarmAnnunLocLabel];
		
		alarmAnnunLocText = [[UITextField alloc] initWithFrame:CGRectMake(50, 310, self.frame.size.width-60, 20)];
		alarmAnnunLocText.backgroundColor = [UIColor whiteColor];
		[self addSubview:alarmAnnunLocText];
		
    }
    return self;
}

- (void) clearData
{
	knoxBoxText.text = @"";
	mainEntText.text = @"";
	roofAccText.text = @"";
	alarmPanLocText.text = @"";
	alarmAnnunLocText.text = @"";
}

- (void)updateData:(NSDictionary *)data
{
	knoxBoxText.text = [data objectForKey:@"knoxBox_desc"];
	mainEntText.text = [data objectForKey:@"mainEnt"];
	roofAccText.text = [data objectForKey:@"roof_acc"];
	alarmPanLocText.text = [data objectForKey:@"alarmpan_loc"];
	alarmAnnunLocText.text = [data objectForKey:@"alarmannun_loc"];
}

- (void)dealloc {
    [knoxBoxLabel release];
	[knoxBoxText release];
	[mainEntLabel release];
	[mainEntText release];
	[roofAccLabel release];
	[roofAccText release];
	[alarmPanLocLabel release]; 
	[alarmPanLocText release];
	[alarmAnnunLocLabel release];
	[alarmAnnunLocText release];
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
