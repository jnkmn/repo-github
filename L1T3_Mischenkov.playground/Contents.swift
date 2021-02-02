import UIKit

var str = "Hello, playground"

var years = 5
let interest = 13.7
var invest: Double = 10_000.0
let percent = interest / 100


for _ in 1...years {
    invest = invest * (1 + percent)
    print(invest)
}
