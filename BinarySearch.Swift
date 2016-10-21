//
//  Created by K&
//  kenanatmaca.com
//  Copyright © 2016 Kenan Atmaca. All rights reserved.
//

func binarySearch<T: Comparable>(_ array: [T], search: T) -> (index:Int?,step:Int) {
    
    var lowerBound = 0
    var upperBound = array.count
    var step:Int = 0
    
    while lowerBound < upperBound {
        
        let mid = lowerBound + (upperBound - lowerBound) / 2
        step += 1
        
        if array[mid] == search {
            return (mid,step)
        } else if array[mid] < search {
            lowerBound = mid + 1
        } else {
            upperBound = mid
        }
    }
    
    return (nil,step)
}
