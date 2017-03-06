
extension Int {
    func toDouble() -> Double {
        return Double(self)
    }
}
 
let weatherSet:[String] = ["S","O","R","S","S","O","R","R","S","R","S","O","O","R","S","O","R"]
let playSet:[Bool] = [false,true,true,true,true,true,false,false,true,true,false,true,true,false,false,false,true]
 
func elementCount<Arr:Sequence>(array:Arr,v:Arr.Iterator.Element) -> Int where Arr.Iterator.Element:Equatable {
    
    var count:Int = 0
    
    array.forEach { (val) in
        if v == val {
            count += 1
        }
    }
    
    return count
}
 
func zeroR() -> (yes:Double,no:Double) {
    
    let playTCount = elementCount(array: playSet, v: true)
    let playFCount = elementCount(array: playSet, v: false)
 
    return (playTCount.toDouble() / playSet.count.toDouble(),playFCount.toDouble() / playSet.count.toDouble())
    
}
 
 
print(zeroR().yes) // 0.59
print(zeroR().no) // 0.41
