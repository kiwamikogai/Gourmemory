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
    
    @IBOutlet var mapView:MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 緯度・軽度を設定
        let location:CLLocationCoordinate2D
            = CLLocationCoordinate2DMake(35.68154,139.752498)
        
        mapView.setCenter(location,animated:true)
        
        // 縮尺を設定
        var region:MKCoordinateRegion = mapView.region
        region.center = location
        region.span.latitudeDelta = 0.02
        region.span.longitudeDelta = 0.02
        
        mapView.setRegion(region,animated:true)
        
        // 表示タイプを航空写真と地図のハイブリッドに設定
        //        mapView.mapType = MKMapType.standard
        //        mapView.mapType = MKMapType.satellite
        mapView.mapType = MKMapType.hybrid
        class ViewController: UIViewController, MKMapViewDelegate {
            
            @IBOutlet weak var testMapView: MKMapView!
            
            //最初からあるメソッド
            override func viewDidLoad() {
                super.viewDidLoad()
                
                let x = 140.000000 //経度
                let y = 35.000000  //緯度
                
                //中心座標
                let center = CLLocationCoordinate2DMake(y, x)
                
                //表示範囲
                let span = MKCoordinateSpanMake(1.0, 1.0)
                
                //中心座標と表示範囲をマップに登録する。
                let region = MKCoordinateRegionMake(center, span)
                testMapView.setRegion(region, animated:true)
                
                //中心にピンを立てる。
                let annotation = MKPointAnnotation()
                annotation.coordinate = CLLocationCoordinate2DMake(y, x)
                annotation.title = "中心"
                annotation.subtitle = "\(annotation.coordinate.latitude), \(annotation.coordinate.longitude)"
                testMapView.addAnnotation(annotation)
                
                //左下のピン
                let annotation1 = MKPointAnnotation()
                annotation1.coordinate = CLLocationCoordinate2DMake(y-1.0, x-1.0)
                annotation1.title = "左下"
                annotation1.subtitle = "\(annotation1.coordinate.latitude), \(annotation1.coordinate.longitude)"
                testMapView.addAnnotation(annotation1)
                
                //右下のピン
                let annotation2 = MKPointAnnotation()
                annotation2.coordinate = CLLocationCoordinate2DMake(y-1.0, x+1.0)
                annotation2.title = "右下"
                annotation2.subtitle = "\(annotation2.coordinate.latitude), \(annotation2.coordinate.longitude)"
                testMapView.addAnnotation(annotation2)
                
                //左上のピン
                let annotation3 = MKPointAnnotation()
                annotation3.coordinate = CLLocationCoordinate2DMake(y+1.0, x-1.0)
                annotation3.title = "左上"
                annotation3.subtitle = "\(annotation3.coordinate.latitude), \(annotation3.coordinate.longitude)"
                testMapView.addAnnotation(annotation3)
                
                //右上のピン
                let annotation4 = MKPointAnnotation()
                annotation4.coordinate = CLLocationCoordinate2DMake(y+1.0, x+1.0)
                annotation4.title = "右上"
                annotation4.subtitle = "\(annotation4.coordinate.latitude), \(annotation4.coordinate.longitude)"
                testMapView.addAnnotation(annotation4)
                
                //デリゲート先に自分を設定する。
                testMapView.delegate = self
            }
            
            
            
            //アノテーションビューを返すメソッド
            func mapView(mapView: MKMapView, viewForAnnotation annotation: MKAnnotation) -> MKAnnotationView? {
                
                //アノテーションビューを生成する。
                let testPinView = MKPinAnnotationView()
                
                //アノテーションビューに座標、タイトル、サブタイトルを設定する。
                testPinView.annotation = annotation
                
                //アノテーションビューに色を設定する。
                testPinView.pinTintColor = UIColor.blue
                
                //吹き出しの表示をONにする。
                testPinView.canShowCallout = true
                
                return testPinView
            }
            
        }
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}


//class ViewController: UIViewController {
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        // Do any additional setup after loading the view, typically from a nib.
//    }
//
//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//        // Dispose of any resources that can be recreated.
//    }
//

//}

