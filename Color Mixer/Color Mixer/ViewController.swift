//
//  ViewController.swift
//  Color Mixer
//
//  Created by Luis Felipe Salazar on 3/21/15.
//  Copyright (c) 2015 Luis Felipe Salazar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    //***** OUTLETS ******
    //Buttons
    @IBOutlet weak var deleteColorsButton: UIButton!
    @IBOutlet weak var addColorButton: UIButton!
    @IBOutlet weak var hexButton: UIButton!
    @IBOutlet weak var rgbButton: UIButton!
    @IBOutlet weak var hsbButton: UIButton!
    
    //Images
    @IBOutlet weak var mixImage: UIImageView!
    
    //Labels
    @IBOutlet weak var resultLabel: UILabel!
    
    //Views
    @IBOutlet weak var homeView: UIView!
    
    
    
    //***** VARIABLES *****
    
    
    
    //***** ACTIONS *****
    @IBAction func deleteAllColors(sender: AnyObject) {
        
    }
    
    @IBAction func addColor(sender: AnyObject) {
        
    }
    
    @IBAction func showHEX(sender: AnyObject) {
        
    }
    
    @IBAction func showRGB(sender: AnyObject) {
        
    }
    
    @IBAction func showHSB(sender: AnyObject) {
        
    }


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

