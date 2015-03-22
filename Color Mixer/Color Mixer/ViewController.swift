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
    @IBOutlet weak var cancelDeleteButton: UIButton!
    @IBOutlet weak var okDeleteButton: UIButton!
    
    //Colors
    @IBOutlet weak var newColor: UILabel!
    @IBOutlet weak var mixImage: UIButton!
    @IBOutlet weak var finalColorImage: UIImageView!
    
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
    
    //Images
    @IBOutlet weak var copiedImage: UIImageView!
    @IBOutlet weak var deleteColorImage: UIImageView!
    
    
    //***** VARIABLES *****
    //Int
    var r = 144
    var g = 144
    var b = 144
    var rFinal = 0
    var gFinal = 0
    var bFinal = 0
    var color = 100
    
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
    var hexPressed = true
    var rgbPressed = false
    var hsbPressed = false
    
    //Strigns
    var hex = "Choose your color"
    var rgb = "Choose your color"
    var hsb = "Choose your color"
    
    
    //***** ACTIONS *****
    @IBAction func deleteAllColors(sender: AnyObject) {
        hideAdds()
        hideColors()
        add5ColorButton.hidden = false
        mixImage.backgroundColor = UIColor.clearColor()
        arrayR = []
        arrayG = []
        arrayB = []
        hex = "Choose your color"
        rgb = "Choose your color"
        hsb = "Choose your color"
        resultButton.setTitle("Choose your color", forState: UIControlState.Normal)
        resultButton.enabled = false
        changeSliders()
    }
    
    @IBAction func addColor(sender: UIButton) {
        UIView.animateWithDuration(0.2, animations: {
            self.addView.alpha = 1
        })
        
        addColorFinalButton.setTitle("Add color", forState: UIControlState.Normal)
        
        if sender.tag == 1 {
            color1Change = true
            colorChange = true
            r = arrayR[0]
            g = arrayG[0]
            b = arrayB[0]
            addColorFinalButton.setTitle("Change color", forState: UIControlState.Normal)
        } else if sender.tag == 2 {
            color2Change = true
            colorChange = true
            r = arrayR[1]
            g = arrayG[1]
            b = arrayB[1]
            addColorFinalButton.setTitle("Change color", forState: UIControlState.Normal)
        } else if sender.tag == 3 {
            color3Change = true
            colorChange = true
            r = arrayR[2]
            g = arrayG[2]
            b = arrayB[2]
            addColorFinalButton.setTitle("Change color", forState: UIControlState.Normal)
        } else if sender.tag == 4 {
            color4Change = true
            colorChange = true
            r = arrayR[3]
            g = arrayG[3]
            b = arrayB[3]
            addColorFinalButton.setTitle("Change color", forState: UIControlState.Normal)
        } else if sender.tag == 5{
            color5Change = true
            colorChange = true
            r = arrayR[4]
            g = arrayG[4]
            b = arrayB[4]
            addColorFinalButton.setTitle("Change color", forState: UIControlState.Normal)
        }
        
        changeSliders()
        displayNewColor()
    }
    
    
    @IBAction func handleGesture(sender: AnyObject) {
        if sender.state == UIGestureRecognizerState.Began
        {
            showDelete()
            color = 0
        }
    }
    
    @IBAction func handleGesture2(sender: AnyObject) {
        if sender.state == UIGestureRecognizerState.Began
        {
            showDelete()
            color = 1
        }
    }
    
    @IBAction func handleGesture3(sender: AnyObject) {
        if sender.state == UIGestureRecognizerState.Began
        {
            showDelete()
            color = 2
        }
    }
    
    @IBAction func handleGesture4(sender: AnyObject) {
        if sender.state == UIGestureRecognizerState.Began
        {
            showDelete()
            color = 3
        }
    }
    
    @IBAction func handleGesture5(sender: AnyObject) {
        if sender.state == UIGestureRecognizerState.Began
        {
            showDelete()
            color = 4
        }
    }
    
    @IBAction func cancelDelete(sender: AnyObject) {
        hideDelete()
    }
    
    @IBAction func okDelete(sender: AnyObject) {
        deleteColor()
        hideDelete()
    }
    
    
    @IBAction func cancelAdd(sender: AnyObject) {
        UIView.animateWithDuration(0.2, animations: {
            self.addView.alpha = 0
        })
        r = 144
        g = 144
        b = 144
        endAddColor()
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
        
        displayMix()
        
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
        
        r = 144
        g = 144
        b = 144
        
        endAddColor()
        resultButton.enabled = true
    }
    
    
    @IBAction func showHEX(sender: AnyObject) {
        cleanHexRgbHsb()
        deselectHexRgbHsb()
        hexPressed = true
        hexButton.backgroundColor = UIColor.whiteColor()
        hexButton.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
        resultButton.setTitle(hex, forState: UIControlState.Normal)
    }
    
    @IBAction func showRGB(sender: AnyObject) {
        cleanHexRgbHsb()
        deselectHexRgbHsb()
        rgbPressed = true
        rgbButton.backgroundColor = UIColor.whiteColor()
        rgbButton.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
        resultButton.setTitle(rgb, forState: UIControlState.Normal)
    }
    
    @IBAction func showHSB(sender: AnyObject) {
        cleanHexRgbHsb()
        deselectHexRgbHsb()
        hsbPressed = true
        hsbButton.backgroundColor = UIColor.whiteColor()
        hsbButton.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
        resultButton.setTitle(hsb, forState: UIControlState.Normal)
    }

    @IBAction func copyResult(sender: AnyObject) {
        
        
        
        UIView.animateWithDuration(0.2, animations: {
                self.copiedImage.alpha = 0.8
        })
        
        
        
        UIView.animateWithDuration(0.2, delay: 0.3, options: nil, animations: {
            self.copiedImage.alpha = 0
        }, completion: nil)
        
        
        
        
        if hexPressed {
            UIPasteboard.generalPasteboard().string = hex
        } else if rgbPressed {
            UIPasteboard.generalPasteboard().string = rgb
        } else if hsbPressed{
            UIPasteboard.generalPasteboard().string = hsb
        }
        
        
    }
    
    @IBAction func saveImage(sender: AnyObject) {
        if sender.state == UIGestureRecognizerState.Began
        {
            var size = CGSizeMake(500,500)
            var colorForImage = UIColor(red: CGFloat(rFinal)/255, green: CGFloat(gFinal)/255, blue: CGFloat(bFinal)/255, alpha: 1.0)
            var rect = CGRectMake(0, 0, 500, 500)
            UIGraphicsBeginImageContextWithOptions(size, false, 0)
            colorForImage.setFill()
            UIRectFill(rect)
            var image: UIImage = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext()
            UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil)
        }
    }
    
    
    //***** VIEWDIDLOAD *****
    override func viewDidLoad() {
        super.viewDidLoad()
        addView.alpha = 0
        copiedImage.alpha = 0
        hideAdds()
        hideColors()
        add5ColorButton.hidden = false
        resultButton.enabled = false
        deleteColorImage.alpha = 0
        cancelDeleteButton.alpha = 0
        okDeleteButton.alpha = 0
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }
    
    
    //***** FUNCTIONS *****
    func setRGB(){
        rgb = "(\(rFinal),\(gFinal),\(bFinal))"
    }
    
    func setHEX(){
        var hexR = String(rFinal, radix: 16, uppercase: true)
        if count(hexR)<2 {
            hexR = "0" + hexR;
        }

        var hexG = String(gFinal, radix: 16, uppercase: true)
        if count(hexG)<2 {
            hexG = "0" + hexG;
        }

        var hexB = String(bFinal, radix: 16, uppercase: true)
        if count(hexB)<2 {
            hexB = "0" + hexB;
        }
        hex = "#\(hexR)\(hexG)\(hexB)"
    }
    
    func setHSB(){
        var max : Double
        var min : Double
        var h : Double = 0
        var s : Double = 0
        var v : Double = 0
        var R : Double = Double(rFinal)
        var G : Double  = Double(gFinal)
        var B : Double  = Double(bFinal)
        var rP : Double
        var gP : Double
        var bP : Double
        
        rP = R*100/255
        gP = G*100/255
        bP = B*100/255
        
        if rP <= gP {
            min = rP
        }else {
            min = gP
        }
        
        if min > bP {
            min = bP
        }
        
        if rP >= gP {
            max = rP
        }else {
            max = gP
        }
        
        if max < bP {
            max = bP
        }
        
        var delta = max - min
        
        if delta != 0 {
            if max == rP {
                h = 60*(((gP-bP)/delta)%6)
            } else if max == gP {
                h = 60*(((bP-rP)/delta)+2)
            } else if max == bP {
                h = 60*(((rP-gP)/delta)+4)
            }
            
            if max == 0 {
                s = 0
            } else {
                s = delta/max * 100
            }
        } else {
            h = 0
        }
        v = max
        
        hsb = "(\(Int(h))º,\(Int(s))%,\(Int(v))%)"
    }
    
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
    
    func changeSliders(){
        rTextField.text = "\(r)"
        gTextField.text = "\(g)"
        bTextField.text = "\(b)"
        rSlider.value = Float(r)
        gSlider.value = Float(g)
        bSlider.value = Float(b)
    }
    
    func endAddColor() {
        color1Change = false
        color2Change = false
        color3Change = false
        color4Change = false
        color5Change = false
        colorChange = false
        changeSliders()
    }
    
    func deselectHexRgbHsb(){
        hexPressed = false
        rgbPressed = false
        hsbPressed = false
    }
    
    func showDelete(){
        UIView.animateWithDuration(0.3, animations: {
            self.deleteColorImage.alpha = 1
            self.cancelDeleteButton.alpha = 1
            self.okDeleteButton.alpha = 1
        })
    }
    
    func hideDelete(){
        UIView.animateWithDuration(0.3, animations: {
            self.deleteColorImage.alpha = 0
            self.cancelDeleteButton.alpha = 0
            self.okDeleteButton.alpha = 0
        })
    }
    
    func deleteColor(){
        arrayR.removeAtIndex(color)
        arrayG.removeAtIndex(color)
        arrayB.removeAtIndex(color)
        
        if arrayR.count == 0 {
            deleteAllColors(1)
        } else {
            for var i = 0; i < arrayR.count; i++ {
                r = arrayR[i]
                g = arrayG[i]
                b = arrayB[i]
                if i == 0 {
                    color1.backgroundColor = UIColor(red: CGFloat(r)/255, green: CGFloat(g)/255, blue: CGFloat(b)/255, alpha: 1.0)
                }
                if i == 1 {
                    color2.backgroundColor = UIColor(red: CGFloat(r)/255, green: CGFloat(g)/255, blue: CGFloat(b)/255, alpha: 1.0)
                }
                if i == 2 {
                    color3.backgroundColor = UIColor(red: CGFloat(r)/255, green: CGFloat(g)/255, blue: CGFloat(b)/255, alpha: 1.0)
                }
                if i == 3 {
                    color4.backgroundColor = UIColor(red: CGFloat(r)/255, green: CGFloat(g)/255, blue: CGFloat(b)/255, alpha: 1.0)
                }
                if i == 4 {
                    color5.backgroundColor = UIColor(red: CGFloat(r)/255, green: CGFloat(g)/255, blue: CGFloat(b)/255, alpha: 1.0)
                }
            }
        }
        
        if arrayR.count == 4 {
            color5.hidden = true
            add1ColorButton.hidden = false
            displayMix()
        }
        if arrayR.count == 3 {
            color4.hidden = true
            add1ColorButton.hidden = true
            add2ColorButton.hidden = false
            displayMix()
        }
        if arrayR.count == 2 {
            color3.hidden = true
            add2ColorButton.hidden = true
            add3ColorButton.hidden = false
            displayMix()
        }
        if arrayR.count == 1 {
            color2.hidden = true
            add3ColorButton.hidden = true
            add4ColorButton.hidden = false
            displayMix()
        }
    }
    
    func displayMix(){
        rFinal = 0
        gFinal = 0
        bFinal = 0
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
        
        setHEX()
        setRGB()
        setHSB()
        
        if hexPressed {
            resultButton.setTitle(hex, forState: UIControlState.Normal)
        } else if rgbPressed {
            resultButton.setTitle(rgb, forState: UIControlState.Normal)
        } else if hsbPressed{
            resultButton.setTitle(hsb, forState: UIControlState.Normal)
        }
        
        mixImage.backgroundColor = UIColor(red: CGFloat(rFinal)/255, green: CGFloat(gFinal)/255, blue: CGFloat(bFinal)/255, alpha: 1.0)
        
        r=144
        g=144
        b=144
        changeSliders()
    }
}

