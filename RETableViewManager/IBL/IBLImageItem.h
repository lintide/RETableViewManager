//
//  IBLImageTableViewItem.h
//  RETableViewManagerExample
//
//  Created by Teddy.lin on 13-8-19.
//  Copyright (c) 2013年 Roman Efimov. All rights reserved.
//

#import "RETableViewItem.h"

@interface IBLImageItem : RETableViewItem

@property (nonatomic, strong) UIImage *value;
@property (nonatomic, strong) UIImage *placeholderImage;

@end
