//
//  ABTableViewController.h
//  UserDefaults
//
//  Created by Alexey Baryshnikov on 08.06.2020.
//  Copyright © 2020 Alexey Baryshnikov. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ABTableViewController : UITableViewController
@property (weak, nonatomic) IBOutlet UITextField *loginField;
@property (weak, nonatomic) IBOutlet UITextField *passwordField;

@property (weak, nonatomic) IBOutlet UISegmentedControl *levelControl;

@property (weak, nonatomic) IBOutlet UISwitch *shadowSwitch;
@property (weak, nonatomic) IBOutlet UISlider *detalizationSlider;

@property (weak, nonatomic) IBOutlet UISlider *surroundSlider;
@property (weak, nonatomic) IBOutlet UISlider *musicSlider;
@property (weak, nonatomic) IBOutlet UISlider *armorSlider;




- (IBAction)actionTextField:(UITextField *)sender;
- (IBAction)actionValueChanged:(id)sender;


@end

NS_ASSUME_NONNULL_END
