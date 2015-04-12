//
//  ContatoDAO.m
//  ContatosIP67
//
//  Created by ios5065 on 11/04/15.
//  Copyright (c) 2015 Caelum. All rights reserved.
//

#import "ContatoDAO.h"

@implementation ContatoDAO

static ContatoDAO *defaultDao = nil;

-(id)init{
    self = [super init];
    if(self){
        _contatos = [NSMutableArray new];
    }
    return self;
}

+(id) contatoDaoInstance{
    if(!defaultDao){
        defaultDao = [ContatoDAO new];
    }
    return defaultDao;
}

-(void)adicionaContato:(Contato *)contato{
    [self.contatos addObject:contato];
}

@end
