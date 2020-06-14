//
//  ABTableViewController.m
//  UserDefaults
//
//  Created by Alexey Baryshnikov on 08.06.2020.
//  Copyright © 2020 Alexey Baryshnikov. All rights reserved.
//

#import "ABTableViewController.h"

@interface ABTableViewController () <UIGestureRecognizerDelegate, UITextFieldDelegate>

@end

static NSString *kSettingsLogin           = @"login";
static NSString *kSettingsPassword        = @"password";

static NSString *kSettingsLevel           = @"level";

static NSString *kSettingsShadows         = @"shadows";
static NSString *kSettingsDetalization    = @"detalization";

static NSString *kSettingsSurround        = @"surround";
static NSString *kSettingsMusic           = @"music";
static NSString *kSettingsArmor           = @"armor";

@implementation ABTableViewController

- (instancetype)initWithStyle:(UITableViewStyle)style {
    self = [super initWithStyle:style];
    if (self) {
        //custom init
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadSettings];
    NSNotificationCenter *nc = [NSNotificationCenter defaultCenter];
    [nc addObserver:self selector:@selector(notificationKeyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    [nc addObserver:self selector:@selector(notificationKeyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];

}
- (void)dealloc
{
        [[NSNotificationCenter defaultCenter] removeObserver:self];

}


#pragma mark - KeyboardNotification
- (void)notificationKeyboardWillShow:(NSNotification *)notification {
    NSLog(@"keyboard will show: %@", notification.userInfo);
}
- (void)notificationKeyboardWillHide:(NSNotification *)notification {
    
}
#pragma mark - Save and Load

- (void)saveSettings {
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    
    [userDefaults setObject:self.loginField.text forKey:kSettingsLogin];
    [userDefaults setObject:self.passwordField.text forKey:kSettingsPassword];
    
    [userDefaults setInteger:self.levelControl.selectedSegmentIndex forKey:kSettingsLevel];
    
    [userDefaults setBool:self.shadowSwitch.isOn forKey:kSettingsShadows];
    [userDefaults setDouble:self.detalizationSlider.value forKey:kSettingsDetalization];
    
    [userDefaults setDouble:self.surroundSlider.value forKey:kSettingsSurround];
    [userDefaults setDouble:self.musicSlider.value forKey:kSettingsMusic];
    [userDefaults setDouble:self.armorSlider.value forKey:kSettingsArmor];
    
    //autosave
    [userDefaults synchronize];
}

- (void)loadSettings {
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    
    self.loginField.text = [userDefaults valueForKey:kSettingsLogin];
    self.passwordField.text = [userDefaults valueForKey:kSettingsPassword];
    
    self.levelControl.selectedSegmentIndex = [userDefaults integerForKey:kSettingsLevel];
    
    self.shadowSwitch.on = [userDefaults boolForKey:kSettingsShadows];
    self.detalizationSlider.value = [userDefaults doubleForKey:kSettingsDetalization];
    
    self.surroundSlider.value = [userDefaults doubleForKey:kSettingsSurround];
    self.musicSlider.value = [userDefaults doubleForKey:kSettingsMusic];
    self.armorSlider.value = [userDefaults doubleForKey:kSettingsArmor];
}


#pragma mark - Actions
- (IBAction)actionValueChanged:(id)sender {
    [self saveSettings];
}

- (IBAction)actionTextField:(UITextField *)sender {
    [self saveSettings];
}

#pragma mark UITextFiledDelegate
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    if ([textField isEqual:self.loginField]) {
        [self.passwordField becomeFirstResponder];
    } else {
        [textField resignFirstResponder];
    }
    return NO;
}
@end

 
