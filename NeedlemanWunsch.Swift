//
//  Created by K&
//  kenanatmaca.com
//  Copyright © 2016 Kenan Atmaca. All rights reserved.
//


extension String {
    
    subscript(idx: Int) -> Character {
        guard let strIdx = index(startIndex, offsetBy: idx, limitedBy: endIndex)
            else { fatalError("String error") }
        return self[strIdx]
    }
    
    func substr(to idx:Int) -> String {
        
        guard let strIdx = index(startIndex, offsetBy: idx, limitedBy: endIndex)
            else { fatalError("String error") }
        
        return self.substring(to: strIdx)
        
        
    }
    
    func substr(from idx:Int) -> String {
        
        guard let strIdx = index(startIndex, offsetBy: idx, limitedBy: endIndex)
            else { fatalError("String error") }
        
        return self.substring(from: strIdx)
        
    }
    
    func reverse() -> String {
        
        
        return String(self.characters.reversed())
        
    }
 
}

// ---------


func NeedlemanWunchTableCreate(DNA_1:String,DNA_2:String,match:Int,gap:Int,mismatch:Int) -> (matrix:[[Int]],matrixCord:[[String]]) {
    
    
    var matrix:[[Int]] = [[Int]](repeating:[Int](repeating:0, count: DNA_1.characters.count + 1), count: DNA_2.characters.count + 1)
    var matrixSTR:[[String]] = [[String]](repeating:[String](repeating:"", count: DNA_1.characters.count + 1), count: DNA_2.characters.count + 1)
    var tmp:Int = 0
    
    matrix[0][0] = 0
    
    for i in 1...DNA_1.characters.count {
        tmp += gap
        matrix[0][i] = matrix[0][i] + tmp
    }
    
    tmp = 0
    
    for i in 1...DNA_2.characters.count {
        tmp += gap
        matrix[i][0] = matrix[i][0] + tmp
    }
    
    // MATRİX TABLE CREATE
    
    for k in 0...DNA_2.characters.count - 1 {
        
        for i in 0...DNA_1.characters.count - 1 {
            
            if DNA_2[k] == DNA_1[i] {
                
                matrix[k+1][i+1] = matrix[k][i] + match
                matrixSTR[k+1][i+1] = "DİAG"
                
            } else {
                
                if matrix[k][i+1] > matrix[k][i] && matrix[k][i+1] > matrix[k+1][i]  {
                    
                    matrix[k+1][i+1] = matrix[k][i+1] + gap
                    matrixSTR[k+1][i+1] = "UP"
                    
                }
                    
                else {
                    
                    if matrix[k+1][i] > matrix[k][i] {
                        
                        matrix[k+1][i+1] = matrix[k+1][i] + gap
                        matrixSTR[k+1][i+1] = "LEFT"
                        
                    } else {
                        
                        matrix[k+1][i+1] = matrix[k][i] + mismatch
                        matrixSTR[k+1][i+1] = "BOTTOM"
                    }
                    
                }
                
            }
            
        }
        
    }
    
    return (matrix,matrixSTR)
    
}
