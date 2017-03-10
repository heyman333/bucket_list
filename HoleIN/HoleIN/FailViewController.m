//
//  FailViewController.m
//  HoleIN
//
//  Created by HanYoungsoo on 2017. 3. 8..
//  Copyright © 2017년 YoungsooHan. All rights reserved.
//

#import "FailViewController.h"
#import "FailTableViewCell.h"

@interface FailViewController ()
<UITableViewDelegate,UITableViewDataSource>

@property NSMutableArray *challengeArr;
@property NSMutableArray *ddayArr;
@property NSMutableArray *imgs;

@end

@implementation FailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
   self.challengeArr = [[NSMutableArray alloc] initWithObjects:@"다이어트 5키로 감량",@"마라톤 참가하기",@"토익 890점",@"접영배우기",@"국토대장정",@"앙코르와트 가 보기", nil];


//    self.ddayArr = @[@"D-0",@"D-0",@"D-0"];
    self.imgs = [[NSMutableArray alloc] initWithObjects:@"fail1",@"fail2",@"fail3",@"fail4",@"fail5",@"fail6", nil];


}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.challengeArr.count;
}



-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    FailTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"FailTableViewCell"];
    
    
    if(cell == nil){
        cell = [[FailTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"FailTableViewCell"];
        
    }
    cell.FailCellImg.image = [UIImage imageNamed:[self.imgs objectAtIndex:indexPath.row]];
    
    cell.chText.text = [self.challengeArr objectAtIndex:indexPath.row];


    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    [tableView deselectRowAtIndexPath:indexPath
                             animated:NO];
    
    UIAlertController *failAlert = [UIAlertController alertControllerWithTitle:@"실패" message:@"재도전 선택시 도전목록에 다시 추가됩니다." preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *reTry = [UIAlertAction actionWithTitle:@"다시도전" style:UIAlertActionStyleDefault handler:nil];
    
    UIAlertAction *goTrash = [UIAlertAction actionWithTitle:@"버리기" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [self.challengeArr removeObjectAtIndex:indexPath.row];
        [self.imgs removeObjectAtIndex:indexPath.row];

        [self.tableView reloadData];
        
    }];
    
    [failAlert addAction:reTry];
    [failAlert addAction:goTrash];
    
    [self presentViewController:failAlert animated:YES completion:nil];

}




@end
