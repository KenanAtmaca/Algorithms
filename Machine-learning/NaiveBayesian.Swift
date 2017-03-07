import Foundation

let weatherSet:[String] = ["S","O","R","S","S","O","R","R","S","R","S","O","O","R"]
let playSet:[Bool] = [false,true,true,true,true,true,false,false,true,true,false,true,true,false]


func frequ(value:String) -> (yes:Int,no:Int,total:Int) {
    
    var yes:Int = 0
    var no:Int = 0
    var total:Int = 0
    
    for i in 0..<weatherSet.count {
        
        if weatherSet[i] == value {
            
            if playSet[i] == true {
                yes += 1
            } else {
                no += 1
            }
            
        }
        
        total = yes + no
    }
    
    return (yes,no, total)
}


func allfrequ() -> (yes:Int,no:Int) {
    
    
    let yes:Int = playSet.filter({$0 == true}).count
    let no:Int = playSet.filter({$0 == false}).count
    
    return (yes,no)
}


let oLike = Double(frequ(value: "O").total) / Double(weatherSet.count)
let rLike = Double(frequ(value: "S").total) / Double(weatherSet.count)
let sLike = Double(frequ(value: "R").total) / Double(weatherSet.count)

let allYes = Double(allfrequ().yes) / Double(weatherSet.count) // 0.64
let allNo = Double(allfrequ().no) / Double(weatherSet.count) // 0.35


let sunyYes = (Double(frequ(value: "S").yes) / Double(allfrequ().yes)) * Double(allfrequ().yes) / Double(allfrequ().no)

print(sunyYes) // 0.60
