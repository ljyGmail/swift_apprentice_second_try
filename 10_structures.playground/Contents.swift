import UIKit

// # Introducing structures
let restaurantLocation = (3, 3)
let restaurantRange = 2.5

// Pythagorean Theorem
func distance(from source: (x: Int, y: Int),
              to target: (x: Int, y: Int)) -> Double {
    let distanceX = Double(source.x - target.x)
    let distanceY = Double(source.y - target.y)
    return (distanceX * distanceX +
            distanceY * distanceY).squareRoot()
}

func isInDeliveryRange(location: (x: Int, y: Int)) -> Bool {
    let deliveryDistance = distance(from: location, to: restaurantLocation)
    
    return deliveryDistance < restaurantRange
}

isInDeliveryRange(location: (x: 5, y: 5))

// ## Your first structure
struct Location {
    let x: Int
    let y: Int
}

let storeLocation = Location(x: 3, y: 3)

struct DeliveryArea: CustomStringConvertible {
    var description: String {
        """
        Area with center: (x: \(center.x), y: \(center.y)),
        radius: \(radius)
        """
    }
    
    let center: Location
    var radius: Double
    
    func contains(_ location: Location) -> Bool {
        let distanceFromCenter =
            distance(from: (center.x, center.y), to: (location.x, location.y))
        
        return distanceFromCenter < radius
    }
    
    func overlaps(with area: DeliveryArea) -> Bool {
        distance(from: (center.x, center.y), to: (area.center.x, area.center.y)) <=
        (radius + area.radius)
    }
}

var storeArea = DeliveryArea(center: storeLocation, radius: 2.5)

// # Accessing members
storeArea.radius // 2.5

// access members of members
storeArea.center.x

storeArea.radius = 3.5

let fixArea = DeliveryArea(center: storeLocation, radius: 4)

// Error: Cannot assign to property
// fixArea.radius = 3.5

// # Introducing methods
let areas = [
    DeliveryArea(center: Location(x: 3, y: 3), radius: 2.5),
    DeliveryArea(center: Location(x: 8, y: 8), radius: 2.5)
]

func isInDeliveryRange(_ location: Location) -> Bool {
    for area in areas {
        let distanceToStore =
            distance(from: (area.center.x, area.center.y), to: (location.x, location.y))
        
        if distanceToStore < area.radius {
            return true
        }
    }
    return false
}

let customerLocation1 = Location(x: 5, y: 5)
let customerLocation2 = Location(x: 7, y: 7)

isInDeliveryRange(customerLocation1) // false
isInDeliveryRange(customerLocation2) // true

let area = DeliveryArea(center: Location(x: 8, y: 8), radius: 2.5)
let customerLocation = Location(x: 7, y: 7)
area.contains(customerLocation) // true

// # Structures as values
// copy-on-assignment
var a = 5
var b = a

a // 5
b // 5

a = 10

a // 10
b // 5

var area1 = DeliveryArea(center: Location(x: 3, y: 3), radius: 2.5)
var area2 = area1

area1.radius // 2.5
area2.radius // 2.5

area1.radius = 4

area1.radius // 4.0
area2.radius // 2.5

// # Structures everywhere

// # Conforming to a protocol
print(area1)
print(area2)
