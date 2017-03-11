import Foundation

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


let x1:[Double] = [2.7810836,1.465489372,3.396561688,1.38807019,3.06407232,7.627531214,5.332441248,6.922596716,8.675418651,7.673756466]
let x2:[Double] = [2.550537003,2.362125076,4.400293529,1.850220317,3.005305973,2.759262235,2.088626775,1.77106367,-0.2420686549,3.508563011]
let y:[Double] = [0,0,0,0,0,1,1,1,1,1]

var b0 = 0.0
var b1 = 0.0
var b2 = 0.0

let alpha = 0.3

func predictLogistic(_ index:Int) -> Double {
    
    return 1 / (1 + exp(-(b0 + b1 * x1[index] + b2 * x2[index])))

}

func trainData(loop:Int) {

    for _ in 1...loop {
        for j in 0..<y.count {
           let predict = predictLogistic(j)
           b0 = b0 + alpha * (y[j] - predict) * predict * (1.0 - predict) * 1.0
           b1 = b1 + alpha * (y[j] - predict) * predict * (1.0 - predict) * x1[j]
           b2 = b1 + alpha * (y[j] - predict) * predict * (1.0 - predict) * x2[j]
        }
    }
}

func controlPredict() -> [Double] {
    
    var predictSet:[Double] = []
    
    for i in 0..<y.count {
        
        predictSet.append(predictLogistic(i))
        
    }
    
    return predictSet
}


func normalization(data:[Double] = controlPredict()) -> [Int] {
    
    var nData:[Int] = []
    
    for i in 0..<data.count {
        
        if data[i] < 0.5 {
            nData.append(0)
        } else {
            nData.append(1)
        }
        
    }
    return nData
}

func accuracy() -> Int {
    
    var correctP:Int = 0
    let pData = normalization()
    
    for i in 0..<y.count {
        
        if pData[i] == y[i].toInt() {
            correctP += 1
        }
        
    }
    
    return Int((correctP.toDouble() / y.count.toDouble()) * 100.0)
}

trainData(loop: 1000)


print(normalization())

print(accuracy()) // 90
