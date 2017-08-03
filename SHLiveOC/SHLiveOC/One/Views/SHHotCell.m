//
//  SHHotCell.m
//  SHLiveOC
//
//  Created by ios on 2017/8/1.
//  Copyright © 2017年 ios. All rights reserved.
//

#import "SHHotCell.h"

@interface SHHotCell ()

@property (weak, nonatomic) IBOutlet UIImageView *iconImgV;
@property (weak, nonatomic) IBOutlet UIImageView *mainImgV;

@end

@implementation SHHotCell

- (void)setLiveModel:(SHLiveModel *)liveModel
{
    _liveModel = liveModel;
    [self.iconImgV downloadImage:liveModel.creator.portrait placeholder:@"default_room"];
    [self.mainImgV downloadImage:liveModel.creator.portrait placeholder:@"default_room"];
}


- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
