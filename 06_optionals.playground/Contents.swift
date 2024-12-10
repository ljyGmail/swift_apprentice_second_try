import UIKit

// # Introducing nil
var name = "NocFree"
var age = 30
var occupation = "Software Developer & Author"

// ## Sentinel values
// var errorCode = 0

// # Introducing optionals
var errorCode: Int?
errorCode = 100

errorCode = nil

// # Unwrapping optionals
var result: Int? = 30
print(result as Any)

// print(result + 1)

// ## Force unwrapping
var authorName: String? = "NocFree"
var authorAge: Int? = 30

// force unwrapping
var unwrappedAuthorName = authorName!
print("Author is \(unwrappedAuthorName)")

// authorName = nil
// print("Author is \(authorName!)") // Runtime error

if authorName != nil {
  print("Author is \(authorName!)")
} else {
  print("No author")
}

// ## Optional binding
if let unwrappedAuthorName = authorName {
  print("Author is \(unwrappedAuthorName)")
} else {
  print("No author.")
}

if let authorName = authorName {
  print("Author is \(authorName)")
} else {
  print("No author.")
}

// unwrap multiple values at the same time
if let authorName = authorName,
    let authorAge = authorAge {
  print("The author is \(authorName) who is \(authorAge) years old.")
} else {
  print("No author or no age.")
}

// combine unwrapping multiple optionals with additional Boolean checks
if let authorName = authorName,
   let authorAge = authorAge,
   authorAge >= 40 {
  print("The author is \(authorName) who is \(authorAge) years old.")
} else {
  print("No author or no age or age less than 40.")
}

// # Introducing guard
func guardMyCastle(name: String?) {
  guard let castleName = name else {
    print("No castle!")
    return
  }
  
  // At this point, `castleName` is a non-optional String
  print("Your castle called \(castleName) was guarded!")
}

func calculateNumberOfSides(shape: String) -> Int? {
  switch shape {
  case "Triangle":
    return 3
  case "Square":
    return 4
  case "Rectangle":
    return 4
  case "Pentagon":
    return 5
  case "Hexagon":
    return 6
  default:
    return nil
  }
}

func maybePrintSides(shape: String) {
  let sides = calculateNumberOfSides(shape: shape)
  
  if let sides = sides {
    print("A \(shape) has \(sides) sides.")
  } else {
    print("I don't know the number of sides for \(shape)")
  }
}

func maybePrintSides2(shape: String) {
  guard let sides = calculateNumberOfSides(shape: shape) else {
    print("I don't know the number of sides for \(shape).")
    return
  }
  
  print("A \(shape) has \(sides) sides.")
}

// # Nil coalescing
/*
var optionalInt: Int? = 10
var mustHaveResult = optionalInt ?? 0
 */

// The previous code is equivalent to the following:
var optionalInt: Int? = 10
var mustHaveResult: Int
if let unwrapped = optionalInt {
  mustHaveResult = unwrapped
} else {
  mustHaveResult = 0
}

optionalInt = nil
mustHaveResult = optionalInt ?? 0
