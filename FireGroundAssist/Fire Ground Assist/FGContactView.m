//
//  FGContactView.m
//  Fire Ground Assist
//
//  Created by Charlie Jacobson on 3/13/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "FGContactView.h"

@implementation FGContactView

@synthesize isExpanded, position, name, mainNumber, mainNumberType, secondNumber, secondNumberType, email, emailLabel; 

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
		self.backgroundColor = [UIColor blackColor];
		
		// Position
		position = [[UILabel alloc] initWithFrame:CGRectMake(5, 5, (self.frame.size.width-15)/2, 20)];
		position.textColor = [UIColor whiteColor];
		position.text = @"Owner"; 
		position.backgroundColor = [UIColor clearColor];
		[self addSubview:position];
		
		
		// Name
		name = [[UILabel alloc] initWithFrame:CGRectMake((self.frame.size.width-15)/2+10, 5, (self.frame.size.width-15)/2, 20)];
		name.textColor = [UIColor whiteColor];
		name.text = @"Charlie Jacobson";
		name.backgroundColor = [UIColor clearColor];
		[self addSubview:name];
		
		// Main Number Type
		mainNumberType = [[UILabel alloc] initWithFrame:CGRectMake(5, 25, (self.frame.size.width-15)/3, 20)];
		mainNumberType.textColor = [UIColor whiteColor];
		mainNumberType.text = @"Cell";
		mainNumberType.backgroundColor = [UIColor blueColor];
		[self addSubview:mainNumberType];
		
		// Main Number
		mainNumber = [[UITextView alloc] initWithFrame:CGRectMake((self.frame.size.width-15)/3+10, 25, 2*(self.frame.size.width-15)/3, 20)];
		mainNumber.textColor = [UIColor whiteColor];
		mainNumber.text = @"201.290.2454";
		mainNumber.backgroundColor = [UIColor blueColor];
		[self addSubview:mainNumber];
		
		// Second Number Type
		secondNumberType = [[UILabel alloc] initWithFrame:CGRectMake(5, 50, (self.frame.size.width-15)/3, 20)];
		secondNumberType.textColor = [UIColor whiteColor];
		secondNumberType.text = @"Home";
		secondNumberType.backgroundColor = [UIColor blueColor];
		secondNumberType.hidden = TRUE;
		[self addSubview:secondNumberType];
		
		// Second Number
		secondNumber = [[UITextView alloc] initWithFrame:CGRectMake((self.frame.size.width-15)/3+10, 50, 2*(self.frame.size.width-15)/3, 20)];
		secondNumber.textColor = [UIColor whiteColor];
		secondNumber.text = @"201.227.0666";
		secondNumber.backgroundColor = [UIColor blueColor];
		secondNumber.hidden = TRUE;
		[self addSubview:secondNumber];
		
		// Email Label
		emailLabel = [[UILabel alloc] initWithFrame:CGRectMake(5, 75, (self.frame.size.width-15)/3, 20)];
		emailLabel.textColor = [UIColor whiteColor];
		emailLabel.text = @"Email";
		emailLabel.backgroundColor = [UIColor blueColor];
		emailLabel.hidden = TRUE;
		[self addSubview:emailLabel];
		
		// Email
		email = [[UITextView alloc] initWithFrame:CGRectMake((self.frame.size.width-15)/3+10, 75, 2*(self.frame.size.width-15)/3, 20)];
		email.textColor = [UIColor whiteColor];
		email.text = @"jacobc@d-e.org";
		email.backgroundColor = [UIColor blueColor];
		email.hidden = TRUE;
		[self addSubview:email];
		
    }
    return self;
}

- (NSInteger)expandOrCollapseView
{
	if (isExpanded!=TRUE) {
		NSInteger changeY = 100.0;
		
		CGRect frame = self.frame;
		frame.size.height = frame.size.height + 100.0f;
		
		
		
		[UIView animateWithDuration:.5 
							  delay:0
							options:UIViewAnimationCurveEaseIn
						 animations:^{
							 
							 self.frame = frame;}
						 completion:^(BOOL finished){
							 
							 self.isExpanded = TRUE;
						 }
		 ];
		[UIView commitAnimations];
		
		[self setNeedsDisplay];
		
		secondNumberType.hidden = FALSE;
		secondNumber.hidden = FALSE;
		emailLabel.hidden = FALSE;
		email.hidden = FALSE;
		
		return changeY;
	}
	
	else {
		NSInteger changeY = -100.0;
		
		CGRect frame = self.frame;
		frame.size.height = frame.size.height - 100.0f;
		
		[UIView animateWithDuration:.5 
							  delay:0
							options:UIViewAnimationCurveEaseOut
						 animations:^{
							 
							 self.frame = frame;
						 }completion:^(BOOL finished){
							 
							 self.isExpanded = FALSE;
						 }
		 ];
		secondNumberType.hidden = TRUE;
		secondNumber.hidden = TRUE;
		emailLabel.hidden = TRUE;
		email.hidden = TRUE;
		
		[UIView commitAnimations];
		
		
		return changeY;
	}
}

- (void)updateData:(NSDictionary *)data
{
	
}

- (void)clearData
{
	
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
