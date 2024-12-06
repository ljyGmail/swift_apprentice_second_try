import UIKit

// # Mutable versus immutable collections

// # Arrays

// # What is an array?

// # When are aarys useful?

// # Creating arrays
let evenNumbers = [2, 4, 6, 8]

var subscribers: [String] = []

let allZeros = Array(repeating: 0, count: 5) // [0, 0, 0, 0, 0]
print(allZeros)

let vowels = ["A", "E", "I", "O", "U"]

// # Accessing elements
// ## Using properties and methods
var players = ["Alice", "Bob", "Cindy", "Dan"]
print(players.isEmpty) // > false

if players.count < 2 {
  print("We need at least two players!")
} else {
  print("Let's start!")
}

var currentPlayer = players.first
print(currentPlayer as Any) // > Optional("Alice")

print(players.last as Any) // > Optional("Dan")

currentPlayer = players.min()
print(currentPlayer as Any) // > Optional("Alice")

// first and min() will not always return the same value
print([2, 3, 1].first as Any) // > Optional(2)
print([2, 3, 1].min() as Any) // > Optional(1)

// use "if let" to unwrap the optional
if let currentPlayer = currentPlayer {
  print("\(currentPlayer) will start")
} // > Alice will start

// ## Using subscripting
var firstPlayer = players[0]
print("First player is \(firstPlayer)")

// var player = players[4]
// > faltal error: Index out of range

// ## Using countable ranges to make an ArraySlice
let upcomingPlayersSlice = players[1...2]
print(upcomingPlayersSlice[1], upcomingPlayersSlice[2]) // > "Bob Cindy\n"

// Make a brand-new, zero-indexed Array from an ArraySlice
let upcomingPlayersArray = Array(players[1...2])
print(upcomingPlayersArray[0], upcomingPlayersArray[1]) // > "Bob Cindy\n"

// Checking for an element
func isEliminated(player: String) -> Bool {
  !player.contains(player)
}

print(isEliminated(player: "Bob")) // > false

players[1...3].contains("Bob") // > true

// # Modifying arrays
// ## Appending elements
players.append("Eli")

// another way to append an element
players += ["Gina"]
print(players)

// ## Inserting elements
players.insert("Frank", at: 5)

// ## Removing elements
var removedPlayer = players.removeLast()
print("\(removedPlayer) was removed") // > Gina was removed

removedPlayer = players.remove(at: 2)
print("\(removedPlayer) was removed") // > Cindy was removed

print(players.firstIndex(of: "Dan") as Any) // > Optional(2)
print(players.firstIndex(of: "Danny") as Any) // > nil

// ## Updating elements
print(players) // ["Alice", "Bob", "Dan", "Eli", "Frank"]

players[4] = "Franklin"
print(players) // ["Alice", "Bob", "Dan", "Eli", "Franklin"]

players[0...1] = ["Donna", "Craig", "Brian", "Anna"]
print(players) // ["Donna", "Craig", "Brian", "Anna", "Dan", "Eli", "Franklin"]

// ## Moving elements
let playerAnna = players.remove(at: 3)
players.insert(playerAnna, at: 0)
print(players) // ["Anna", "Donna", "Craig", "Brian", "Dan", "Eli", "Franklin"]

// swapping elements
players.swapAt(1, 3)
print(players) // ["Anna", "Brian", "Craig", "Donna", "Dan", "Eli", "Franklin"]

// sort the entire array
players.sort()
print(players) // ["Anna", "Brian", "Craig", "Dan", "Donna", "Eli", "Franklin"]

// # Iterating through an array
let scores = [2, 2, 8, 6, 1, 2, 1]

for player in players {
  print(player)
}
// > Anna
// > Brian
// > Craig
// > Dan
// > Donna
// > Eli
// > Franklin

for (index, player) in players.enumerated() {
  print("\(index + 1). \(player)")
}
// > 1. Anna
// > 2. Brian
// > 3. Craig
// > 4. Dan
// > 5. Donna
// > 6. Eli
// > 7. Franklin

func sumOfElements(in array: [Int]) -> Int {
  var sum = 0
  for number in array {
    sum += number
  }
  return sum
}

print(sumOfElements(in: scores))

// # Running time for array operations

// # Dictionaries

// # Creating dictionaries

// dictionary literal
var namesAndScores = ["Anna": 2, "Brian": 2, "Craig": 8, "Donna": 6]
print(namesAndScores) // > ["Anna": 2, "Brian": 2, "Donna": 6, "Craig": 8]

// empty dictionary literal
namesAndScores = [:]

// or create a new dictionary, like so
var pairs: [String: Int] = [:]

// define its capacity
pairs.reserveCapacity(20)

// # Accessing values

// ## Using subscripting
namesAndScores = ["Anna": 2, "Brian": 2, "Craig": 8, "Donna": 6] // restore the values

print(namesAndScores["Anna"]!)

print(namesAndScores["Greg"] as Any)

// ## Using properties and methods
namesAndScores.isEmpty // > false

namesAndScores.count // > 4

// # Modifying dictionaries

// ## Adding pairs
var bobData = [
  "name": "Bob",
  "profession": "Card Player",
  "country": "USA"
]

// add pairs
bobData.updateValue("CA", forKey: "state")

// a shorter way to add pairs
bobData["city"] = "San Francisco"

// ## Updating values
bobData.updateValue("Bobby", forKey: "name") // Bob

// as with adding, do this with less code
bobData["profession"] = "Mailman"

// ## Removing pairs
bobData.removeValue(forKey: "state")

// a shorter way to do this using subscripting
bobData["city"] = nil
print(bobData)

// ## Iterating through dictionaries
for (player, score) in namesAndScores {
  print("\(player) - \(score)")
}

// iterator over just the keys
for player in namesAndScores.keys {
  print("\(player), ", terminator: "") // no newline
}
print("") // print one final newline
// > Donna, Anna, Craig, Brian,

// ## Running time for dictionary operations

// # Sets
// ## Creating sets
let setOne: Set<Int> = [1]

// Set literals
let someArray = [1, 2, 3, 1] // Sets don't have their own literals

var explicitSet: Set<Int> = [1, 2, 3, 1] // explicitly declare the variable as a Set

var someSet = Set([1, 2, 3, 1]) // let the compiler infer the element tyee

print(someSet) // > [2, 3, 1] but the order is not defined

// ## Accessing elements
// check for the existence of a specific element
print(someSet.contains(1)) // > true
print(someSet.contains(4)) // > false

// ## Adding and removing elements
someSet.insert(5)
print(someSet)

let removedElement = someSet.remove(1)
print(removedElement!) // > 1

// ## Running time for set operations
