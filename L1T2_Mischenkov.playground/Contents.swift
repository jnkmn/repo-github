import UIKit

var str = "Hello, playground"

let a = 12.0, b = 15.0;
let c = sqrt(pow(a, 2) + pow(b, 2))
let S = (a * b)/2
let P = (a + b + c)

print("Периметр: ", P, " Площадь: ", S, " Гипотенуза: ", c)

let myDouble = 3.1413423424
let doubleStr = String(format: "%.3f", myDouble) // "3.14"
print(doubleStr)
