import UIKit


enum CarEngineState {
    case on, off
}
enum CarWindowState {
    case open, close
}
enum CarType: String {
    case Civil = "Городской"
    case Sport = "Спортивный"
    case Truck = "Грузовой"
}
enum CarBrand {
    case Renault
    case Porsche
    case SCANIA
}
struct BasicCar {
    let carBrand: CarBrand
    let carType: CarType
    let yearOfmanufacturing: Int
    let trunkVolume: Double
    var engineState: CarEngineState {
        willSet {
                if newValue == .on {
                    print("Двигатель \(carBrand) теперь запущен")
                } else {
                       print("Двигатель \(carBrand) теперь заглушен")
                }
        }
}
    var windowState: CarWindowState {
        willSet {
                if newValue == .open {
                    print("Окна \(carBrand) теперь открыты")
                } else {
                       print("Окна \(carBrand) теперь закрыты")
                }
        }
    }
    var trunkFill: Double {
        willSet {
            print("Багажник \(carBrand) будет заполнен")
        }
    }
    
    mutating func touchEngine() {
        if self.engineState == .on {
                self.engineState = .off
             } else {
                self.engineState = .on
             }
    }
    
    mutating func touchWindow() {
            if self.windowState == .open {
                self.windowState = .close
            } else {
                self.windowState = .open
                }
    }
    mutating func loadTrunk(load: Double) {
        if load < self.trunkVolume {
            self.trunkFill = self.trunkFill + load
        } else {
            print("Груз слишком объемный для этого автомобиля, попробуйте другой груз")
        }
        }
        
    
    init?(type: CarType, brand: CarBrand, year: Int, trunk: Double, engine: CarEngineState, window: CarWindowState, fill: Double) {
        guard trunk > fill || trunk > 0 else { return nil }
        guard year > 1985 && year <= 2021 else { return nil }
        carType = type
        carBrand = brand
        yearOfmanufacturing = year
        trunkVolume = trunk
        engineState = engine
        windowState = window
        trunkFill = fill
        
    }
}

func PrintCarState(car: BasicCar) {
    print("--------------------------------------")
    print("Тип автомобиля: \(car.carType.rawValue) ")
    print("Марка: \(car.carBrand)")
    print("Год выпуска: \(car.yearOfmanufacturing) год")
    print("Объем багажника: \(car.trunkVolume) литров")
    print("Состояние двигателя: \(car.engineState == .on ? "Запущен" : "Заглушен")")
    print("Состояние окон: \(car.windowState == .open ? "Открыты" : "Закрыты")")
    print("Заполненно места в багажнике: \(car.trunkFill) литров из \(car.trunkVolume) доступных")
}

var civilCar = BasicCar(type: .Civil, brand: .Renault, year: 2009, trunk: 450, engine: .off, window: .close, fill: 0)
var sportCar = BasicCar(type: .Sport, brand: .Porsche, year: 2018, trunk: 250, engine: .off, window: .close, fill: 0)
var truckCar = BasicCar(type: .Truck, brand: .SCANIA, year: 2005, trunk: 9500, engine: .off, window: .open, fill: 0)

PrintCarState(car: civilCar!)
PrintCarState(car: sportCar!)
PrintCarState(car: truckCar!)

civilCar?.touchEngine()
sportCar?.touchEngine()
truckCar?.touchEngine()

civilCar?.touchWindow()
sportCar?.touchWindow()
truckCar?.touchWindow()

civilCar?.loadTrunk(load: 200)
sportCar?.loadTrunk(load: 100)
truckCar?.loadTrunk(load: 7000)

