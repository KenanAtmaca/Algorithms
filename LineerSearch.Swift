//
//  Created by K&
//  kenanatmaca.com
//  Copyright © 2016 Kenan Atmaca. All rights reserved.
//

func lineerSearch<T: Comparable>(_ array:[T], search: T) -> (index:Int?,step:Int) {
    
    let count = array.count
    var step:Int = 0
    
    for i in 0..<count {
        step += 1
        if array[i] == search {
            return (i,step)
        }
    
    }
    
    return (nil,step)
}
