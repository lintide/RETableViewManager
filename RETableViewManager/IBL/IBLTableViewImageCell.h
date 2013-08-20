//
//  IBLTableViewImageCell.h
//  RETableViewManagerExample
//
//  Created by Teddy.lin on 13-8-19.
//  Copyright (c) 2013年 Roman Efimov. All rights reserved.
//

#import "RETableViewCell.h"
#import "IBLImageItem.h"

@interface IBLTableViewImageCell : RETableViewCell

@property (nonatomic, readonly, strong) UIImageView *avatarImageView;

@property (nonatomic, strong) IBLImageItem *item;

@end
