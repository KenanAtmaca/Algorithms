//
//  Created by K&
//  kenanatmaca.com
//  Copyright © 2016 Kenan Atmaca. All rights reserved.
//

func interpolationSearch(_ array:[Int],search:Int) -> (index:Int,step:Int) {
    
    var left:Int = 0
    var right:Int = array.count - 1
    
    var aleft = array[left]
    var aright = array[right]
    var mid = abs(left + ((search - aleft) * (right-left) / (aleft - aright)))
    
    var index:Int = 0
    var step:Int = 0
    
    for _ in 0..<array.count {
        
         step += 1
        
        if array[mid] == search {
            
            index = Int(ceil(Double(mid)))
            break
           
        } else {
           
            if array[mid] < search {
                
                left = mid
                aleft = array[left]
                aright = array[right]
                mid = abs(left + ((search - aleft) * (right-left) / (aleft - aright)))
                
                
            } else {
                
                right = mid
                aleft = array[left]
                aright = array[right]
                mid = abs(left + ((search - aleft) * (right-left) / (aleft - aright)))
                
            }
            
            
        }
        
    }
    
    return (index + 1,step)
}
