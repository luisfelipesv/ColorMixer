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
    
    @IBOutlet weak var add5ColorButton: UIButton!
    @IBOutlet weak var add4ColorButton: UIButton!
    @IBOutlet weak var add3ColorButton: UIButton!
    @IBOutlet weak var add2ColorButton: UIButton!
    @IBOutlet weak var add1ColorButton: UIButton!
    @IBOutlet weak var color5: UIButton!
    @IBOutlet weak var color4: UIButton!
    @IBOutlet weak var color3: UIButton!
    @IBOutlet weak var color2: UIButton!
    @IBOutlet weak var color1: UIButton!
    @IBOutlet weak var addColorFinalButton: UIButton!
    
    
    @IBOutlet weak var hexButton: UIButton!
    @IBOutlet weak var rgbButton: UIButton!
    @IBOutlet weak var hsbButton: UIButton!
    
    //Images
    @IBOutlet weak var mixImage: UIImageView!
    
    //Labels
    @IBOutlet weak var resultLabel: UILabel!
    
    //Views
    @IBOutlet weak var homeView: UIView!
    @IBOutlet weak var addView: UIView!
    
    //***** VARIABLES *****
    
    
    
    //***** ACTIONS *****
    @IBAction func deleteAllColors(sender: AnyObject) {
        hideColorsAndAdds()
        add5ColorButton.hidden = false
    }
    
    @IBAction func addColor(sender: AnyObject) {
        add5ColorButton.hidden = true
        add4ColorButton.hidden = false
        addView.hidden = false
    }
    
    @IBAction func addColorFinal(sender: AnyObject) {
        addView.hidden = true
    }
    
    
    @IBAction func showHEX(sender: AnyObject) {
        cleanHexRgbHsb()
        hexButton.backgroundColor = UIColor.whiteColor()
        hexButton.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
        
    }
    
    @IBAction func showRGB(sender: AnyObject) {
        cleanHexRgbHsb()
        rgbButton.backgroundColor = UIColor.whiteColor()
        rgbButton.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
    }
    
    @IBAction func showHSB(sender: AnyObject) {
        cleanHexRgbHsb()
        hsbButton.backgroundColor = UIColor.whiteColor()
        hsbButton.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
    }


    override func viewDidLoad() {
        super.viewDidLoad()
        
        hideColorsAndAdds()
        add5ColorButton.hidden = false
        addView.hidden = true
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func hideColorsAndAdds(){
        color5.hidden = true
        color4.hidden = true
        color3.hidden = true
        color2.hidden = true
        color1.hidden = true
        add5ColorButton.hidden = true
        add4ColorButton.hidden = true
        add3ColorButton.hidden = true
        add2ColorButton.hidden = true
        add1ColorButton.hidden = true
    }
    
    func cleanHexRgbHsb(){
        hexButton.backgroundColor = UIColor.blackColor()
        rgbButton.backgroundColor = UIColor.blackColor()
        hsbButton.backgroundColor = UIColor.blackColor()
        hexButton.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
        rgbButton.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
        hsbButton.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
    }
}

