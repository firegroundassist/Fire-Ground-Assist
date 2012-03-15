//
//  FGContactView.m
//  Fire Ground Assist
//
//  Created by Charlie Jacobson on 3/13/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "FGContactView.h"

@implementation FGContactView

@synthesize isExpanded, position, name, mainNumber, mainNumberType; 

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
		self.backgroundColor = [UIColor blackColor];
		
		// Position
		position = [[UILabel alloc] initWithFrame:CGRectMake(5, 5, (self.frame.size.width-15)/2, 20)];
		position.textColor = [UIColor whiteColor];
		position.text = @"Engineer"; 
		position.backgroundColor = [UIColor clearColor];
		[self addSubview:position];
		
		
		// 
		
    }
    return self;
}

- (NSInteger)expandOrCollapseView
{
	if (isExpanded!=TRUE) {
		NSInteger changeY = 100.0;
		
		CGRect frame = self.frame;
		frame.size.height = frame.size.height + 100.0f;
		
		[UIView beginAnimations:nil context:nil];
		[UIView setAnimationDuration:0.4f];
		self.frame = frame;
		[UIView commitAnimations];
		
		self.isExpanded = TRUE;
		return changeY;
	}
	
	else {
		NSInteger changeY = -100.0;
		
		CGRect frame = self.frame;
		frame.size.height = frame.size.height - 100.0f;
		
		[UIView beginAnimations:nil context:nil];
		[UIView setAnimationDuration:0.4f];
		self.frame = frame;
		[UIView commitAnimations];
		
		self.isExpanded = FALSE;
		return changeY;
	}
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
