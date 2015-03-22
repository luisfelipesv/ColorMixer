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
    @IBOutlet weak var resultButton: UIButton!
    
    //Colors
    @IBOutlet weak var newColor: UILabel!
    @IBOutlet weak var mixImage: UIButton!
    
    //Views
    @IBOutlet weak var homeView: UIView!
    @IBOutlet weak var addView: UIView!
    
    //Sliders
    @IBOutlet weak var rSlider: UISlider!
    @IBOutlet weak var gSlider: UISlider!
    @IBOutlet weak var bSlider: UISlider!
    
    //TextFields
    @IBOutlet weak var rTextField: UITextField!
    @IBOutlet weak var gTextField: UITextField!
    @IBOutlet weak var bTextField: UITextField!
    
    
    //***** VARIABLES *****
    //Int
    var r = 144
    var g = 144
    var b = 144
    var rFinal = 0
    var gFinal = 0
    var bFinal = 0
    //Array
    var arrayR = [Int] ()
    var arrayG = [Int] ()
    var arrayB = [Int] ()
    //Booleans
    var color1Change = false
    var color2Change = false
    var color3Change = false
    var color4Change = false
    var color5Change = false
    var colorChange = false
    
    //***** ACTIONS *****
    @IBAction func deleteAllColors(sender: AnyObject) {
        hideAdds()
        hideColors()
        add5ColorButton.hidden = false
        mixImage.backgroundColor = UIColor.clearColor()
        arrayR = []
        arrayG = []
        arrayB = []
        
        resultButton.setTitle("Choose your color", forState: UIControlState.Normal)
        
    }
    
    @IBAction func addColor(sender: UIButton) {
        UIView.animateWithDuration(0.2, animations: {
            self.addView.alpha = 1
        })
        
        if sender.tag == 1 {
            color1Change = true
            colorChange = true
        } else if sender.tag == 2 {
            color2Change = true
            colorChange = true
        } else if sender.tag == 3 {
            color3Change = true
            colorChange = true
        } else if sender.tag == 4 {
            color4Change = true
            colorChange = true
        } else if sender.tag == 5{
            color5Change = true
            colorChange = true
        }
        
    }
    
    @IBAction func rChanged(sender: UISlider) {
        displayNewColor()
    }
    
    @IBAction func gChanged(sender: UISlider) {
        displayNewColor()
    }
    
    @IBAction func bChanged(sender: UISlider) {
        displayNewColor()
    }
    
    @IBAction func addColorFinal(sender: AnyObject) {
        UIView.animateWithDuration(0.2, animations: {
            self.addView.alpha = 0
        })
        rFinal = 0
        gFinal = 0
        bFinal = 0
        
        if color1Change {
            arrayR[0] = r
            arrayG[0] = g
            arrayB[0] = b
            color1.backgroundColor = UIColor(red: CGFloat(r)/255, green: CGFloat(g)/255, blue: CGFloat(b)/255, alpha: 1.0)
        } else if color2Change {
            arrayR[1] = r
            arrayG[1] = g
            arrayB[1] = b
            color2.backgroundColor = UIColor(red: CGFloat(r)/255, green: CGFloat(g)/255, blue: CGFloat(b)/255, alpha: 1.0)
        } else if color3Change {
            arrayR[2] = r
            arrayG[2] = g
            arrayB[2] = b
            color3.backgroundColor = UIColor(red: CGFloat(r)/255, green: CGFloat(g)/255, blue: CGFloat(b)/255, alpha: 1.0)
        } else if color4Change {
            arrayR[3] = r
            arrayG[3] = g
            arrayB[3] = b
            color4.backgroundColor = UIColor(red: CGFloat(r)/255, green: CGFloat(g)/255, blue: CGFloat(b)/255, alpha: 1.0)
        } else if color5Change {
            arrayR[4] = r
            arrayG[4] = g
            arrayB[4] = b
            color5.backgroundColor = UIColor(red: CGFloat(r)/255, green: CGFloat(g)/255, blue: CGFloat(b)/255, alpha: 1.0)
        } else {
            arrayR.append(r)
            arrayG.append(g)
            arrayB.append(b)
        }
        
        for i in arrayR {
            rFinal += i
        }
        rFinal /= (arrayR.count)
        
        for i in arrayG {
            gFinal += i
        }
        gFinal /= arrayG.count
        
        for i in arrayB {
            bFinal += i
        }
        bFinal /= arrayB.count
        
        mixImage.backgroundColor = UIColor(red: CGFloat(rFinal)/255, green: CGFloat(gFinal)/255, blue: CGFloat(bFinal)/255, alpha: 1.0)
        
        if !colorChange {
            if arrayB.count == 1 {
                add5ColorButton.hidden = true
                add4ColorButton.hidden = false
                color1.hidden = false
                color1.backgroundColor = UIColor(red: CGFloat(r)/255, green: CGFloat(g)/255, blue: CGFloat(b)/255, alpha: 1.0)
            } else if arrayB.count == 2 {
                add4ColorButton.hidden = true
                add3ColorButton.hidden = false
                color2.hidden = false
                color2.backgroundColor = UIColor(red: CGFloat(r)/255, green: CGFloat(g)/255, blue: CGFloat(b)/255, alpha: 1.0)
            } else if arrayB.count == 3 {
                add3ColorButton.hidden = true
                add2ColorButton.hidden = false
                color3.hidden = false
                color3.backgroundColor = UIColor(red: CGFloat(r)/255, green: CGFloat(g)/255, blue: CGFloat(b)/255, alpha: 1.0)
            } else if arrayB.count == 4 {
                add2ColorButton.hidden = true
                add1ColorButton.hidden = false
                color4.hidden = false
                color4.backgroundColor = UIColor(red: CGFloat(r)/255, green: CGFloat(g)/255, blue: CGFloat(b)/255, alpha: 1.0)
            } else {
                add1ColorButton.hidden = true
                color5.hidden = false
                color5.backgroundColor = UIColor(red: CGFloat(r)/255, green: CGFloat(g)/255, blue: CGFloat(b)/255, alpha: 1.0)
            }
        }
        
        
        color1Change = false
        color2Change = false
        color3Change = false
        color4Change = false
        color5Change = false
        colorChange = false
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

    //***** ViedDidLoad *****
    override func viewDidLoad() {
        super.viewDidLoad()
        addView.alpha = 0
        hideAdds()
        hideColors()
        add5ColorButton.hidden = false
        
        

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }
    
    
    //***** FUNCTIONS *****
    
    func hideAdds(){
        add5ColorButton.hidden = true
        add4ColorButton.hidden = true
        add3ColorButton.hidden = true
        add2ColorButton.hidden = true
        add1ColorButton.hidden = true
    }
    
    func hideColors(){
        color1.hidden = true
        color2.hidden = true
        color3.hidden = true
        color4.hidden = true
        color5.hidden = true
    }
    
    func cleanHexRgbHsb(){
        hexButton.backgroundColor = UIColor.blackColor()
        rgbButton.backgroundColor = UIColor.blackColor()
        hsbButton.backgroundColor = UIColor.blackColor()
        hexButton.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
        rgbButton.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
        hsbButton.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
    }
    
    func displayNewColor(){
        r = Int(rSlider.value)
        b = Int(bSlider.value)
        g = Int(gSlider.value)

        
        let color = UIColor(red: CGFloat(r)/255, green: CGFloat(g)/255, blue: CGFloat(b)/255, alpha: 1.0)
        newColor.backgroundColor = color
        
        rTextField.text = "\(Int(r))"
        gTextField.text = "\(Int(g))"
        bTextField.text = "\(Int(b))"
        
    }
    
    
}

