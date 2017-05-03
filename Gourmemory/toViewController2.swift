//
//  toViewController2.swift
//  Gourmemory
//
//  Created by Kiwami on 2017/04/04.
//  Copyright © 2017年 Kiwami. All rights reserved.
//

import UIKit

class ViewController2: UIViewController {

    var shopname : String!

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }

    @IBAction func OKButton (_ segue:UIStoryboardSegue){

        dismiss(animated: true, completion: nil )
        
    }
    
}


