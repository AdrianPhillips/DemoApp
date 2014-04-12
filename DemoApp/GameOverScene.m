//
//  GameOverScene.m
//  ZombieConga
//
//  Created by Adrian Phillips on 3/28/14.
//  Copyright (c) 2014 Adrian's Laptop. All rights reserved.
//

#import "GameOverScene.h"
#import "MyScene.h"
#import "MyScene1.h"
#import "MyScene2.h"
#import "MyScene3.h"
#import "MyScene4.h"
#import "MyScene5.h"
#import "MyScene6.h"
#import "MyScene7.h"
#import "MyScene8.h"
#import "MyScene9.h"
#import "MyScene10.h"
#import "MyScene11.h"
#import "MyScene12.h"
#import "MyScene13.h"
#import "Chapter.h"
#import "Chapter1.h"

@implementation GameOverScene

- (id)initWithSize:(CGSize)size won:(BOOL)won {
    if (self = [super initWithSize:size]) { SKSpriteNode *bg;
        if (won) {
            bg = [SKSpriteNode spriteNodeWithImageNamed:@"YouWin.png"];
            [self runAction:[SKAction sequence:@[[SKAction waitForDuration:0.1],[SKAction playSoundFileNamed:@"win.wav" waitForCompletion:NO]]]];
            SKAction * wait = [SKAction waitForDuration:3.0];
            SKAction * block = [SKAction runBlock:^{ MyScene1 * myScene = [[MyScene1 alloc] initWithSize:self.size];
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

- (id)initWithSize:(CGSize)size won1:(BOOL)won1 {
    if (self = [super initWithSize:size]) { SKSpriteNode *bg;
        if (won1) {
            bg = [SKSpriteNode spriteNodeWithImageNamed:@"YouWin.png"];
            [self runAction:[SKAction sequence:@[[SKAction waitForDuration:0.1],[SKAction playSoundFileNamed:@"win.wav" waitForCompletion:NO]]]];
            SKAction * wait = [SKAction waitForDuration:3.0];
            SKAction * block = [SKAction runBlock:^{ MyScene2 * myScene2 = [[MyScene2 alloc] initWithSize:self.size];
                SKTransition *reveal = [SKTransition flipHorizontalWithDuration:0.5];
                [self.view presentScene:myScene2 transition: reveal];
            }];
            [self runAction:[SKAction sequence:@[wait, block]]];
        } else {
            bg = [SKSpriteNode spriteNodeWithImageNamed:@"YouLose.png"];
            [self runAction:[SKAction sequence:@[[SKAction waitForDuration:0.1], [SKAction playSoundFileNamed:@"lose.wav" waitForCompletion:NO]]]];
            SKAction * wait = [SKAction waitForDuration:3.0];
            SKAction * block = [SKAction runBlock:^{ MyScene1 * myScene1 = [[MyScene1 alloc] initWithSize:self.size];
                SKTransition *reveal = [SKTransition flipHorizontalWithDuration:0.5];
                [self.view presentScene:myScene1 transition: reveal];
            }];
            [self runAction:[SKAction sequence:@[wait, block]]];
        }
        bg.position = CGPointMake(self.size.width/2, self.size.height/2);
        [self addChild:bg];
        // More here
    }
    return self;
}

- (id)initWithSize:(CGSize)size won2:(BOOL)won2 {
    if (self = [super initWithSize:size]) { SKSpriteNode *bg;
        if (won2) {
            bg = [SKSpriteNode spriteNodeWithImageNamed:@"YouWin.png"];
            [self runAction:[SKAction sequence:@[[SKAction waitForDuration:0.1],[SKAction playSoundFileNamed:@"win.wav" waitForCompletion:NO]]]];
            SKAction * wait = [SKAction waitForDuration:3.0];
            SKAction * block = [SKAction runBlock:^{ MyScene3 * myScene3 = [[MyScene3 alloc] initWithSize:self.size];
                SKTransition *reveal = [SKTransition flipHorizontalWithDuration:0.5];
                [self.view presentScene:myScene3 transition: reveal];
            }];
            [self runAction:[SKAction sequence:@[wait, block]]];
        } else {
            bg = [SKSpriteNode spriteNodeWithImageNamed:@"YouLose.png"];
            [self runAction:[SKAction sequence:@[[SKAction waitForDuration:0.1], [SKAction playSoundFileNamed:@"lose.wav" waitForCompletion:NO]]]];
            SKAction * wait = [SKAction waitForDuration:3.0];
            SKAction * block = [SKAction runBlock:^{ MyScene2 * myScene2 = [[MyScene2 alloc] initWithSize:self.size];
                SKTransition *reveal = [SKTransition flipHorizontalWithDuration:0.5];
                [self.view presentScene:myScene2 transition: reveal];
            }];
            [self runAction:[SKAction sequence:@[wait, block]]];
        }
        bg.position = CGPointMake(self.size.width/2, self.size.height/2);
        [self addChild:bg];
        // More here
    }
    return self;
}

- (id)initWithSize:(CGSize)size won3:(BOOL)won3 {
    if (self = [super initWithSize:size]) { SKSpriteNode *bg;
        if (won3) {
            bg = [SKSpriteNode spriteNodeWithImageNamed:@"YouWin.png"];
            [self runAction:[SKAction sequence:@[[SKAction waitForDuration:0.1],[SKAction playSoundFileNamed:@"win.wav" waitForCompletion:NO]]]];
            SKAction * wait = [SKAction waitForDuration:3.0];
            SKAction * block = [SKAction runBlock:^{ MyScene4 * myScene4 = [[MyScene4 alloc] initWithSize:self.size];
                SKTransition *reveal = [SKTransition flipHorizontalWithDuration:0.5];
                [self.view presentScene:myScene4 transition: reveal];
            }];
            [self runAction:[SKAction sequence:@[wait, block]]];
        } else {
            bg = [SKSpriteNode spriteNodeWithImageNamed:@"YouLose.png"];
            [self runAction:[SKAction sequence:@[[SKAction waitForDuration:0.1], [SKAction playSoundFileNamed:@"lose.wav" waitForCompletion:NO]]]];
            SKAction * wait = [SKAction waitForDuration:3.0];
            SKAction * block = [SKAction runBlock:^{ MyScene3 * myScene3 = [[MyScene3 alloc] initWithSize:self.size];
                SKTransition *reveal = [SKTransition flipHorizontalWithDuration:0.5];
                [self.view presentScene:myScene3 transition: reveal];
            }];
            [self runAction:[SKAction sequence:@[wait, block]]];
        }
        bg.position = CGPointMake(self.size.width/2, self.size.height/2);
        [self addChild:bg];
        // More here
    }
    return self;
}

- (id)initWithSize:(CGSize)size won4:(BOOL)won4 {
    if (self = [super initWithSize:size]) { SKSpriteNode *bg;
        if (won4) {
            bg = [SKSpriteNode spriteNodeWithImageNamed:@"YouWin.png"];
            [self runAction:[SKAction sequence:@[[SKAction waitForDuration:0.1],[SKAction playSoundFileNamed:@"win.wav" waitForCompletion:NO]]]];
            SKAction * wait = [SKAction waitForDuration:3.0];
            SKAction * block = [SKAction runBlock:^{ MyScene5 * myScene5 = [[MyScene5 alloc] initWithSize:self.size];
                SKTransition *reveal = [SKTransition flipHorizontalWithDuration:0.5];
                [self.view presentScene:myScene5 transition: reveal];
            }];
            [self runAction:[SKAction sequence:@[wait, block]]];
        } else {
            bg = [SKSpriteNode spriteNodeWithImageNamed:@"YouLose.png"];
            [self runAction:[SKAction sequence:@[[SKAction waitForDuration:0.1], [SKAction playSoundFileNamed:@"lose.wav" waitForCompletion:NO]]]];
            SKAction * wait = [SKAction waitForDuration:3.0];
            SKAction * block = [SKAction runBlock:^{ MyScene4 * myScene4 = [[MyScene4 alloc] initWithSize:self.size];
                SKTransition *reveal = [SKTransition flipHorizontalWithDuration:0.5];
                [self.view presentScene:myScene4 transition: reveal];
            }];
            [self runAction:[SKAction sequence:@[wait, block]]];
        }
        bg.position = CGPointMake(self.size.width/2, self.size.height/2);
        [self addChild:bg];
        // More here
    }
    return self;
}

- (id)initWithSize:(CGSize)size won5:(BOOL)won5 {
    if (self = [super initWithSize:size]) { SKSpriteNode *bg;
        if (won5) {
            bg = [SKSpriteNode spriteNodeWithImageNamed:@"YouWin.png"];
            [self runAction:[SKAction sequence:@[[SKAction waitForDuration:0.1],[SKAction playSoundFileNamed:@"win.wav" waitForCompletion:NO]]]];
            SKAction * wait = [SKAction waitForDuration:3.0];
            SKAction * block = [SKAction runBlock:^{ MyScene6 * myScene6 = [[MyScene6 alloc] initWithSize:self.size];
                SKTransition *reveal = [SKTransition flipHorizontalWithDuration:0.5];
                [self.view presentScene:myScene6 transition: reveal];
            }];
            [self runAction:[SKAction sequence:@[wait, block]]];
        } else {
            bg = [SKSpriteNode spriteNodeWithImageNamed:@"YouLose.png"];
            [self runAction:[SKAction sequence:@[[SKAction waitForDuration:0.1], [SKAction playSoundFileNamed:@"lose.wav" waitForCompletion:NO]]]];
            SKAction * wait = [SKAction waitForDuration:3.0];
            SKAction * block = [SKAction runBlock:^{ MyScene5 * myScene5 = [[MyScene5 alloc] initWithSize:self.size];
                SKTransition *reveal = [SKTransition flipHorizontalWithDuration:0.5];
                [self.view presentScene:myScene5 transition: reveal];
            }];
            [self runAction:[SKAction sequence:@[wait, block]]];
        }
        bg.position = CGPointMake(self.size.width/2, self.size.height/2);
        [self addChild:bg];
        // More here
    }
    return self;
}
- (id)initWithSize:(CGSize)size won6:(BOOL)won6 {
    if (self = [super initWithSize:size]) { SKSpriteNode *bg;
        if (won6) {
            bg = [SKSpriteNode spriteNodeWithImageNamed:@"YouWin.png"];
            [self runAction:[SKAction sequence:@[[SKAction waitForDuration:0.1],[SKAction playSoundFileNamed:@"win.wav" waitForCompletion:NO]]]];
            SKAction * wait = [SKAction waitForDuration:3.0];
            SKAction * block = [SKAction runBlock:^{ Chapter1 * chapter1 = [[Chapter1 alloc] initWithSize:self.size];
                SKTransition *reveal = [SKTransition flipHorizontalWithDuration:0.5];
                [self.view presentScene:chapter1 transition: reveal];
            }];
            [self runAction:[SKAction sequence:@[wait, block]]];
        } else {
            bg = [SKSpriteNode spriteNodeWithImageNamed:@"YouLose.png"];
            [self runAction:[SKAction sequence:@[[SKAction waitForDuration:0.1], [SKAction playSoundFileNamed:@"lose.wav" waitForCompletion:NO]]]];
            SKAction * wait = [SKAction waitForDuration:3.0];
            SKAction * block = [SKAction runBlock:^{ MyScene6 * myScene6 = [[MyScene6 alloc] initWithSize:self.size];
                SKTransition *reveal = [SKTransition flipHorizontalWithDuration:0.5];
                [self.view presentScene:myScene6 transition: reveal];
            }];
            [self runAction:[SKAction sequence:@[wait, block]]];
        }
        bg.position = CGPointMake(self.size.width/2, self.size.height/2);
        [self addChild:bg];
        // More here
    }
    return self;
}
- (id)initWithSize:(CGSize)size won7:(BOOL)won7 {
    if (self = [super initWithSize:size]) { SKSpriteNode *bg;
        if (won7) {
            bg = [SKSpriteNode spriteNodeWithImageNamed:@"YouWin.png"];
            [self runAction:[SKAction sequence:@[[SKAction waitForDuration:0.1],[SKAction playSoundFileNamed:@"win.wav" waitForCompletion:NO]]]];
            SKAction * wait = [SKAction waitForDuration:3.0];
            SKAction * block = [SKAction runBlock:^{ MyScene8 * myScene8 = [[MyScene8 alloc] initWithSize:self.size];
                SKTransition *reveal = [SKTransition flipHorizontalWithDuration:0.5];
                [self.view presentScene:myScene8 transition: reveal];
            }];
            [self runAction:[SKAction sequence:@[wait, block]]];
        } else {
            bg = [SKSpriteNode spriteNodeWithImageNamed:@"YouLose.png"];
            [self runAction:[SKAction sequence:@[[SKAction waitForDuration:0.1], [SKAction playSoundFileNamed:@"lose.wav" waitForCompletion:NO]]]];
            SKAction * wait = [SKAction waitForDuration:3.0];
            SKAction * block = [SKAction runBlock:^{ MyScene7 * myScene7 = [[MyScene7 alloc] initWithSize:self.size];
                SKTransition *reveal = [SKTransition flipHorizontalWithDuration:0.5];
                [self.view presentScene:myScene7 transition: reveal];
            }];
            [self runAction:[SKAction sequence:@[wait, block]]];
        }
        bg.position = CGPointMake(self.size.width/2, self.size.height/2);
        [self addChild:bg];
        // More here
    }
    return self;
}
- (id)initWithSize:(CGSize)size won8:(BOOL)won8 {
    if (self = [super initWithSize:size]) { SKSpriteNode *bg;
        if (won8) {
            bg = [SKSpriteNode spriteNodeWithImageNamed:@"YouWin.png"];
            [self runAction:[SKAction sequence:@[[SKAction waitForDuration:0.1],[SKAction playSoundFileNamed:@"win.wav" waitForCompletion:NO]]]];
            SKAction * wait = [SKAction waitForDuration:3.0];
            SKAction * block = [SKAction runBlock:^{ MyScene9 * myScene9 = [[MyScene9 alloc] initWithSize:self.size];
                SKTransition *reveal = [SKTransition flipHorizontalWithDuration:0.5];
                [self.view presentScene:myScene9 transition: reveal];
            }];
            [self runAction:[SKAction sequence:@[wait, block]]];
        } else {
            bg = [SKSpriteNode spriteNodeWithImageNamed:@"YouLose.png"];
            [self runAction:[SKAction sequence:@[[SKAction waitForDuration:0.1], [SKAction playSoundFileNamed:@"lose.wav" waitForCompletion:NO]]]];
            SKAction * wait = [SKAction waitForDuration:3.0];
            SKAction * block = [SKAction runBlock:^{ MyScene8 * myScene8 = [[MyScene8 alloc] initWithSize:self.size];
                SKTransition *reveal = [SKTransition flipHorizontalWithDuration:0.5];
                [self.view presentScene:myScene8 transition: reveal];
            }];
            [self runAction:[SKAction sequence:@[wait, block]]];
        }
        bg.position = CGPointMake(self.size.width/2, self.size.height/2);
        [self addChild:bg];
        // More here
    }
    return self;
}
- (id)initWithSize:(CGSize)size won9:(BOOL)won9 {
    if (self = [super initWithSize:size]) { SKSpriteNode *bg;
        if (won9) {
            bg = [SKSpriteNode spriteNodeWithImageNamed:@"YouWin.png"];
            [self runAction:[SKAction sequence:@[[SKAction waitForDuration:0.1],[SKAction playSoundFileNamed:@"win.wav" waitForCompletion:NO]]]];
            SKAction * wait = [SKAction waitForDuration:3.0];
            SKAction * block = [SKAction runBlock:^{ MyScene10 * myScene10 = [[MyScene10 alloc] initWithSize:self.size];
                SKTransition *reveal = [SKTransition flipHorizontalWithDuration:0.5];
                [self.view presentScene:myScene10 transition: reveal];
            }];
            [self runAction:[SKAction sequence:@[wait, block]]];
        } else {
            bg = [SKSpriteNode spriteNodeWithImageNamed:@"YouLose.png"];
            [self runAction:[SKAction sequence:@[[SKAction waitForDuration:0.1], [SKAction playSoundFileNamed:@"lose.wav" waitForCompletion:NO]]]];
            SKAction * wait = [SKAction waitForDuration:3.0];
            SKAction * block = [SKAction runBlock:^{ MyScene9 * myScene9 = [[MyScene9 alloc] initWithSize:self.size];
                SKTransition *reveal = [SKTransition flipHorizontalWithDuration:0.5];
                [self.view presentScene:myScene9 transition: reveal];
            }];
            [self runAction:[SKAction sequence:@[wait, block]]];
        }
        bg.position = CGPointMake(self.size.width/2, self.size.height/2);
        [self addChild:bg];
        // More here
    }
    return self;
}
- (id)initWithSize:(CGSize)size won10:(BOOL)won10 {
    if (self = [super initWithSize:size]) { SKSpriteNode *bg;
        if (won10) {
            bg = [SKSpriteNode spriteNodeWithImageNamed:@"YouWin.png"];
            [self runAction:[SKAction sequence:@[[SKAction waitForDuration:0.1],[SKAction playSoundFileNamed:@"win.wav" waitForCompletion:NO]]]];
            SKAction * wait = [SKAction waitForDuration:3.0];
            SKAction * block = [SKAction runBlock:^{ MyScene11 * myScene11 = [[MyScene11 alloc] initWithSize:self.size];
                SKTransition *reveal = [SKTransition flipHorizontalWithDuration:0.5];
                [self.view presentScene:myScene11 transition: reveal];
            }];
            [self runAction:[SKAction sequence:@[wait, block]]];
        } else {
            bg = [SKSpriteNode spriteNodeWithImageNamed:@"YouLose.png"];
            [self runAction:[SKAction sequence:@[[SKAction waitForDuration:0.1], [SKAction playSoundFileNamed:@"lose.wav" waitForCompletion:NO]]]];
            SKAction * wait = [SKAction waitForDuration:3.0];
            SKAction * block = [SKAction runBlock:^{ MyScene10 * myScene10 = [[MyScene10 alloc] initWithSize:self.size];
                SKTransition *reveal = [SKTransition flipHorizontalWithDuration:0.5];
                [self.view presentScene:myScene10 transition: reveal];
            }];
            [self runAction:[SKAction sequence:@[wait, block]]];
        }
        bg.position = CGPointMake(self.size.width/2, self.size.height/2);
        [self addChild:bg];
        // More here
    }
    return self;
}
- (id)initWithSize:(CGSize)size won11:(BOOL)won11 {
    if (self = [super initWithSize:size]) { SKSpriteNode *bg;
        if (won11) {
            bg = [SKSpriteNode spriteNodeWithImageNamed:@"YouWin.png"];
            [self runAction:[SKAction sequence:@[[SKAction waitForDuration:0.1],[SKAction playSoundFileNamed:@"win.wav" waitForCompletion:NO]]]];
            SKAction * wait = [SKAction waitForDuration:3.0];
            SKAction * block = [SKAction runBlock:^{ MyScene12 * myScene12 = [[MyScene12 alloc] initWithSize:self.size];
                SKTransition *reveal = [SKTransition flipHorizontalWithDuration:0.5];
                [self.view presentScene:myScene12 transition: reveal];
            }];
            [self runAction:[SKAction sequence:@[wait, block]]];
        } else {
            bg = [SKSpriteNode spriteNodeWithImageNamed:@"YouLose.png"];
            [self runAction:[SKAction sequence:@[[SKAction waitForDuration:0.1], [SKAction playSoundFileNamed:@"lose.wav" waitForCompletion:NO]]]];
            SKAction * wait = [SKAction waitForDuration:3.0];
            SKAction * block = [SKAction runBlock:^{ MyScene11 * myScene11 = [[MyScene11 alloc] initWithSize:self.size];
                SKTransition *reveal = [SKTransition flipHorizontalWithDuration:0.5];
                [self.view presentScene:myScene11 transition: reveal];
            }];
            [self runAction:[SKAction sequence:@[wait, block]]];
        }
        bg.position = CGPointMake(self.size.width/2, self.size.height/2);
        [self addChild:bg];
        // More here
    }
    return self;
}
- (id)initWithSize:(CGSize)size won12:(BOOL)won12 {
    if (self = [super initWithSize:size]) { SKSpriteNode *bg;
        if (won12) {
            bg = [SKSpriteNode spriteNodeWithImageNamed:@"YouWin.png"];
            [self runAction:[SKAction sequence:@[[SKAction waitForDuration:0.1],[SKAction playSoundFileNamed:@"win.wav" waitForCompletion:NO]]]];
            SKAction * wait = [SKAction waitForDuration:3.0];
            SKAction * block = [SKAction runBlock:^{ MyScene13 * myScene13 = [[MyScene13 alloc] initWithSize:self.size];
                SKTransition *reveal = [SKTransition flipHorizontalWithDuration:0.5];
                [self.view presentScene:myScene13 transition: reveal];
            }];
            [self runAction:[SKAction sequence:@[wait, block]]];
        } else {
            bg = [SKSpriteNode spriteNodeWithImageNamed:@"YouLose.png"];
            [self runAction:[SKAction sequence:@[[SKAction waitForDuration:0.1], [SKAction playSoundFileNamed:@"lose.wav" waitForCompletion:NO]]]];
            SKAction * wait = [SKAction waitForDuration:3.0];
            SKAction * block = [SKAction runBlock:^{ MyScene12 * myScene12 = [[MyScene12 alloc] initWithSize:self.size];
                SKTransition *reveal = [SKTransition flipHorizontalWithDuration:0.5];
                [self.view presentScene:myScene12 transition: reveal];
            }];
            [self runAction:[SKAction sequence:@[wait, block]]];
        }
        bg.position = CGPointMake(self.size.width/2, self.size.height/2);
        [self addChild:bg];
        // More here
    }
    return self;
}
- (id)initWithSize:(CGSize)size won13:(BOOL)won13 {
    if (self = [super initWithSize:size]) { SKSpriteNode *bg;
        if (won13) {
            bg = [SKSpriteNode spriteNodeWithImageNamed:@"YouWin.png"];
            [self runAction:[SKAction sequence:@[[SKAction waitForDuration:0.1],[SKAction playSoundFileNamed:@"win.wav" waitForCompletion:NO]]]];
            SKAction * wait = [SKAction waitForDuration:3.0];
            SKAction * block = [SKAction runBlock:^{ MyScene13 * myScene13 = [[MyScene13 alloc] initWithSize:self.size];
                SKTransition *reveal = [SKTransition flipHorizontalWithDuration:0.5];
                [self.view presentScene:myScene13 transition: reveal];
            }];
            [self runAction:[SKAction sequence:@[wait, block]]];
        } else {
            bg = [SKSpriteNode spriteNodeWithImageNamed:@"YouLose.png"];
            [self runAction:[SKAction sequence:@[[SKAction waitForDuration:0.1], [SKAction playSoundFileNamed:@"lose.wav" waitForCompletion:NO]]]];
            SKAction * wait = [SKAction waitForDuration:3.0];
            SKAction * block = [SKAction runBlock:^{ MyScene12 * myScene12 = [[MyScene12 alloc] initWithSize:self.size];
                SKTransition *reveal = [SKTransition flipHorizontalWithDuration:0.5];
                [self.view presentScene:myScene12 transition: reveal];
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
