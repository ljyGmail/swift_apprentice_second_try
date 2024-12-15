import UIKit

// # Stored Properties
struct Contact {
  var fullName: String
  var emailAddress: String
}

var person = Contact(fullName: "Noc Free", emailAddress: "nocfree@navy.com")

person.fullName // Noc Free
person.emailAddress // nocfree@navy.com

person.fullName = "Noc Busy"
person.fullName // Noc Busy

// prevent a value from changing
struct Contact2 {
  var fullName: String
  let emailAddress: String
}

var person2 = Contact2(fullName: "Noc Free", emailAddress: "nocfree@navy.com")
// Error: cannot assign to a constant
// person2.emailAddress = "nocbusy@navy.com"

// ## Default values
struct Contact3 {
  var fullName: String
  let emailAddress: String
  var relationship = "Friend"
}

var person3 = Contact3(fullName: "Noc Free", emailAddress: "nocfree@navy.com")
person3.relationship // Friend

var boss = Contact3(fullName: "HHKB", emailAddress: "happy@hacking.com", relationship: "Boss")

// # Computed properties
struct TV {
  var height: Double
  var width: Double
  
  var diagonal: Int {
    let result = (height * height +
     width * width).squareRoot().rounded()
    
    return Int(result)
  }
}

var tv = TV(height: 53.93, width: 95.87)
tv.diagonal // 110

tv.width = tv.height
tv.diagonal // 76

// ## Getter and setter
struct TV2 {
  var height: Double
  var width: Double
  
  var diagonal: Int {
    get {
      let result = (height * height +
                    width * width).squareRoot().rounded()
      return Int(result)
    }
    set {
      let ratioWidth = 16.0
      let ratioHeight = 9.0
      
      let ratioDiagonal = (ratioWidth * ratioWidth +
                           ratioHeight * ratioHeight).squareRoot()
      height = Double(newValue) * ratioHeight / ratioDiagonal
      width = height * ratioWidth / ratioHeight
    }
  }
}

var tv2 = TV2(height: 53.93, width: 95.87)
tv2.diagonal

tv2.diagonal = 70
tv2.height // 34.32...
tv2.width // 61.01...

// # Type properties
struct Level {
  static let highestLevel: Int = 1
  let id: Int
  var boss: String
  var unlocked: Bool
}

let level1 = Level(id: 1, boss: "Chameleon", unlocked: true)
let level2 = Level(id: 2, boss: "Squid", unlocked: false)
let level3 = Level(id: 3, boss: "Chupacabra", unlocked: false)
let level4 = Level(id: 4, boss: "Yeti", unlocked: false)

// Error: You can't access a type property on an instance
// level3.highestLevel

Level.highestLevel // 1

// # Property observers
struct Person {
  let id: Int
  let name: String
  
  var position: String {
    didSet {
      print("\(name) moved to \(position)")
      if position == "CEO" {
        position = oldValue
      }
    }
  }
}

// ## Limiting a variable
struct LightBulb {
  static let maxCurrent = 40
  var current = 0 {
    didSet {
      if current > Self.maxCurrent {
        print("""
                Current is too high,
                falling back to previous setting.
                """)
        current = oldValue
      }
    }
  }
}

var light = LightBulb()
light.current = 50
light.current // 0
light.current = 40
light.current // 40

// # Lazy properties
struct Circle {
  lazy var pi = {
    ((4.0 * atan(1.0 / 5.0)) - atan(1.0 / 239.0)) * 4.0
  }()
  var radius = 0.0
  var circumference: Double {
    mutating get {
      pi * radius * 2.0
    }
  }
  init(radius: Double) {
    self.radius = radius
  }
}

var circle = Circle(radius: 5) // got a Circle, pi has not been run

circle.circumference // 31.42
// also, pi now has a value
