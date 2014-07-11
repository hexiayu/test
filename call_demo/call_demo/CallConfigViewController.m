//
//  CallConfigViewController.m
//  call_demo
//
//  Created by ludong on 13-1-24.
//  Copyright (c) 2013年 ludong. All rights reserved.
//

#import "CallConfigViewController.h"

@interface CallConfigViewController ()

@end

@implementation CallConfigViewController

//用于设置pickerView多少列选择栏
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 3;
}
//设置每一列有多少个行数
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    if (component == 0) {   //编码器
        return 2;
    }
    else if (component == 1) {  //分辨率
        return 3;
    }
    else {  //码率
        return 3;
    }
}
//设置每列数据
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    if (component == 0) {
        if (row==0) {
            return  @"优化的编码";
        }
        else {
            return @"opencore";
        }
    }
    else if (component == 1) {
        if (row==0) {
            return  @"352*288";
        }
        else if (row==1) {
            return @"256*208";
        }
        else {
            return @"192*144";
        }
    }
    else {
        if (row==0) {
            return  @"高码率";
        }
        else if (row==1) {
            return @"中码率";
        }
        else {
            return @"低码率";
        }
    }
}
- (CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component{
    if (component == 0) {
        return 120;
    }
    else if (component==1){
        return 90;
    }
    else{
        return 90;
    }
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return YES;
}
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    if (range.location >= 4)
        return NO; // return NO to not change text
    return YES;
}
- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [[self selectionPickerView] setDataSource:self];
    [[self selectionPickerView] setDelegate:self];
    [[self selectionPickerView] setHidden:YES];
    
    [[self otherPortTextField] setDelegate:self];
    [[self localPortTextField] setDelegate:self];
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 4;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([indexPath row]==0) {
        return [self ipCell];
    }
    else if ([indexPath row]==1){
        return [self otherCell];
    }
    else if ([indexPath row]==2){
        return [self localCell];
    }
    else{
        return [self selectionCell];
    }
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([indexPath row]==3) {
        if ([[self selectionPickerView] isHidden]) {
            [[self ipTextField] resignFirstResponder];
            [[self otherPortTextField] resignFirstResponder];
            [[self localPortTextField] resignFirstResponder];
            [[self selectionPickerView] setHidden:NO];
            [[self selectionCell] setAccessoryType:UITableViewCellAccessoryNone];
        }
        else{
            [[self ipTextField] resignFirstResponder];
            [[self otherPortTextField] resignFirstResponder];
            [[self localPortTextField] resignFirstResponder];
            [[self selectionPickerView] setHidden:YES];
            [[self selectionCell] setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];
        }
    }
}

- (void)dealloc {
    [_ipTextField release];
    [_otherPortTextField release];
    [_localPortTextField release];
    [_selectionPickerView release];
    [_ipCell release];
    [_otherCell release];
    [_localCell release];
    [_selectionCell release];
    [_doneItem release];
    [super dealloc];
}
- (void)viewDidUnload {
    [self setIpTextField:nil];
    [self setOtherPortTextField:nil];
    [self setLocalPortTextField:nil];
    [self setSelectionPickerView:nil];
    [self setIpCell:nil];
    [self setOtherCell:nil];
    [self setLocalCell:nil];
    [self setSelectionCell:nil];
    [self setDoneItem:nil];
    [super viewDidUnload];
}
int codecType, resolution, bitrateType;
-(BOOL)checkIP{
    NSRegularExpression *regularExpression = [[[NSRegularExpression alloc] initWithPattern:@"(\\d{1,3}\\.\\d{1,3}\\.\\d{1,3}\\.\\d{1,3})" options:0 error:nil] autorelease];
    NSTextCheckingResult *result = [regularExpression firstMatchInString:[[self ipTextField] text] options:0 range:NSMakeRange(0, [[[self ipTextField] text] length])];
    if (result) {
        NSArray *array = [[[self ipTextField] text] componentsSeparatedByString:@"."];
        
        if([[array objectAtIndex:0] longLongValue]<=255&&[[array objectAtIndex:1] longLongValue]<=255&&[[array objectAtIndex:2] longLongValue]<=255&&[[array objectAtIndex:3] longLongValue]<=255){
            return YES;
        }
        else {
            UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"抱歉" message:@"您输入的ip有误!" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
            [alertView show];
            [alertView release];
        }
    }
    else {
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"抱歉" message:@"您输入的ip有误!" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
        [alertView show];
        [alertView release];
    }
    return NO;
}

- (IBAction)doneAction:(id)sender {
    if ([self checkIP]) {   //ip格式正确
        if ([[[self otherPortTextField] text] length]<4||[[[self localPortTextField] text] length]<4) {
            UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"抱歉" message:@"端口号请输入1000以上值" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
            [alertView show];
            [alertView release];
            return;
        }
        codecType = [[self selectionPickerView] selectedRowInComponent:0];
        resolution = [[self selectionPickerView] selectedRowInComponent:1];
        bitrateType = [[self selectionPickerView] selectedRowInComponent:2];
        [[self ipTextField] resignFirstResponder];
        [[self otherPortTextField] resignFirstResponder];
        [[self localPortTextField] resignFirstResponder];
        [self performSegueWithIdentifier:@"call" sender:nil];
    }
}
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    CallViewController *callViewController = [segue destinationViewController];
    [callViewController setCodecType:codecType];
    [callViewController setResolution:resolution];
    [callViewController setBitrateType:bitrateType];
    [callViewController setIp:[[self ipTextField] text]];
    [callViewController setOtherPort:[[[self otherPortTextField] text] longLongValue]];
    [callViewController setLocalPort:[[[self localPortTextField] text] longLongValue]];
}
@end
