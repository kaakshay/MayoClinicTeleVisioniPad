//
//  SurveyEditViewController.m
//  Mayo-ipad
//
//  Created by Ashraf Gaffar on 11/26/14.
//  Copyright (c) 2014 rishabh srivastava. All rights reserved.
//

#import "SurveyEditViewController.h"
#import "QuestionAndOptions.h"
#import "SurveyXMLHelper.h"
#import "EditableQuestionOptionTableViewCell.h"

@interface SurveyEditViewController ()
@property NSMutableArray *pickerViewsArray;
@property (weak, nonatomic) IBOutlet UITextView *remarks;
@property (weak, nonatomic) IBOutlet UIButton *submitSurvey;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property NSMutableArray *questionsOptionsList;
@end

@implementation SurveyEditViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    [self.tableView setUserInteractionEnabled:YES];
    self.tableView.editing = true;
    [self.view setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"mayobg.png"]]];
    //self.view.backgroundColor = [UIColor clearColor];
    self.questionsOptionsList = [[NSMutableArray alloc] init];
    self.pickerViewsArray = [[NSMutableArray alloc] init];
    //    [self loadQuestionsAndOptionsFromFile];
    SurveyXMLHelper *helper = [[SurveyXMLHelper alloc]init];
    self.questionsOptionsList = [helper getLoadedQuestionOptionsList];
    
    [self createPickerViews];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)createPickerViews

{
    for(int x = 0; x < [self.questionsOptionsList count]; x++) //number of picker views
    {
        //        UIPickerView *pickerView = [[UIPickerView alloc] initWithFrame:(CGRect){{15, 20}, 500, 1}];
        //        pickerView.delegate = self;
        //        pickerView.dataSource = self;
        //        pickerView.tag = x;
        ////        pickerView.backgroundColor = [UIColor clearColor];
        //        pickerView.opaque = false;
        //        [self.pickerViewsArray addObject:pickerView];
        QuestionAndOptions *item = [self.questionsOptionsList objectAtIndex:x];
        
//        if(item.objective){
//            UITextField *question = [[UITextField alloc] initWithFrame:CGRectMake(0, 0, 1000, 75)];
//            question.text = item.question;
//        question.layer.borderWidth = 0.5;
//            RadioButton *radioGroup =[[RadioButton alloc]
//                                      initWithFrame:CGRectMake(0, 60, 1000, 75)
//                                      andOptions:item.options andColumns:4];
        [self.pickerViewsArray addObject:[[EditableQuestionOptionTableViewCell alloc] initWithQuestion:item]];
  
        
        
    }
}
#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.questionsOptionsList count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"questionCell" forIndexPath:indexPath];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"questionCell"];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        NSLog(@"inside cell == nil");
    }
    QuestionAndOptions *item = [self.questionsOptionsList objectAtIndex:indexPath.row];
    
//    for(UIView *view in cell.contentView.subviews){
//        if ([view isKindOfClass:[EditableQuestionOptionTableViewCell class]]) {
//            [view removeFromSuperview];
//        }
//    }
    // Configure the cell...
    
    
    //    [cell.textLabel frameForAlignmentRect:CGRectMake(0, 0, 10, 20)];
    //    cell.textLabel.text = item.question;
    //    [cell.textLabel sizeToFit];
    cell.backgroundColor = [UIColor clearColor];
    [cell.contentView addSubview:(UIPickerView*)[self.pickerViewsArray objectAtIndex:indexPath.row]];
//    [cell setUserInteractionEnabled:YES];
    
    return cell;
}


/*
 // Override to support conditional editing of the table view.
 - (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
 // Return NO if you do not want the specified item to be editable.
 return YES;
 }
 */

/*
 // Override to support editing the table view.
 - (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
 if (editingStyle == UITableViewCellEditingStyleDelete) {
 // Delete the row from the data source
 [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
 } else if (editingStyle == UITableViewCellEditingStyleInsert) {
 // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
 }
 }
 */

/*
 // Override to support rearranging the table view.
 - (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
 }
 */

/*
 // Override to support conditional rearranging of the table view.
 - (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
 // Return NO if you do not want the item to be re-orderable.
 return YES;
 }
 */

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return ((EditableQuestionOptionTableViewCell*)[self.pickerViewsArray objectAtIndex:indexPath.row]).height+20; //just some arbitrary value, change it to suit your needs.
}

//- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
//{
////    EditableQuestionOptionTableViewCell *cell = (EditableQuestionOptionTableViewCell*)[self.pickerViewsArray objectAtIndex:indexPath.row];
////    [cell setUserInteractionEnabled:YES];
////    [cell becomeFirstResponder];
//}



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
