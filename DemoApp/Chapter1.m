//
//  Chapter1.m
//  ZombieConga
//
//  Created by Adrian Phillips on 4/6/14.
//  Copyright (c) 2014 Adrian's Laptop. All rights reserved.
//

#import "Chapter1.h"
#import "MyScene7.h"
#import "MyScene.h"
#import "MainMenuScene1.h"

@interface Chapter1 ()
@property BOOL contentCreated;

@end
@implementation Chapter1
- (id)initWithSize:(CGSize)size {
    if (self = [super initWithSize:size]) {
        
        SKSpriteNode * bg = [SKSpriteNode spriteNodeWithImageNamed:@"MainMenu"];
        bg.position = CGPointMake(self.size.width/2, self.size.height/2);
        bg.alpha = 0.4;
        [self addChild:bg];
        
        // to do: remove this label if you don't need it.
        
        SKLabelNode *myLabel = [SKLabelNode labelNodeWithFontNamed:@"Thonburi-Bold"];
        
        myLabel.text = @"Chapters";// Note: name the chapters
        myLabel.fontSize = 30;
        myLabel.fontColor = [UIColor whiteColor];
        myLabel.position = CGPointMake(CGRectGetMidX(self.frame),280);
        [self addChild:myLabel];
    }
    return self;
}

- (void)didMoveToView: (SKView *) view
{
    if (!self.contentCreated)
    {
        [self createSceneContents];
        self.contentCreated = YES;
    }
}

- (void)createSceneContents
{
    
    // to do: create a generic BG for this section
    
    //self.backgroundColor = [SKColor blueColor];
    //self.scaleMode = SKSceneScaleModeAspectFit;
    [self addChild: [self button]];
    [self addChild: [self button1]];
    [self addChild: [self backButton]];
}

- (SKLabelNode *)backButton
{
    SKLabelNode *button = [SKLabelNode labelNodeWithFontNamed:@"Thonburi-Bold"];
    button.text = @"Return";
    button.fontSize = 25;
    button.position = CGPointMake(450, 50);
    button.name = @"Back";
    return button;
}

- (SKLabelNode *)button
{
    SKLabelNode *button = [SKLabelNode labelNodeWithFontNamed:@"Thonburi-Bold"];
    button.text = @"Zombie 1";
    button.fontSize = 25;
    button.position = CGPointMake(80, 200);
    button.name = @"button";
    return button;
}

- (SKLabelNode *)button1
{
    SKLabelNode *button = [SKLabelNode labelNodeWithFontNamed:@"Thonburi-Bold"];
    button.text = @"Zombie 2";
    button.fontSize = 25;
    button.position = CGPointMake(80, 100);
    button.name = @"button1";
    return button;
}
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    CGPoint location = [touch locationInNode:self];
    SKNode *node = [self nodeAtPoint:location];
    
    if ([node.name isEqualToString:@"button"]) {
        [self runButtonActionOnNode:node];
    }
    if ([node.name isEqualToString:@"button1"]) {
        [self runButtonActionOnNode1:node];
    }
    else if ([node.name isEqualToString:@"Back"]) {
        [self runButtonActionOnNodeBack:node];
    }
}

-(void)runButtonActionOnNodeBack:(SKNode*) node{
    node.name = nil;
    //SKAction *moveUp = [SKAction moveByX: 0 y: 100.0 duration: 0.5];
    SKAction *zoom = [SKAction scaleTo: 1.5 duration: 0.25];
    SKAction *pause = [SKAction waitForDuration: 0.5];
    SKAction *fadeAway = [SKAction fadeOutWithDuration: 0.25];
    SKAction *remove = [SKAction removeFromParent];
    SKAction *moveSequence = [SKAction sequence:@[zoom, pause, fadeAway, remove]];
    [node runAction: moveSequence completion:^{
        SKScene *mainMenu1  = [[MainMenuScene1 alloc] initWithSize:self.size];
        SKTransition *doors = [SKTransition doorsOpenVerticalWithDuration:0.5];
        [self.view presentScene:mainMenu1 transition:doors];
    }];
}

-(void)runButtonActionOnNode:(SKNode*) node{
    node.name = nil;
    //SKAction *moveUp = [SKAction moveByX: 0 y: 100.0 duration: 0.5];
    SKAction *zoom = [SKAction scaleTo: 1.5 duration: 0.25];
    SKAction *pause = [SKAction waitForDuration: 0.5];
    SKAction *fadeAway = [SKAction fadeOutWithDuration: 0.25];
    SKAction *remove = [SKAction removeFromParent];
    SKAction *moveSequence = [SKAction sequence:@[zoom, pause, fadeAway, remove]];
    [node runAction: moveSequence completion:^{
        SKScene *myScene  = [[MyScene alloc] initWithSize:self.size];
        SKTransition *doors = [SKTransition doorsOpenVerticalWithDuration:0.5];
        [self.view presentScene:myScene transition:doors];
    }];
}
-(void)runButtonActionOnNode1:(SKNode*) node{
    node.name = nil;
    //SKAction *moveUp = [SKAction moveByX: 0 y: 100.0 duration: 0.5];
    SKAction *zoom = [SKAction scaleTo: 1.5 duration: 0.25];
    SKAction *pause = [SKAction waitForDuration: 0.5];
    SKAction *fadeAway = [SKAction fadeOutWithDuration: 0.25];
    SKAction *remove = [SKAction removeFromParent];
    SKAction *moveSequence = [SKAction sequence:@[zoom, pause, fadeAway, remove]];
    [node runAction: moveSequence completion:^{
        SKScene *myScene7  = [[MyScene7 alloc] initWithSize:self.size];
        SKTransition *doors = [SKTransition doorsOpenVerticalWithDuration:0.5];
        [self.view presentScene:myScene7 transition:doors];
    }];
}

@end
