//
//  HomeVC.h
//  Fire Ground Assist
//
//  Created by Charlie Jacobson on 2/14/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "URLRequest.h"
#import "JSON.h"

@interface HomeVC : UIViewController <UITextFieldDelegate> {
    URLRequest *req;
    IBOutlet UITextField *addressField;
    IBOutlet UILabel *rslt;
    IBOutlet UILabel *rsltAddress;
    IBOutlet UILabel *rsltKnox;
    IBOutlet UILabel *rsltMainEnt;
}

- (IBAction) findBuilding;

@end
