// Playground - noun: a place where people can play

import UIKit

import Foundation

var arrayR = [Int]()

arrayR.count
arrayR.append(255)

arrayR.count
arrayR[0]



mySampleColorLabel.text=NSString(format: "%i,%i,%i", Int(red * 255),Int(green * 255),Int(blue * 255))
let myTitleText = NSString(format: "%6.2f,%6.2f,%6.2f", Float(red),Float(green),Float(blue))
mySampleColorButton.setTitle(myTitleText, forState: .Normal)

var red = 0
var green = 128
var blue = 128



//Covertir a hexadecimal
var hexR = String(red, radix: 16, uppercase: true)
if count(hexR)<2 {
    hexR = "0" + hexR;
}

var hexG = String(green, radix: 16, uppercase: true)
if count(hexG)<2 {
    hexG = "0" + hexG;
}

var hexB = String(blue, radix: 16, uppercase: true)
if count(hexB)<2 {
    hexB = "0" + hexB;
}

println("#\(hexR)\(hexG)\(hexB)")

//Convertir a HSV
var max : Double
var min : Double
var h : Double = 0
var s : Double = 0
var v : Double = 0

var r : Double = Double(red)
var g : Double  = Double(green)
var b : Double  = Double(blue)

var rP : Double
var gP : Double
var bP : Double
rP = r*100/255
gP = g*100/255
bP = b*100/255

//var R : Double
//var G : Double
//var B : Double
//R = r/255
//G = g/255
//B = b/255

if rP <= gP {
    min = rP
}
else {
    min = gP
}

if min > bP {
    min = bP
}

if rP >= gP {
    max = rP
}
else {
    max = gP
}

if max < bP {
    max = bP
}

var delta = max - min

if delta != 0 {
    if max == rP {
        h = 60*(((gP-bP)/delta)%6)
    }
    if max == gP {
        h = 60*(((bP-rP)/delta)+2)
    }
    if max == bP {
        h = 60*(((rP-gP)/delta)+4)
    }
    
    if max == 0 {
        s = 0
    }
    else {
        s = delta/max * 100
    }
}
else {
    h = 0
}


v = max


println("H,S,V = (\(Int(h))º,\(Int(s))%,\(Int(v))%)")







