//
//  QuestionAndOptions.h
//  Mayo-ipad
//
//  Created by Akshay Ashwathanarayana on 11/8/14.
//  Copyright (c) 2014 Akshay Ashwathanarayana. All rights reserved.
//
#import <Foundation/Foundation.h>

@interface SurveyXMLHelper : NSObject <NSXMLParserDelegate>
- (NSMutableArray *) getLoadedQuestionOptionsList;
-(id)init;
@end
