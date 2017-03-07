import Foundation


// TRAİN DATA

let heightData:[Int] = [180,170,150,160,175,185,173,183,153,163]
let weightData:[Int] = [80,70,65,55,65,90,100,110,60,45]
let sexData:[String] = ["m","m","f","f","f","m","m","m","f","f"]

// TEST DATA

let dataW = 60
let dataH = 170

func elementCount<Arr:Sequence>(array:Arr,v:Arr.Iterator.Element) -> Int where Arr.Iterator.Element:Equatable {
    
    var count:Int = 0
    
    array.forEach { (val) in
        if v == val {
            count += 1
        }
    }
    
    return count
}

func manhattanDistance(x:Int,y:Int) -> Int {
    
    return abs(x) + abs(y)
    
}

func kSet() -> [Int] {
    
    var wfark:[Int] = []
    var hfark:[Int] = []
    var kData:[Int] = []
    
    for i in 0..<sexData.count {
        
        wfark.insert(dataW - weightData[i], at: i)
        hfark.insert(dataH - heightData[i], at: i)
        
        kData.insert(manhattanDistance(x: hfark[i], y: wfark[i]), at: i)
        
    }
    
    
    return kData
    
}

func kFinal(k:Int) -> String {
    
    let tempkDat = kSet()
    var kDat = kSet().sorted(by: {$0 < $1})
    var f:[String] = []
    
    
    for i in 0..<k {
        
        let kindis = tempkDat.index(of: kDat.first!)
        kDat.removeFirst()
        f.insert(sexData[kindis!], at: i)
        
    }
    
    if elementCount(array: f, v: "m") > elementCount(array: f, v: "f") {
        return "M"
    } else if elementCount(array: f, v: "m") < elementCount(array: f, v: "f") {
        return "F"
    } else {
        return "nil"
    }
     
}

print(kFinal(k: 3)) // M


