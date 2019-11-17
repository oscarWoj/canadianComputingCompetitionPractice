import UIKit

var o = ["aaba","baaa"] //Y
var t = ["aaa","aaa"] //Y
var th = ["aaa","aa"] //N
var f = ["aaa","a**"] //Y
var fi = ["cccrocks","cccroc**"]

func ragaman(input1:String, input2:String) -> Character {
    
    if input1.count != input2.count {
        return "N"
    }
    
    var input1Array: [Character] = []
    var input2Array: [Character] = []
    
    input1Array.append(contentsOf: input1)
    input2Array.append(contentsOf: input2)
    
    for i in input1Array {
        
        if input2Array.contains(i) {
            
            input2Array.remove(at: input2Array.firstIndex(of: i)!)
            input1Array.remove(at: input1Array.firstIndex(of: i)!)
        }
    }
    
    if input1Array.count != input2Array.count {
        return "N"
    } else {
        return "Y"
}
}

ragaman(input1: o[0], input2: o[1])
ragaman(input1: t[0], input2: t[1])
ragaman(input1: th[0], input2: th[1])
ragaman(input1: f[0], input2: f[1])
ragaman(input1: fi[0], input2: fi[1])
