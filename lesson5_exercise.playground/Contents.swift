import UIKit

//Создать протокол Car и описать свойства, общие для автомобилей, а также метод деействия.
enum Engine {
    case on, off
}

enum Transmission {
    case auto, manual, sport
}

enum WindowState {
    case open, close
}

enum Brand: String {
    case BMW = "BMW"
    case Ford = "Ford"
    case Scania = "SCANIA"
}

enum WheelDrive {
    case RWD, FWD, AWD
}

enum HeadLights {
    case on, off
}

//Сразу добавил опциональные перечисления для грузового и спортивного автомобиля

enum RoofTop {
    case open, close
}

enum ActiveSpoiler {
    case enabled, disabled
}

enum TrunkModel: String {
    case cabin = "Грузовик с кузовом"
    case oilTank = "Цистерна с топливом"
}

enum Differential {
    case locked, unlocked
}

//
//тут расширения для цвета, очень долго пытался уместить его в протокол, но не нашел как это сделать, альтернатива это писать свое расширение пртокола по цветам без библиотеки.
extension UIColor {
    
    var name: String {
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
        default:
            return "Impossible color"
        }
    }
}

protocol Car: class {
    
    var brand: Brand { get }
    
    var color: UIColor { get }
    
    var engine: Engine { get set }
    
    var transmission: Transmission { get }
    
    var windowState: WindowState { get set }
    
    var headLights: HeadLights { get set}
    
    var wheelDrive: WheelDrive { get }
    
    func touchEngine()
    
    func touchWindow()
    
    func touchLights()
}

//Создать расширения для протокола CAR и реализовать в них методы конкретных действий с автомобилем: открыть/закрыть окно , запустить/заглушить двигатель и тд. по одному методу на действие, реализовать следует только те действия, реализация которых общая для всех автомобилей)

extension Car {

    func touchEngine() {
        if self.engine == .off {
            self.engine = .on
        } else {
            self.engine = .off
        }
    }
    
    func touchWindow() {
        if self.windowState == .close {
            self.windowState = .open
        } else {
            self.windowState = .close
        }
    }
    
    func touchLights() {
        if self.headLights == .off {
            self.headLights = .on
        } else {
            self.headLights = .off
        }
    }
}

//Создать два класса, имплементирующих протокол CA trunkCAR sportCAR. Описать в них свойства , отличающиеся для спортивного автомобиля и цистерны.

//спортивный автомобиль

class SportsCar: Car {
    
    var brand: Brand
    var color: UIColor
    var engine: Engine {
        willSet {
                if newValue == .on {
                    print("Двигатель \(brand) будет запущен")
                } else {
                       print("Двигатель \(brand) будет заглушен")
                }
        }
    }
    var transmission: Transmission
    var windowState: WindowState {
        willSet {
                if newValue == .open {
                    print("Окна \(brand) будут открыты")
                } else {
                       print("Окна \(brand) будут закрыты")
                }
        }
    }
    var headLights: HeadLights {
        willSet {
                if newValue == .on {
                    print("Фары \(brand) будут включены")
                } else {
                       print("Фары \(brand) будут выключены")
                }
        }
    }
    var wheelDrive: WheelDrive
    var roofTop: RoofTop {
        willSet {
                if newValue == .open {
                    print("Крыша \(brand) будет октрыта")
                } else {
                       print("Крыша \(brand) будет закрыта")
                }
        }
    }
    var activeSpoiler: ActiveSpoiler {
        willSet {
                if newValue == .enabled {
                    print("Антикрыло \(brand) будет поднято")
                } else {
                       print("Антикрыло \(brand) будет убрано")
                }
        }
    }
    
// уникальные методы для спортивного автомобиля
    
    func touchRoof() {
        if self.roofTop == .close {
            self.roofTop = .open
        } else {
            self.roofTop = .close
        }
    }
    
    func touchSpoiler() {
        if self.activeSpoiler == .disabled {
            self.activeSpoiler = .enabled
        } else {
            self.activeSpoiler = .disabled
        }
    }
    
    init(brand: Brand,color: UIColor, engine: Engine, transmission: Transmission, windowState: WindowState,headLights: HeadLights, wheelDrive: WheelDrive, roofTop: RoofTop, activeSpoiler: ActiveSpoiler ) {
        self.color = color
        self.brand = brand
        self.engine = engine
        self.transmission = transmission
        self.windowState = windowState
        self.headLights = headLights
        self.wheelDrive = wheelDrive
        self.roofTop = roofTop
        self.activeSpoiler = activeSpoiler
    }
}

//грузовой автомобиль

class TrunkCar: Car {
    
    var brand: Brand
    var color: UIColor
    var engine: Engine {
        willSet {
                if newValue == .on {
                    print("Двигатель \(brand) будет запущен")
                } else {
                       print("Двигатель \(brand) будет заглушен")
                }
        }
    }
    var transmission: Transmission
    var windowState: WindowState {
        willSet {
                if newValue == .open {
                    print("Окна \(brand) будут открыты")
                } else {
                       print("Окна \(brand) будут закрыты")
                }
        }
    }
    var headLights: HeadLights {
        willSet {
                if newValue == .on {
                    print("Фары \(brand) будут включены")
                } else {
                       print("Фары \(brand) будут выключены")
                }
        }
    }
    var wheelDrive: WheelDrive
    var trunkModel: TrunkModel
    var differential: Differential {
        willSet {
            if newValue == .locked {
            print("Дифференциал \(brand) заблокирован")
        } else {
               print("Дифференциал \(brand) разблокирован")
        }
            
        }
    }
    
//Уникальный метод только для грузового автомобиля
    
    func touchDifferential() {
        if self.differential == .unlocked {
            self.differential = .locked
        } else {
            self.differential = .unlocked
        }
    }
    
    init(brand: Brand, color: UIColor, engine: Engine, transmission: Transmission, windowState: WindowState, headLights: HeadLights, wheelDrive: WheelDrive, trunkModel: TrunkModel, differential: Differential) {
        self.brand = brand
        self.color = color
        self.engine = engine
        self.transmission = transmission
        self.windowState = windowState
        self.headLights = headLights
        self.wheelDrive = wheelDrive
        self.trunkModel = trunkModel
        self.differential = differential
    }
    
}

//Для каждого класса написать расширение имплеметирующее протокол CUstomStringConvertable
//Рсширение для вызова описаания с помощью CustomStringConvertable

extension SportsCar: CustomStringConvertible {
    var description: String {
        return  """
                --------------------------------------
                Марка: \(self.brand)
                Цвет: \(color.name)
                Состояние Двигателя: \(self.engine)
                Тип трансмиссии: \(self.transmission)
                Состояние окон: \(windowState)
                Состояние фар: \(headLights)
                Тип привода: \(wheelDrive)
                Откидная крыша: \(roofTop)
                Режим антикрла: \(activeSpoiler)
                --------------------------------------
                """
    }
}

extension TrunkCar: CustomStringConvertible {
    var description: String {
        return  """
                --------------------------------------
                Марка: \(brand)
                Цвет: \(color.name)
                Состояние Двигателя: \(engine)
                Тип трансмиссии: \(transmission)
                Состояние окон: \(windowState)
                Состояние фар: \(headLights)
                Тип привода: \(wheelDrive)
                Тип кузова: \(trunkModel.rawValue)
                Режим дифференциала: \(differential)
                --------------------------------------
                """
    }
}

//Создать несколько объектов каждого класса. Применить к ним различные действия

var car1 = SportsCar(brand: .BMW, color: .black , engine: .off, transmission: .auto, windowState: .close, headLights: .off, wheelDrive: .FWD, roofTop: .close, activeSpoiler: .enabled)
var car2 = SportsCar(brand: .Ford, color: .blue, engine: .on, transmission: .sport, windowState: .close, headLights: .off, wheelDrive: .RWD, roofTop: .close, activeSpoiler: .enabled)

var car3 = TrunkCar(brand: .Scania, color: .gray, engine: .off, transmission: .manual, windowState: .close, headLights: .off, wheelDrive: .RWD, trunkModel: .cabin, differential: .unlocked)
var car4 = TrunkCar(brand: .Ford, color: .brown, engine: .off, transmission: .auto, windowState: .close, headLights: .off, wheelDrive: .AWD, trunkModel: .oilTank, differential: .locked)


//вывести сами объекты в консоль

print(car1.description)
print(car2.description)
print(car3.description)
print(car4.description)

car1.touchEngine()
car1.touchLights()

car2.touchEngine()
car2.touchLights()

car3.touchEngine()
car3.touchLights()

car4.touchEngine()
car4.touchLights()

car1.touchSpoiler()
car1.touchRoof()

car2.touchSpoiler()
car2.touchRoof()

car3.touchDifferential()
car3.touchWindow()

car4.touchDifferential()
car4.touchWindow()
