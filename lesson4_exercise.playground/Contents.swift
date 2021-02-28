import UIKit


//enum CarType {
//    case civil, sport, truck
//}

enum CarBrand {
    case Toyota, Nissan, SCANIA, Honda
}

enum Transmission {
    case auto, manual
}

enum WindowState {
    case close, openfhtdutns }

enum EngineState {
    case on, off
}

enum WheelDrive {
    case RWD, FWD, AWD
}



class BasicCarPlatform {
    let color: UIColor
    let brand: CarBrand
    let transmission: Transmission
    var windowState: WindowState {
        willSet {
                if newValue == .open {
                    print("Окна \(brand) теперь открыты")
                } else {
                       print("Окна \(brand) теперь закрыты")
                }
        }
    }
    var engineState: EngineState {
        willSet {
                if newValue == .on {
                    print("Двигатель \(brand) теперь запущен")
                } else {
                       print("Двигатель \(brand) теперь заглушен")
                }
        }
    }
    var tankFill: Double
    var km: Double 
    let wheelDrive: WheelDrive
    
    static var basicPlatformCount = 0
    
    func touchEngine() {
        if self.engineState == .on {
                self.engineState = .off
             } else {
                self.engineState = .on
             }
    }
    
    func touchWindow() {
            if self.windowState == .open {
                self.windowState = .close
            } else {
                self.windowState = .open
                }
    }
    
    init(color: UIColor, brand: CarBrand, transmission: Transmission, windows: WindowState, engineState: EngineState, tankFill: Double, km: Double, wheelDrive: WheelDrive ) {
        self.color = color
        self.brand = brand
        self.transmission = transmission
        self.windowState = windows
        self.engineState = engineState
        self.tankFill = tankFill
        self.km = km
        self.wheelDrive = wheelDrive
        
        BasicCarPlatform.basicPlatformCount += 1
    }
    static func PlatformInfo() {
        print("Выпущено автомобилей с базовой платформой: \(self.basicPlatformCount) ")
    }
    
}
extension UIColor {
    
    var name: String? {
        switch self {
        case UIColor.black: return "black"
        case UIColor.darkGray: return "darkGray"
        case UIColor.lightGray: return "lightGray"
        case UIColor.white: return "white"
        case UIColor.gray: return "gray"
        case UIColor.red: return "red"
        case UIColor.green: return "green"
        case UIColor.blue: return "blue"
        case UIColor.cyan: return "cyan"
        case UIColor.yellow: return "yellow"
        case UIColor.magenta: return "magenta"
        case UIColor.orange: return "orange"
        case UIColor.purple: return "purple"
        case UIColor.brown: return "brown"
        default: return nil
        }
    }
}
//эта функция у меня не заработал внутри класса, вызов не активируется
func basicCarInfo(car: BasicCarPlatform) {
    print("--------------------------------------")
    print("Марка: \(car.brand)")
    print("Цвет: \(car.color.name ?? "Неизвестно")")
    print("Тип трансмиссии: \(car.transmission)")
    print("Состояние двигателя: \(car.engineState == .on ? "Запущен" : "Заглушен")")
    print("Состояние окон: \(car.windowState == .open ? "Открыты" : "Закрыты")")
    print("Топлива в баке: \(car.tankFill)")
    print("Пробег: \(car.km)")
    print("Тип привода: \(car.wheelDrive)")
}
// MARK: - тест базовой машины
var car1 = BasicCarPlatform(color: UIColor.black, brand: .Toyota, transmission: .manual, windows: .close, engineState: .off, tankFill: 50, km: 0, wheelDrive: .FWD)

basicCarInfo(car: car1)
BasicCarPlatform.PlatformInfo()
// MARK: -

class SportsCarPlatfrom: BasicCarPlatform {
    
    enum HatchState {
        case open, close
    }
    
    enum DriveMode {
        case comfort, sport
    }
    
    var hatchState: HatchState {
        willSet {
                if newValue == .open {
                    print("Люк \(brand) теперь открыт")
                } else {
                       print("Люк \(brand) теперь закрыт")
                }
        }
    }
    var driveMode: DriveMode
    
    static var sportsPlatformCount = 0
    
    func touchHatch() {
        if self.hatchState == .close {
                self.hatchState = .open
             } else {
                self.hatchState = .close
             }
    }
    
    init(color: UIColor, brand: CarBrand, transmission: Transmission, windows: WindowState, engineState: EngineState, tankFill: Double, km: Double, wheelDrive: WheelDrive, hatchState: HatchState, driveMode: DriveMode ) {
        
        self.hatchState = hatchState
        self.driveMode = driveMode
        
        super.init(color: color, brand: brand, transmission: transmission, windows: windows, engineState: engineState, tankFill: tankFill, km: km, wheelDrive: wheelDrive)
        
        SportsCarPlatfrom.sportsPlatformCount += 1
        
    }
    
    static func sportPlatformInfo() {
        print("Выпущено автомобилей на платформе, модифицированной в спортивную из базовой: \(self.sportsPlatformCount) ")
    }
}

func sportCarInfo(car: SportsCarPlatfrom) {
    print("--------------------------------------")
    print("Марка: \(car.brand)")
    print("Цвет: \(car.color.name ?? "Неизвестно")")
    print("Тип трансмиссии: \(car.transmission)")
    print("Состояние двигателя: \(car.engineState == .on ? "Запущен" : "Заглушен")")
    print("Состояние окон: \(car.windowState == .open ? "Открыты" : "Закрыты")")
    print("Топлива в баке: \(car.tankFill)")
    print("Пробег: \(car.km)")
    print("Тип привода: \(car.wheelDrive)")
    print("Состояние люка: \(car.hatchState)")
    print("Режим вождения: \(car.driveMode)")
}

//MARK: -  тест спортивного автомобиля

var sportsCar1 = SportsCarPlatfrom(color: .blue, brand: .Nissan, transmission: .auto, windows: .close, engineState: .off, tankFill: 80.0, km: 0, wheelDrive: .RWD, hatchState: .close, driveMode: .sport)

SportsCarPlatfrom.sportPlatformInfo()

sportsCar1.touchEngine()
sportsCar1.touchWindow()
sportsCar1.touchHatch()

class HeavyCarPlatform: BasicCarPlatform {
    
    enum TowHook {
        case on, off
    }
    
    enum DifferentialMode {
        case locked, unlocked
    }
    
    var towHook: TowHook {
        willSet {
                if newValue == .on {
                    print("Лебедка \(brand) теперь включена")
                } else {
                    print("Лебедка \(brand) теперь выключена")
                }
        }
    }
    var differentialMode: DifferentialMode {
        willSet {
            if newValue == .locked {
                print("Дифференциал \(brand) теперь заблокирован")
            } else {
                print("Дифференциал \(brand) теперь разблокирован")
            }
        }
    }
    
    static var heavyPlatformCount = 0
    
    func touchTowHook() {
        if self.towHook == .off {
            self.towHook = .on
        } else {
            self.towHook = .off
        }
    }
    
    func touchDifferential() {
        if self.differentialMode == .unlocked {
            self.differentialMode = .locked
        } else {
            self.differentialMode = .unlocked
        }
    }
    
    override func touchWindow() {
        print("Окна заблокированы")
    }
    
    init(color: UIColor, brand: CarBrand, transmission: Transmission, windows: WindowState, engineState: EngineState, tankFill: Double, km: Double, wheelDrive: WheelDrive, differentialMode: DifferentialMode, towHook: TowHook ) {
        
        self.differentialMode = differentialMode
        self.towHook = towHook
        
        super.init(color: color, brand: brand, transmission: transmission, windows: windows, engineState: engineState, tankFill: tankFill, km: km, wheelDrive: wheelDrive)
        
        HeavyCarPlatform.heavyPlatformCount += 1
    }
    
    static func heavyPlatformInfo() {
        print("Выпущено автомобилей на платформе, модифицированной во внедорожную из базовой: \(self.heavyPlatformCount) ")
    }
    
}

func heavyCarInfo(car: HeavyCarPlatform) {
    print("--------------------------------------")
    print("Марка: \(car.brand)")
    print("Цвет: \(car.color.name ?? "Неизвестно")")
    print("Тип трансмиссии: \(car.transmission)")
    print("Состояние двигателя: \(car.engineState == .on ? "Запущен" : "Заглушен")")
    print("Состояние окон: \(car.windowState == .open ? "Открыты" : "Закрыты")")
    print("Топлива в баке: \(car.tankFill)")
    print("Пробег: \(car.km)")
    print("Тип привода: \(car.wheelDrive)")
    print("Состояние лебедки: \(car.towHook)")
    print("Режим дифференциала: \(car.differentialMode)")
}

//MARK: -  тест грузового автомобиля

var truckCar1 = HeavyCarPlatform(color: .yellow, brand: .SCANIA, transmission: .auto, windows: .close, engineState: .off, tankFill: 200.0, km: 0, wheelDrive: .AWD, differentialMode: .unlocked, towHook: .off)

heavyCarInfo(car: truckCar1)
truckCar1.touchDifferential()
truckCar1.touchEngine()
truckCar1.touchWindow()

