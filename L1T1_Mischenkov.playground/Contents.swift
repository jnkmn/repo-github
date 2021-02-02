import UIKit

let str = "task 1"

let a = 3.0, b = 5.0, c = 7.0;
var x1, x2: Double
let dis = (b * b) - (a * c) * 4

if dis > 0 {
    x1 = -b + sqrt(dis)/(a * 2)
    x2 = -b - sqrt(dis)/(a * 2)
    print("x1 =", x1, "x2 =", x2)
} else if dis == 0 {
    x1 = -b / (a * 2)
    print(" one root, x1 =", x1)
} else {
    print("no solution, D<0")
}




