//
//  ChallengeTableViewCell.h
//  HoleIN
//
//  Created by HanYoungsoo on 2017. 3. 9..
//  Copyright © 2017년 YoungsooHan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ChallengeTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *cellImg;

@property (weak, nonatomic) IBOutlet UILabel *chTitle;

@property (weak, nonatomic) IBOutlet UILabel *dday;

@end
