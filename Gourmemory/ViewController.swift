//
//  ViewController.swift
//  Gourmemory
//
//  Created by Kiwami on 2017/02/02.
//  Copyright © 2017年 Kiwami. All rights reserved.
//

import UIKit

import MapKit

// MKMapViewDelegate の追加
class ViewController: UIViewController, MKMapViewDelegate {
    
    
    let coordiate = CLLocationCoordinate2DMake(37.331652997806785, -122.03072304117417)
    
    let span = MKCoordinateSpanMake(0.01 , 0.01)
    
    let annotaion = MKPointAnnotation()
    
       @IBOutlet var mapView:MKMapView!
    
    override func viewDidLoad() {
        
        let region = MKCoordinateRegionMake(coordiate, span)
        mapView.setRegion(region, animated:true)

        annotaion.coordinate = CLLocationCoordinate2DMake(37.331652997806785, -122.03072304117417)
        annotaion.title = "title"
        annotaion.subtitle = "subtitle"
        self.mapView.addAnnotation(annotaion)
        
        super.viewDidLoad()
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
}
