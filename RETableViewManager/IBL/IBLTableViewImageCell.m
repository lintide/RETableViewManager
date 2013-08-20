//
//  IBLTableViewImageCell.m
//  RETableViewManagerExample
//
//  Created by Teddy.lin on 13-8-19.
//  Copyright (c) 2013年 Roman Efimov. All rights reserved.
//

#import "IBLTableViewImageCell.h"
#import "RETableViewManager.h"

#import <QuartzCore/QuartzCore.h>

@interface IBLTableViewImageCell () <UIActionSheetDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate>

@property (nonatomic, strong) UIImagePickerController *imagePicker;

@end

@implementation IBLTableViewImageCell

- (void)cellDidLoad {
    _avatarImageView = [[UIImageView alloc] initWithFrame:CGRectNull];
    [self addSubview:_avatarImageView];
    _avatarImageView.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin;
    _avatarImageView.contentMode = UIViewContentModeScaleAspectFill;
    _avatarImageView.clipsToBounds = YES;
    _avatarImageView.backgroundColor = [UIColor lightGrayColor];
    _avatarImageView.layer.cornerRadius = 4.0f;
    [_avatarImageView setImage:self.item.placeholderImage];
    
    self.imagePicker = [[UIImagePickerController alloc] init];
    self.imagePicker.delegate = self;
    self.imagePicker.allowsEditing = YES;
}

- (void)cellWillAppear {
    [super cellWillAppear];
    _avatarImageView.frame = CGRectMake(self.frame.size.width - self.item.cellHeight - 10.0, 2.0, self.item.cellHeight - 2 * 2.0, self.item.cellHeight - 2 * 2.0);
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    if (self.item.value) {
        [_avatarImageView setImage:self.item.value];
    } else {
        [_avatarImageView setImage:self.item.placeholderImage];
    }

}

- (void)layoutSubviews {
    [super layoutSubviews];
    

}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    if (selected) {
        UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:nil delegate:self cancelButtonTitle:@"Cancel" destructiveButtonTitle:nil otherButtonTitles:@"Take a Photo", @"Select Photo", nil];
//        [actionSheet addButtonWithTitle:@"Take Photo"];
//        [actionSheet addButtonWithTitle:@"Select Photo"];
        [actionSheet showInView:self];
    }
}

#pragma mark - Action sheet delegate

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
    if (buttonIndex == 0) {
        self.imagePicker.sourceType = UIImagePickerControllerSourceTypeCamera;
    } else if (buttonIndex == 1) {
        self.imagePicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    } else {
        return;
    }

    if ([self.tableViewManager.delegate isKindOfClass:[UIViewController class]]) {
        UIViewController *vc = (UIViewController *)self.tableViewManager.delegate;
        [vc presentViewController:self.imagePicker animated:YES completion:NULL];
    }
}

#pragma mark - Image picker delegate

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    [self.avatarImageView setImage:[info objectForKey:UIImagePickerControllerEditedImage]];
    self.item.value = self.avatarImageView.image;
    [picker dismissViewControllerAnimated:YES completion:NULL];
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    [picker dismissViewControllerAnimated:YES completion:NULL];
    
}
@end
