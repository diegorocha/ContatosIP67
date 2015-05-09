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
#import <CoreLocation/CoreLocation.h>

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
        self.contato = [self.dao novoContato];
    }
    
    self.contato.nome = nome;
    self.contato.telefone = telefone;
    self.contato.email = email;
    self.contato.endereco = endereco;
    self.contato.site = site;
    
    self.contato.lat = [NSNumber numberWithFloat:[self.lat.text floatValue]];
    self.contato.lng = [NSNumber numberWithFloat:[self.lng.text floatValue]];
    
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
        self.lat.text = [self.contato.lat stringValue];
        self.lng.text = [self.contato.lng stringValue];
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

-(IBAction)buscarCoordenadas:(UIButton *)botao{
    [self.loading startAnimating];
    botao.hidden = YES;
    CLGeocoder *geocoder = [CLGeocoder new];
    [geocoder geocodeAddressString:self.endereco.text completionHandler:^(NSArray *resultados, NSError *error) {
        if(error == nil && [resultados count] > 0){
            CLPlacemark *resultado = resultados[0];
            CLLocationCoordinate2D coordenada = resultado.location.coordinate;
            self.lat.text = [NSString stringWithFormat:@"%f", coordenada.latitude];
            self.lng.text = [NSString stringWithFormat:@"%f", coordenada.longitude];
        }else{
            [self exibeAlertViewWithTitle: @"Oops!" andMessage: [NSString stringWithFormat: @"Não foi possível localizar o endereço: %@", error]];
        }
        [self.loading stopAnimating];
        botao.hidden = NO;
    }];
}

-(void)exibeAlertViewWithTitle: (NSString *)title andMessage: (NSString *)message {
    [[[UIAlertView alloc] initWithTitle: title message:message delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles: nil] show];
}

@end
