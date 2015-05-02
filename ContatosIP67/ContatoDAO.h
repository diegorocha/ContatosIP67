//
//  ContatoDAO.h
//  ContatosIP67
//
//  Created by ios5065 on 11/04/15.
//  Copyright (c) 2015 Caelum. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Contato.h"

@interface ContatoDAO : NSObject

@property (strong, readonly) NSMutableArray *contatos;

+ (id) contatoDaoInstance;
- (void) adicionaContato: (Contato *) contato;
- (Contato *)buscaContatoDaPosicao:(NSInteger)posicao;
- (void)removeContatoDaPosicao: (NSInteger)posicao;
-(NSInteger) buscaPosicaoDoContato:(Contato *)contato;
@end
