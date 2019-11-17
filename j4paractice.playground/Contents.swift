//
//  main.swift
//  2014 S3
//
//  Created by Ximing Yang on 2019-06-11.
//  Copyright © 2019 Ximing Yang. All rights reserved.
//

import Foundation

let fileOne = [5,
               10,
               1,
               2,
               3,
               4,
               5,
               6,
               7,
               8,
               9,
               10,
               20,
               7,
               18,
               8,
               13,
               9,
               11,
               3,
               4,
               19,
               17,
               5,
               15,
               10,
               20,
               6,
               14,
               12,
               16,
               2,
               1,
               30,
               29,
               5,
               3,
               22,
               17,
               24,
               2,
               20,
               28,
               19,
               21,
               8,
               13,
               9,
               4,
               7,
               23,
               15,
               10,
               30,
               16,
               14,
               18,
               12,
               1,
               27,
               11,
               26,
               6,
               25,
               40,
               13,
               14,
               12,
               15,
               11,
               16,
               17,
               18,
               19,
               20,
               10,
               21,
               8,
               9,
               22,
               23,
               24,
               25,
               6,
               7,
               26,
               27,
               28,
               29,
               4,
               2,
               3,
               5,
               30,
               31,
               32,
               33,
               34,
               35,
               36,
               37,
               38,
               39,
               1,
               40,
               50,
               18,
               17,
               19,
               16,
               13,
               14,
               9,
               10,
               11,
               12,
               8,
               15,
               20,
               21,
               22,
               23,
               6,
               7,
               24,
               25,
               26,
               27,
               28,
               29,
               5,
               30,
               31,
               32,
               33,
               3,
               4,
               34,
               35,
               36,
               37,
               1,
               2,
               38,
               39,
               40,
               41,
               42,
               43,
               44,
               45,
               46,
               47,
               48,
               49,
               50]


let fileTwo = [2, 4, 2, 3, 1, 4, 4, 4, 1, 3, 2]
//y
//n

func oscar(file: [Int]) -> [Bool] {
    var intArray = file
    let numberOfTests = intArray.removeFirst()
    var testArrays: [[Int]] = []
    
    for index in 1...numberOfTests {
        var numberOfCars = intArray.first!
        
        var tempArray = [numberOfCars]
        
        let x = intArray[0...numberOfCars-1]
        
        let newArray = [numberOfCars] + Array(x)
        testArrays.append(newArray)
        
        for _ in 1...newArray.count {
            intArray.removeFirst()
        }
    }
    
    var answers: [Int] = []
    
    



    func YorN(array: inout [Int]) -> Bool {
    //for index in testArrays {
        var numberOfCars = array.removeFirst()
        var topOfMountain: [Int] = array
        var bridge: [Int] = []
        var lake: [Int] = []
        var currentlyNeeded = 1
        
        var finished = false
        
        while finished != true {
            var moved = false
            
            if topOfMountain.last ?? 0 == currentlyNeeded {
                lake.append(topOfMountain.removeLast())     //If it should go right into lake
                currentlyNeeded += 1
                moved = true
                
            } else if bridge.first ?? 0 == currentlyNeeded {
                lake.append(bridge.removeFirst())     //If it should go from bridge to lake
                 currentlyNeeded += 1
                moved = true
                
            } else if !topOfMountain.isEmpty {
                bridge.insert(topOfMountain.removeLast(), at: 0)//()   //if the top isnt empty
                moved = true
                
            } else if topOfMountain.isEmpty && bridge.isEmpty {
                finished = true
                return true
                
            } else  {
                finished = true
                return false
                }
            }
        }
    
    
    var x: [Bool] = []
    for index in 0..<testArrays.count {
        x.append(YorN(array: &testArrays[index]))
    }
    
    return x
    }
    
    
//YorN(array: &<#T##[Int]#>)
oscar(file: fileOne)
oscar(file: fileTwo)









func solve(file: [Int]) {
    var intArray = file
    let groups = intArray.removeFirst()
    
    for _ in 0..<groups {
        let numberOfCars = intArray.removeFirst()
        var cars = [Int]()
        for _ in 0..<numberOfCars {
            cars.append(intArray.removeFirst())
        }
        
        var mountain = cars
        var branch = [Int]()
        var canMove = true
        var nextCar = 1
        
        while canMove {
            if mountain.count > 0 && mountain.last! == nextCar {
                mountain.removeLast()
                nextCar += 1
            } else if branch.count > 0 && branch.last! == nextCar {
                branch.removeLast()
                nextCar += 1
            } else if mountain.count > 0 {
                branch.append(mountain.removeLast())
            } else {
                canMove = false
            }
        }
        
        if nextCar == (numberOfCars + 1) {
            print("Y")
        } else {
            print("N")
        }
    }
}

solve(file: fileOne)
//}
