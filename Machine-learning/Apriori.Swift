import Foundation

let data:[[String]] = [["A","B","C"],["A","C"],["A","D"],["B","E","F"],["D","C","A"],["B","C","F"]]
let candidateSet:[String] = ["A","B","C","D","E","F"]

var frequencyTable:[String:Int] = [:]

func loadFreqSet() {
    
    var counter:Int = 0
    
    for i in 0..<candidateSet.count {
        counter = 0
        for j in 0..<data.count {
            
            for q in 0..<data[j].count {
                
                if candidateSet[i] == data[j][q] {
                    
                    counter += 1

                }
                
            }
            
        }
        
       frequencyTable[candidateSet[i]] = counter
       
    }//
}

loadFreqSet()

func combineArray<T:Equatable>(data:[T]) -> [[T]] {
    
    var c:[[T]] = []
    
    for i in 0..<data.count {
        
        for j in i+1..<data.count {
            
            if data[i] != data[j] {
                c.append([data[i],data[j]])
            }
            
        }
    }
    
    
    return c
    
}


func apriori(minSupport:Int) -> [String]  {
    
    var newFreqTable:[String:Int] = frequencyTable
    
    for (key,value) in newFreqTable {
        
        if value < minSupport {
            
            newFreqTable.removeValue(forKey: key)
            
        }
    }
   
    let fqTable:[String] = Array(newFreqTable.keys)
    var genereteTable = [[String]](repeating: [], count: newFreqTable.count)
    
    genereteTable = combineArray(data: fqTable)
    var lastFreqCounts:[Int] = [Int](repeating: 0, count: genereteTable.count)
    
    print(genereteTable)
    
    for i in 0..<data.count {
        for w in 0..<genereteTable.count {
            
            for r in 0..<genereteTable[w].count - 1 {
                
                if data[i].contains(genereteTable[w][r]) && data[i].contains(genereteTable[w][r + 1])  {
                    print("\(i) -> \(genereteTable[w][r]),\(genereteTable[w][r + 1])")
                    lastFreqCounts[w] += 1
                }
            
            }

        }

    }
  
    print(lastFreqCounts)
    return genereteTable[lastFreqCounts.index(of: lastFreqCounts.max()!)!]
    
}

print(apriori(minSupport: 3)) // [A,C]
