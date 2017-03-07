
extension Int {
    func toDouble() -> Double {
        return Double(self)
    }
}

let weatherSet:[String] = ["S","O","R","S","S","O","R","R","S","R","S","O","O","R"]
let moistureSet:[String] = ["h","l","n","n","l","l","h","h","l","n","h","h","h","h"]
let playSet:[Bool] = [false,true,true,true,true,true,false,false,true,true,false,true,true,false]

func elementCount<Arr:Sequence>(array:Arr,v:Arr.Iterator.Element) -> Int where Arr.Iterator.Element:Equatable {
    
    var count:Int = 0
    
    array.forEach { (val) in
        if v == val {
            count += 1
        }
    }
    
    return count
}


// Classes -> Weather & Moisture

func frequ(_ cls:String,_ set:[String]) -> Int {
    
    var playPack:[Bool] = []

    
    for i in 0..<set.count {
        
        if cls == set[i] {
            playPack.append(playSet[i])
        }
        
    }


    return max(elementCount(array: playPack, v: true),elementCount(array: playPack, v: false))
    
}

func oneR() -> Double {
    
    let weatherF = frequ("S",weatherSet) + frequ("O",weatherSet) + frequ("R",weatherSet) // 10
    let moistureF = frequ("h", moistureSet) + frequ("l", moistureSet) + frequ("n", moistureSet) // 12

    return max(weatherF,moistureF).toDouble() / playSet.count.toDouble()
    
}

print(oneR()) // 0.85
