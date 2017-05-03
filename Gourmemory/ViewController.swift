//
//  ViewController.swift
//  Gourmemory
//
//  Created by Kiwami on 2017/02/02.
//  Copyright © 2017年 Kiwami. All rights reserved.
//

import UIKit

import MapKit

import AVFoundation

class ViewController: UIViewController , MKMapViewDelegate , CLLocationManagerDelegate ,UIImagePickerControllerDelegate,UINavigationControllerDelegate ,UITextFieldDelegate {
    
    private var myTextField: UITextField!
    
    var mySession : AVCaptureSession!
    // デバイス.
    var myDevice : AVCaptureDevice!
    // 画像のアウトプット.
    var myImageOutput : AVCaptureStillImageOutput!
    
    // MKMapViewDelegate の追加
    
    let coordiate = CLLocationCoordinate2DMake(37.331652997806785, -122.03072304117417)
    
    let span = MKCoordinateSpanMake(0.01 , 0.01)
    
    let annotaion = MKPointAnnotation()
    

    
    @IBOutlet var imageView : UIImageView!
    @IBOutlet var mapView:MKMapView!
    @IBOutlet var selectedImageView : UIImageView!

//    @IBOutlet weak var pickerView: UIPickerView! {
//        didSet {
//            pickerView.dataSource = self
//            pickerView.delegate = self
//        }
//    }
    
    
    var testManager:CLLocationManager = CLLocationManager()
    
    override func viewDidLoad() {
        
        let region = MKCoordinateRegionMake(coordiate, span)
        mapView.setRegion(region, animated:true)
        
        annotaion.coordinate = CLLocationCoordinate2DMake(37.331652997806785, -122.03072304117417)
        annotaion.title = "ラーメン屋"
        
        annotaion.subtitle = "豚骨系"
        self.mapView.addAnnotation(annotaion)
        
        super.viewDidLoad()
        
        testManager.delegate = self
        testManager.startUpdatingLocation()
        testManager.requestWhenInUseAuthorization()
        
        super.viewDidLoad()
    
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func cameraStart(sender : AnyObject) {
        
        let sourceType:UIImagePickerControllerSourceType = UIImagePickerControllerSourceType.camera
        
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.camera){
            let cameraPicker = UIImagePickerController()
            cameraPicker.sourceType = sourceType
            cameraPicker.delegate = self
            self.present(cameraPicker, animated: true, completion: nil)
            
        }
        
    }
    
    func imagePickerController(imagePicker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        
        if let pickedImage = info[UIImagePickerControllerOriginalImage] as? UIImage {
            self.imageView.image = pickedImage
        }
        
        imagePicker.dismiss(animated: true, completion: nil)

        //画面遷移
        func goBack(_ segue:UIStoryboardSegue){}

        func goNext(_ sender:UIButton) {

            let next = storyboard!.instantiateViewController(withIdentifier: "nextView")
            self.present(next,animated: true, completion: nil)
            
        }

        
    }
    
    @IBAction func savePic(sender : AnyObject) {
        let image:UIImage! = imageView.image
        
        if image != nil {
            UIImageWriteToSavedPhotosAlbum(image, self, "image:didFinishSavingWithError:contextInfo:", nil)
        }
        
    }
    
    @IBAction func buttonTapped(sender : AnyObject) {
        performSegue(withIdentifier: "toViewController2",sender: nil)
        
    }
    

    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        for location in locations {
            
            let center = CLLocationCoordinate2DMake(location.coordinate.latitude, location.coordinate.longitude)
            
            let span = MKCoordinateSpanMake(0.01, 0.01)
            
            let rejion = MKCoordinateRegionMake(center, span)
            mapView.setRegion(rejion, animated:true)
            
            let annotation = MKPointAnnotation()
            annotaion.coordinate = CLLocationCoordinate2DMake(location.coordinate.latitude, location.coordinate.longitude)
            mapView.addAnnotation(annotation)
            
        }
    }
    
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
    func image(image: UIImage, didFinishSavingWithError error: NSError!, contextInfo: UnsafeMutablePointer<Void>) {
        if error != nil {
            showAlert(title: "きわみ", message: "Failed to save the picture.")
        } else {
            showAlert(title: "きわみ", message: "The picture was saved.")
        }
    }
    
    func showAlert(title: String, message: String) {
        let alertView = UIAlertView()
        alertView.title = title
        alertView.message = message
        alertView.addButton(withTitle: "OK")
        alertView.show()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "toViewController2") {
            let vc2: ViewController2 = (segue.destination as? ViewController2)!
            
            vc2.shopname = "ラーメンや"
        }
        
        func textFieldDidBeginEditing(textField: UITextField){
            print("textFieldDidBeginEditing:" + textField.text!)
        }
                func textFieldShouldEndEditing(textField: UITextField) -> Bool {
            print("textFieldShouldEndEditing:" + textField.text!)
            
            return true
        }
                 func textFieldShouldReturn(textField: UITextField) -> Bool {
            textField.resignFirstResponder()
            
            return true
        }
    }
    }

