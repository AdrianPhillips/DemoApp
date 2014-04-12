//
//  MainMenuScene.m
//  ZombieConga
//
//  Created by Adrian Phillips on 3/28/14.
//  Copyright (c) 2014 Adrian's Laptop. All rights reserved.
//

#import "MainMenuScene.h"
#import "Chapter.h"

@implementation MainMenuScene

- (instancetype)initWithSize:(CGSize)size {
    if ((self = [super initWithSize:size])) {
        SKSpriteNode * bg = [SKSpriteNode spriteNodeWithImageNamed:@"MainMenu"];
        bg.position = CGPointMake(self.size.width/2, self.size.height/2);
        [self addChild:bg];
    }
    return self;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    Chapter * chapter =[[Chapter alloc] initWithSize:self.size];
    
    SKTransition *reveal =
    [SKTransition doorwayWithDuration:0.5];
    
    [self.view presentScene:chapter transition: reveal];
}

@end
