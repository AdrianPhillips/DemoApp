//
//  GameOverScene.m
//  ZombieConga
//
//  Created by Adrian Phillips on 3/28/14.
//  Copyright (c) 2014 Adrian's Laptop. All rights reserved.
//

#import "GameOverScene.h"
#import "MyScene.h"

@implementation GameOverScene

- (id)initWithSize:(CGSize)size won:(BOOL)won {
    if (self = [super initWithSize:size]) { SKSpriteNode *bg;
        if (won) {
            bg = [SKSpriteNode spriteNodeWithImageNamed:@"YouWin.png"];
            [self runAction:[SKAction sequence:@[[SKAction waitForDuration:0.1],[SKAction playSoundFileNamed:@"win.wav" waitForCompletion:NO]]]];
            SKAction * wait = [SKAction waitForDuration:3.0];
            SKAction * block = [SKAction runBlock:^{ MyScene * myScene = [[MyScene alloc] initWithSize:self.size];
                SKTransition *reveal = [SKTransition flipHorizontalWithDuration:0.5];
                [self.view presentScene:myScene transition: reveal];
            }];
            [self runAction:[SKAction sequence:@[wait, block]]];
        } else {
            bg = [SKSpriteNode spriteNodeWithImageNamed:@"YouLose.png"];
            [self runAction:[SKAction sequence:@[[SKAction waitForDuration:0.1], [SKAction playSoundFileNamed:@"lose.wav" waitForCompletion:NO]]]];
            SKAction * wait = [SKAction waitForDuration:3.0];
            SKAction * block = [SKAction runBlock:^{ MyScene * myScene = [[MyScene alloc] initWithSize:self.size];
                SKTransition *reveal = [SKTransition flipHorizontalWithDuration:0.5];
                [self.view presentScene:myScene transition: reveal];
            }];
            [self runAction:[SKAction sequence:@[wait, block]]];
        }
        bg.position = CGPointMake(self.size.width/2, self.size.height/2);
        [self addChild:bg];
        // More here
    }
    return self;
}

@end
