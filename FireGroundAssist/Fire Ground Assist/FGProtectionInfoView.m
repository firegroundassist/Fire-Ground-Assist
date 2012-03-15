//
//  FGProtectionInfoView.m
//  Fire Ground Assist
//
//  Created by Charlie Jacobson on 3/12/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "FGProtectionInfoView.h"

@implementation FGProtectionInfoView

@synthesize sprinklerLabel;
@synthesize sprinklerText;
@synthesize FDCLocLabel;
@synthesize FDCLocText;
@synthesize standLocLabel;
@synthesize standLocText;
@synthesize standDescLabel;
@synthesize standDescText;
@synthesize gasLocLabel;
@synthesize gasLocText;
@synthesize electLocLabel;
@synthesize electLocText;
@synthesize waterLocLabel;
@synthesize waterLocText;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
		super.titleLabel.text = @"Protection Info";
		
		//Sprinkler 
		sprinklerLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 40, self.frame.size.width-60, 20)];
		sprinklerLabel.backgroundColor = [UIColor grayColor];
		sprinklerLabel.text = @"Sprinkler Info";
		[self addSubview:sprinklerLabel];
		
		sprinklerText = [[UITextField alloc] initWithFrame:CGRectMake(50, 70, self.frame.size.width-60, 20)];
		sprinklerText.backgroundColor = [UIColor whiteColor];
		[self addSubview:sprinklerText];
		
		// FDC Location(s)
		FDCLocLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 100, self.frame.size.width-60, 20)];
		FDCLocLabel.backgroundColor = [UIColor grayColor];
		FDCLocLabel.text = @"FDC Location(s)";
		[self addSubview:FDCLocLabel];
		
		FDCLocText = [[UITextField alloc] initWithFrame:CGRectMake(50, 130, self.frame.size.width-60, 20)];
		FDCLocText.backgroundColor = [UIColor whiteColor];
		[self addSubview:FDCLocText];
		
		// Standpipe Location
		standLocLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 160, self.frame.size.width-60, 20)];
		standLocLabel.backgroundColor = [UIColor grayColor];
		standLocLabel.text = @"Standpipe Location(s)";
		[self addSubview:standLocLabel];
		
		standLocText = [[UITextField alloc] initWithFrame:CGRectMake(50, 190, self.frame.size.width-60, 20)];
		standLocText.backgroundColor = [UIColor whiteColor];
		[self addSubview:standLocText];
		
		// Standpipe Description
		standDescLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 220, self.frame.size.width-60, 20)];
		standDescLabel.backgroundColor = [UIColor grayColor];
		standDescLabel.text = @"Standpipe Description";
		[self addSubview:standDescLabel];
		
		standDescText = [[UITextField alloc] initWithFrame:CGRectMake(50, 250, self.frame.size.width-60, 20)];
		standDescText.backgroundColor = [UIColor whiteColor];
		[self addSubview:standDescText];
		
		// Gas Shutoff
		gasLocLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 280, self.frame.size.width-60, 20)];
		gasLocLabel.backgroundColor = [UIColor grayColor];
		gasLocLabel.text = @"Gas Shutoff(s)";
		[self addSubview:gasLocLabel];
		
		gasLocText = [[UITextField alloc] initWithFrame:CGRectMake(50, 310, self.frame.size.width-60, 20)];
		gasLocText.backgroundColor = [UIColor whiteColor];
		[self addSubview:gasLocText];
		
		// Electric Shutoff
		electLocLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 340, self.frame.size.width-60, 20)];
		electLocLabel.backgroundColor = [UIColor grayColor];
		electLocLabel.text = @"Electric Shutoff(s)";
		[self addSubview:electLocLabel];
		
		electLocText = [[UITextField alloc] initWithFrame:CGRectMake(50, 370, self.frame.size.width-60, 20)];
		electLocText.backgroundColor = [UIColor whiteColor];
		[self addSubview:electLocText];
		
		// Water Shutoff
		waterLocLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 400, self.frame.size.width-60, 20)];
		waterLocLabel.backgroundColor = [UIColor grayColor];
		waterLocLabel.text = @"Water Shutoff(s)";
		[self addSubview:waterLocLabel];
		
		waterLocText = [[UITextField alloc] initWithFrame:CGRectMake(50, 430, self.frame.size.width-60, 20)];
		waterLocText.backgroundColor = [UIColor whiteColor];
		[self addSubview:waterLocText];
		
		
    }
    return self;
}

- (void)updateData:(NSDictionary *)data
{
	sprinklerText.text = [data objectForKey:@"sprinkler"];
	FDCLocText.text = [data objectForKey:@"FDC_loc"];
	standLocText.text = [data objectForKey:@"stand_loc"];
	standDescText.text = [data objectForKey:@"stand_desc"];
	gasLocText.text = [data objectForKey:@"gas_loc"];
	electLocText.text = [data objectForKey:@"elect_loc"];
	waterLocText.text = [data objectForKey:@"water_loc"];
}

- (void)clearData
{
	sprinklerText.text = @"";
	FDCLocText.text = @"";
	standLocText.text = @"";
	standDescText.text = @"";
	gasLocText.text = @"";
	electLocText.text = @"";
	waterLocText.text = @"";

}

- (void)dealloc {
    [sprinklerLabel release];
	[sprinklerText release];
	[FDCLocLabel release];
	[FDCLocText release];
	[standLocLabel release];
	[standLocText release];
	[standDescLabel release];
	[standDescText release];
	[gasLocLabel release];
	[gasLocText release];
	[electLocLabel release];
	[electLocText release];
	[waterLocLabel release];
	[waterLocText release];
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
