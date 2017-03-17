import Foundation

let d = 0.85

var a = 0.0
var b = 0.0
var c = 0.0
var e = 0.0

func pageRank(loop:Int) -> [Double] {
    
    var ranks:[Double] = []
    
    
    for i in 0...loop {
        
        let prA = (1-d) + d * (b/1 + c/2)
        let prB = (1-d) + d * (a/2)
        let prC = (1-d) + d * (a/2 + b/1)
        let prE = (1-d) + d * (c/2)
        
        
        b = prA
        a = prB + prC
        c = prA + prB
        e = prC
        
        if i == loop {
            ranks.append(prA)
            ranks.append(prB)
            ranks.append(prC)
            ranks.append(prE)
        }
        
    }
    
    return ranks
}

print(pageRank(loop: 5))
