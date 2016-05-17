//
//  ViewController.h
//  ContactDemo
//
//  Created by devashish on 13/05/2016.
//  Copyright © 2016 Marvel. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIImageView *personImage;
@property (weak, nonatomic) IBOutlet UILabel *personName;
@property (weak, nonatomic) IBOutlet UILabel *emailId;
@property (weak, nonatomic) IBOutlet UILabel *phoneNo;

- (IBAction)selectAction:(id)sender;

@end

