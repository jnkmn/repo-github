import UIKit

//1. Реализовать свой тип коллекции «очередь» (queue) c использованием дженериков.
//


enum Cartype: String {
    case sport = "Спортивный"
    case city = "Городской"
    case heavy = "Грузовой"
}

class Car {
    var cartype: Cartype
    let year: Int
    let brand: String
    
    init(cartype: Cartype, year: Int, brand: String) {
        self.cartype = cartype
        self.year = year
        self.brand = brand
    }
}

extension Car: CustomStringConvertible {
    var description: String {
        return  """
                --------------------------------------
                Тип автомобиля: \(brand)
                Год выпуска: \(year)
                Производитель: \(brand)
                --------------------------------------
                """
    }
}
    
struct AutoPark<T> {
    
    var elements: [T] = []
    
    mutating func push (_ element: T) {
        elements.append(element)
    }
    
    mutating func pop() -> T? {
        guard elements.count > 0 else { return nil }
        return elements.removeFirst()
    }
    
    //3. * Добавить свой subscript, который будет возвращать nil в случае обращения к несуществующему индексу.
    subscript (index: Int) -> T? {
        guard index >= 0 && index < elements.count else {
            return nil
        }
        return elements[index]
    }
    
}
//2. Добавить ему несколько методов высшего порядка, полезных для этой коллекции (пример: filter для массивов)
extension AutoPark {
    func filter(predicate: (T) -> Bool) -> [T] {
        var tempArray: [T] = []
        for element in elements where predicate(element) {
                tempArray.append(element)
        }
        return tempArray
    }
}

var carList = AutoPark<Car>()

carList.push(Car(cartype: .sport, year: 1999, brand: "Porsche"))
carList.push(Car(cartype: .city, year: 2015, brand: "Ford"))
carList.push(Car(cartype: .heavy, year: 2019, brand: "MAN"))
carList.push(Car(cartype: .sport, year: 2010, brand: "Ferrari"))
carList.push(Car(cartype: .city, year: 2018, brand: "Honda"))

print("Исключаем старые авто")
var filterOld = carList.filter() { element in element.year > 2010 }
filterOld.forEach { print($0.description)}
print("Исключаем спортивные авто")
var filterSport = carList.filter() { element in element.cartype != .sport }
filterSport.forEach { print($0.description)}


  


