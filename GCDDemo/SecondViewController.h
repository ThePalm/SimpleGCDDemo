//
//  SecondViewController.h
//  GCDDemo
//
//  Created by Lewis W. Johnson on 8/24/14.
//  Copyright (c) 2014 HamiltonHoltInc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SecondViewController : UIViewController
- (IBAction)ButtonClicked:(id)sender;
@property int count;
@property (weak, nonatomic) IBOutlet UILabel *CountOutputLabel;

@end
