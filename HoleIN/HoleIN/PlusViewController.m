//
//  PlusViewController.m
//  HoleIN
//
//  Created by HanYoungsoo on 2017. 3. 8..
//  Copyright © 2017년 YoungsooHan. All rights reserved.
//

#import "PlusViewController.h"
#import "ImgCollectionViewCell.h"
#import "MainViewController.h"

@interface PlusViewController () <UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (weak, nonatomic) IBOutlet UITextField *titleTextField;
@property (weak, nonatomic) IBOutlet UITextField *dateTextField;
@property (weak, nonatomic) IBOutlet UIButton *exitButton;
@property (weak, nonatomic) IBOutlet UITextView *imgTextView;
@property (weak, nonatomic) IBOutlet UITextView *imgDateTextView;
@property (weak, nonatomic) IBOutlet UIButton *saveButton;
@property (weak, nonatomic) IBOutlet UIImageView *imgView;


@property NSArray *imageDataArray;

@end

@implementation PlusViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
//    [self.imgTextView addObserver:self forKeyPath:@"contentSize" options:NSKeyValueObservingOptionNew context:nil];
    
//    // Cancel 버튼과 Save 버튼
//    [self.exitButton addTarget:self action:@selector(returnHome:) forControlEvents:UIControlEventTouchUpInside];
    
    // 저장 버튼 모양과 기능
//    [self.saveButton addTarget:self action:@selector(saveData:) forControlEvents:UIControlEventTouchUpInside];
    [self.saveButton.layer setBorderWidth:1.0];
    [self.saveButton.layer setBorderColor:[UIColor colorWithRed:155.0/255 green:155.0/255 blue:155.0/255 alpha:1.0].CGColor];
    [self.saveButton.layer setCornerRadius:4.0];
    [self.saveButton clipsToBounds];
    [self.saveButton setTintColor:[UIColor darkGrayColor]];
    
    [self.imgTextView setFont:[UIFont fontWithName:@"Apple SD 산돌고딕 Neo 얇은체 20.0" size:30]];
    self.titleTextField.tag = 10;
    self.dateTextField.tag = 20;
    
    
    self.imageDataArray = @[@"group@2x", @"groupCopy", @"BungeeJump", @"Flower", @"Camping", @"travel@3x", @"people@3x", @"swim@3x"];
    
}


- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string;
{
    [self.imgTextView setFont:[UIFont fontWithName:@"Apple SD 산돌고딕 Neo" size:20.0]];
    [self.imgDateTextView setFont:[UIFont fontWithName:@"Apple SD 산돌고딕 Neo" size:30.0]];
    [self.imgTextView setTextColor:[UIColor whiteColor]];
    [self.imgDateTextView setTextColor:[UIColor whiteColor]];
    
    self.imgTextView.text = self.titleTextField.text;
    self.imgDateTextView.text = self.dateTextField.text;
    
    return YES;
}


//텍스트 리턴값 눌렀을 때, 키보드 사라지고 다시 UI가 내려오는 메소드

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    if (textField.tag == 10) {
        [self.titleTextField resignFirstResponder];
        [self.dateTextField becomeFirstResponder];
        
    }
    else{
        [self.dateTextField resignFirstResponder];
    }
    
    return YES;
}



//- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
//    
//    if ([keyPath isEqualToString:@"contentSize"]) {
//        UITextView *tv = object;
//        CGFloat topCorrect = ([tv bounds].size.height - [tv contentSize].height * [tv zoomScale])  / 2.0;
//        topCorrect = ( topCorrect < 0.0 ? 0.0 : topCorrect );
//        tv.contentOffset = (CGPoint){.x = 0, .y = -topCorrect};
//    }
//}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


// 콜렉션 뷰 아이템 사이즈
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    return CGSizeMake(78, 78);
}


// 콜렉션 뷰 셀 생성
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    ImgCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell"forIndexPath:indexPath];
    
    cell.cellImgView.image = [UIImage imageNamed:self.imageDataArray[indexPath.item]];
    
    
    return cell;
}


// 콜렉션 뷰 아이템 개수
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section  {
    
    return self.imageDataArray.count;
}


// 콜렉션 뷰 섹션 개수
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView  {
    
    return 1;
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath  {
    
    switch (indexPath.item) {
        case 0: {
            UIImagePickerController *imgPicker = [[UIImagePickerController alloc] init];
            imgPicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
            imgPicker.delegate = self;
            imgPicker.allowsEditing = YES;
            
            [self presentViewController:imgPicker animated:YES completion:nil];
            break;
        }
            
        case 1: {
            UIImagePickerController *imgPicker1 = [[UIImagePickerController alloc] init];
            imgPicker1 = [[UIImagePickerController alloc] init];
            imgPicker1.delegate = self;
            [imgPicker1 setSourceType:UIImagePickerControllerSourceTypeCamera];
            [self presentViewController:imgPicker1 animated:YES completion:nil];
            
            break;
        }
            
        default:{
            
            ImgCollectionViewCell *cell = (ImgCollectionViewCell *)[collectionView cellForItemAtIndexPath:indexPath];
//            UIImage *image = [[UIImage alloc] init];
            [self.imgView setImage:cell.cellImgView.image];
        }
            
            
            break;
    }
}


-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info
{
    NSLog(@"info %@", info);
    UIImage *image = [info objectForKey:UIImagePickerControllerEditedImage];
    self.imgView.image = image;
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    [picker dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)onBackBtn:(UIButton *)sender {
//    MainViewController *mainVC = [self.storyboard instantiateViewControllerWithIdentifier:@"MainViewController"];
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
