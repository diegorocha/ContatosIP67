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
        self.navigationItem.title = @"Cadastro";
        
        UIBarButtonItem *adiciona = [[UIBarButtonItem alloc]initWithTitle:@"Adiciona" style:UIBarButtonItemStylePlain target:self action:@selector(criaContato)];
        self.navigationItem.rightBarButtonItem = adiciona;
        self.botaoFoto.layer.borderColor = [UIColor grayColor].CGColor;
        self.botaoFoto.layer.borderWidth = 0.8;
    }
    return self;
}

- (IBAction)pegaDadosDoFormulario{
    NSString *nome = [self.nome text];
    NSString *telefone = [self.telefone text];
    NSString *email = [self.email text];
    NSString *endereco = [self.endereco text];
    NSString *site = [self.site text];
    
    if(!self.contato){
        self.contato = [Contato new];
    }
    
    self.contato.nome = nome;
    self.contato.telefone = telefone;
    self.contato.email = email;
    self.contato.endereco = endereco;
    self.contato.site = site;
    
    UIImage *backgroundBotao = [self.botaoFoto backgroundImageForState:UIControlStateNormal];
    if(backgroundBotao){
        self.contato.foto = backgroundBotao;
    }
    
    NSLog(@"%@", self.contato);
}

-(void) atualizaContato {
    [self pegaDadosDoFormulario];
    if(self.delegate){
        [self.delegate contatoAdicionado:self.contato];
    }
    [self.navigationController popToRootViewControllerAnimated:YES];
}

-(void)criaContato{
    [self pegaDadosDoFormulario];
    [self.dao adicionaContato:self.contato];
    if(self.delegate){
        [self.delegate contatoAdicionado:self.contato];
    }
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)viewDidLoad {
    if(self.contato){
        self.navigationItem.title = @"Alterar";
        UIBarButtonItem *confirmar = [[UIBarButtonItem alloc] initWithTitle:@"Confirmar" style:UIBarButtonItemStylePlain target:self action:@selector(atualizaContato)];
        self.navigationItem.rightBarButtonItem = confirmar;
        
        self.nome.text = self.contato.nome;
        self.telefone.text = self.contato.telefone;
        self.email.text = self.contato.email;
        self.endereco.text = self.contato.endereco;
        self.site.text = self.contato.site;
        if(self.contato.foto){
            [self.botaoFoto setBackgroundImage:self.contato.foto forState:UIControlStateNormal];
            [self.botaoFoto setTitle:nil forState:UIControlStateNormal];
        }
    }
}

-(IBAction)selecionaFoto:(id)sender{
    if([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]){
        //Camera
    }else{
        UIImagePickerController *picker = [UIImagePickerController new];
        picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        picker.allowsEditing = YES;
        picker.delegate = self;
        [self presentViewController:picker animated:YES completion:nil];
    }
}

-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info{
    UIImage *imagemSelecionada = [info valueForKey:UIImagePickerControllerEditedImage];
    [self.botaoFoto setBackgroundImage:imagemSelecionada forState:UIControlStateNormal];
    [self.botaoFoto setTitle:nil forState:UIControlStateNormal];
    [picker dismissViewControllerAnimated:YES completion:nil];
}

@end
