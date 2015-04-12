//
//  ViewController.m
//  ContatosIP67
//
//  Created by ios5065 on 11/04/15.
//  Copyright (c) 2015 Caelum. All rights reserved.
//

#import "FormularioContatoViewController.h"
#import "Contato.h"
#import "ContatoDAO.h"

@interface FormularioContatoViewController ()

@end

@implementation FormularioContatoViewController

-(id)initWithCoder:(NSCoder *)aDecoder{
    self = [super initWithCoder:aDecoder];
    if(self){
        self.dao = [ContatoDAO contatoDaoInstance];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)pegaDadosDoFormulario{
    NSString *nome = [self.nome text];
    NSString *telefone = [self.telefone text];
    NSString *email = [self.email text];
    NSString *endereco = [self.endereco text];
    NSString *site = [self.site text];
    
    Contato *contato = [Contato new];
    contato.nome = nome;
    contato.telefone = telefone;
    contato.email = email;
    contato.endereco = endereco;
    contato.site = site;
    
    //NSLog(@"Contato: %@", contato);
    [self.dao adicionaContato:contato];
    
}

@end
