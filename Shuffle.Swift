//
//  Created by K&
//  kenanatmaca.com
//  Copyright © 2016 Kenan Atmaca. All rights reserved.
//

public func random(_ n: Int) -> Int {
    return Int(arc4random_uniform(UInt32(n)))
}


extension Array {
    
    mutating func shuffle() {
        
        for i in 0..<self.count {
            
            let rand = random(i + 1)
            
            if i != rand {
                swap(&self[i], &self[rand])
            }
        }
    }
    
}
