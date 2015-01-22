//
//  QuestionAndOptions.h
//  Mayo-ipad
//
//  Created by Akshay Ashwathanarayana on 11/8/14.
//  Copyright (c) 2014 Akshay Ashwathanarayana. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SurveyViewController : UIViewController <UITableViewDataSource, UITableViewDelegate, UIPickerViewDelegate, UIPickerViewDataSource>
@property NSMutableArray *questionsOptionsList;
@property UITextField *activeTextField;
@property NSDictionary *dict;
@end
