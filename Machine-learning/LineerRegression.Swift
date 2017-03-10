import Foundation

extension Int {
    func toDouble() -> Double {
        return Double(self)
    }
}


let carAge: [Double] = [10, 8,7, 3, 3, 2, 1]
let carPrice: [Double] = [500, 400,900, 7000, 8500, 11000, 10500]
var intercept = 0.0
var slope = 0.0

func predictedCarPrice(_ carAge: Double) -> Double {
    // y = B*X + €
    return intercept + slope * carAge
}


let carPriceCount = carPrice.count
let loop = 100
let alpha = 0.0001

for n in 1...loop {
    for i in 0..<carPriceCount {
        let difference = carPrice[i] - predictedCarPrice(carAge[i])
        intercept += alpha * difference
        slope += alpha * difference * carAge[i]
    }
}


func rootMeanSquared(index:Int) -> Double {
    return sqrt(pow(predictedCarPrice(carAge[index]) - carPrice[index],2) / carPriceCount.toDouble())
}


func error() -> Double {

    var e:[Double] = []
    
    for i in 0..<carPriceCount {
    
        e.append(100 / (linearRegression(carAge, carPrice)(carAge[i]) / carPrice[i]))
        
    }
    

    return average(e)
}

func average(_ input: [Double]) -> Double {
    return input.reduce(0, +) / Double(input.count)
}

func multiply(_ a: [Double], _ b: [Double]) -> [Double] {
    return zip(a,b).map(*)
}

func linearRegression(_ xs: [Double], _ ys: [Double]) -> (Double) -> Double {
    let sum1 = average(multiply(xs, ys)) - average(xs) * average(ys)
    let sum2 = average(multiply(xs, xs)) - pow(average(xs), 2)
    let slope = sum1 / sum2
    let intercept = average(ys) - slope * average(xs)
    return { x in intercept + slope * x }
}

let result = linearRegression(carAge, carPrice)(8)

print("$\(Int(result))") // $1331

print(rootMeanSquared(index: 1)) // 971 br

print(error()) // 62.152
