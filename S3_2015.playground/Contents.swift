import UIKit

var sampleOne: [Int] = [4, 3, 4, 1, 1]
//Answer is 2
var sampleTwo: [Int] = [4, 6, 2, 2, 3, 3, 4, 4]
//answer i 3

func solve(Input: inout [Int]) -> Int {
    let numberOfGates: Int = Input.removeFirst()
    let numberOfPlanes = Input.removeFirst()
    
    var gates: [Bool] = []
    var planesDockedSuccess: [Bool] = []
    
    for _ in 1...numberOfGates {
        gates.append(false)
    }
    
    for index in 0..<Input.count {
        
        var currentPlaneValue = Input[index]
        var wasPlaced = false
        
        
        while currentPlaneValue != -1 {
            
            if gates[currentPlaneValue - 1] == true { // if the gate is taken
                currentPlaneValue -= 1
                if currentPlaneValue == 0 {
                    currentPlaneValue = -1
                }
                
            } else {                                //If the gate is not full
                
                wasPlaced == true
                gates[currentPlaneValue - 1] = true
                planesDockedSuccess += [true]
                //Input.removeFirst()
                currentPlaneValue = -1
            }
            
            if currentPlaneValue == -1 && wasPlaced == false {
                planesDockedSuccess += [false]
                //Input.removeFirst()
            }
            
        }
    }
    
    var x:Int = 0
//
//    //for _ in 0..<planesDockedSuccess.count{
//        if planesDockedSuccess.first == true {
//            x += 1
//        } else {
//
//            break
//        }
//
//    }
    
    print(planesDockedSuccess)
    return(x)
    
    
    
}

solve(Input: &sampleOne)
solve(Input: &sampleTwo)

