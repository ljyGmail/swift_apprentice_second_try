import UIKit

// # Function basics
func printMyName() {
  print("My name is NocFree.")
}

printMyName()

// ## Function parameters
func printMultipleOfFive(value: Int) {
  print("\(value) * 5 = \(value * 5)")
}
printMultipleOfFive(value: 10)

func printMultipleOf(multiplier: Int, andValue: Int) {
  print("\(multiplier) * \(andValue) = \(multiplier * andValue)")
}
printMultipleOf(multiplier: 4, andValue: 2) // Print multiple of multiplier 4 and vlaue 2

func printMultipleOf(multiplier: Int, and value: Int) {
  print("\(multiplier) * \(value) = \(multiplier * value)")
}
printMultipleOf(multiplier: 4, and: 2) // Print multiple of multiplier 4 and 2

// no external name
func printMultipleOf(_ multiplier: Int, and value: Int) {
  print("\(multiplier) * \(value) = \(multiplier * value)")
}
printMultipleOf(4, and: 2) // Print multiple of 4 and 2

func printMultipleOf(_ multiplier: Int, _ value: Int) {
  print("\(multiplier) * \(value) = \(multiplier * value)")
}
printMultipleOf(4, 2)

// give default values to parameters
func printMultipleOf_default(_ multiplier: Int, _ value: Int = 1) {
  print("\(multiplier) * \(value) = \(multiplier * value)")
}
printMultipleOf_default(4)

// ## Return values
/*
func multiply(_ number: Int, by multiplier: Int) -> Int {
  return number * multiplier
}
let result = multiply(4, by: 2)

// return multiple values through the use of tuples
func multiplyAndDivide(_ number: Int, by factor: Int) -> (product: Int, quotient: Int) {
  return (number * factor, number / factor)
}
let results = multiplyAndDivide(4, by: 2)
let product = results.product
let quotient = results.quotient
*/

// both of these functions can be simplified because the functions only contain 'single statement'
func multiple(_ number: Int, by multiplier: Int) -> Int {
  number * multiplier
}

func multiplyAndDivide(_ number: Int, by factor: Int) -> (product: Int, quotient: Int) {
  (number * factor, number / factor)
}

// ## Advanced parameter handling
func incrementAndPrint(_ value: Int) {
  // value += 1 // Left side of mutating operator isn't mutable: 'value' is a 'let' constant
  print(value)
}

// copy-in copy-out or call by value result
func incrementAndPrint2(_ value: inout Int) {
  value += 1
  print(value)
}

var value = 5
incrementAndPrint2(&value)
print(value)

// ## Overloading
/*
 # A different number of parameters.
 # Different parameter types.
 # Different external parameter names, such as the case with printMultipleOf.
 */

// functions can also be overloaded based on a different return type
func getValue() -> Int {
  31
}

func getValue() -> String {
  "NocFree"
}

// let value = getValue() // error: ambiguous use of 'getValue()'

let valueInt: Int = getValue()
let valueString: String = getValue()

// # Functions as variables
func add(_ a: Int, _ b: Int) -> Int {
  a + b
}

var function = add

function(4, 2)

func subtract(_ a: Int, _ b: Int) -> Int {
  a - b
}

function = subtract
function(4, 2)

func printResult(_ function: (Int, Int) -> Int, _ a: Int, _ b: Int) {
  let result = function(a, b)
  print(result)
}
printResult(add, 4, 2)

// ## The land of no return

/*
func noReturn() -> Never {
  
}
*/

func infiniteLoop() -> Never {
  while true {
    
  }
}

// ## Writing good functions

// # Commenting your functions


/// Calculates the average of three values
/// - Parameters:
///   - a: The first value.
///   - b: The second value.
///   - c: The third value.
/// - Returns: The average of the three values.
func calculateAverage(of a: Double, and b: Double, and c: Double) -> Double {
  let total = a + b + c
  let average = total / 3
  return average
}
calculateAverage(of: 1, and: 3, and: 5)
