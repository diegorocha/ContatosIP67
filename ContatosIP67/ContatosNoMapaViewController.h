//
//  ContatosNoMapaViewController.h
//  ContatosIP67
//
//  Created by ios5065 on 02/05/15.
//  Copyright (c) 2015 Caelum. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import "ContatoDAO.h"

@interface ContatosNoMapaViewController : UIViewController<MKMapViewDelegate>

@property (weak, nonatomic) IBOutlet MKMapView *mapa;
@property CLLocationManager *manager;
@property(nonatomic, weak) NSMutableArray *contatos;
@property(strong) ContatoDAO* dao;
@end
