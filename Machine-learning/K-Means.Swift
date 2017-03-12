import Foundation

func average(arr:[Int]) -> Double {
    
    return arr.reduce(0, +).toDouble() / arr.count.toDouble()
    
}

extension Int {
    func toDouble() -> Double {
        return Double(self)
    }
}

extension Double {
    func toInt() -> Int {
        return Int(self)
    }
}


let heightData:[Int] = [157,180,170,150,160,175,185,173,183,153,163,130]


func euclidianDistance(x1:Int,center:Int) -> Int {
    return Int(sqrt(pow(x1.toDouble() - center.toDouble(), 2)))
}


func kMeans(k:Int, data:[Int]) -> [[Int]] {
    
    var clusters:[[Int]] = [[Int]](repeating: [], count: k)
    var centroids:[Int] = [Int](repeating: 0, count: k)
    var oldCentroids:[Int] = [Int](repeating: 0, count: k)
    var distances:[Int] = [Int](repeating: 0, count: k)
    
    
    for c in 0..<k {
        centroids[c] = data[c]
    }

        
    loop: while true {
        
      clusters = [[Int]](repeating: [], count: k)
        
        for j in 0..<data.count {
            
           distances = []
            
            for z in 0..<k {
                
                distances.insert(euclidianDistance(x1: data[j], center: centroids[z]), at: z)

            }
            
            let indx = distances.index(of: distances.min()!)!
           
            clusters[indx].append(data[j])

        }
        
        for q in 0..<k {
            oldCentroids[q] = centroids[q]
            
            centroids[q] = average(arr: clusters[q]).toInt()
            
            if oldCentroids[q] == centroids[q] {
                break loop
            }
            
        }
        
    }
    
    return clusters
}


print(kMeans(k: 2, data: heightData))
