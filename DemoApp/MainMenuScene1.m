//
//  MainMenuScene1.m
//  ZombieConga
//
//  Created by Adrian Phillips on 4/6/14.
//  Copyright (c) 2014 Adrian's Laptop. All rights reserved.
//

#import "MainMenuScene1.h"
#import "Chapter1.h"
@implementation MainMenuScene1

- (instancetype)initWithSize:(CGSize)size {
    if ((self = [super initWithSize:size])) {
        SKSpriteNode * bg = [SKSpriteNode spriteNodeWithImageNamed:@"MainMenu"];
        bg.position = CGPointMake(self.size.width/2, self.size.height/2);
        [self addChild:bg];
    }
    return self;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    Chapter1 * chapter1 =[[Chapter1 alloc] initWithSize:self.size];
    
    SKTransition *reveal =
    [SKTransition doorwayWithDuration:0.5];
    
    [self.view presentScene:chapter1 transition: reveal];
}

@end
