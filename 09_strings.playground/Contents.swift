import UIKit

// # Strings as collections
let string = "NocFree"
for char in string {
  print(char)
}

let stringLength = string.count

// let fourthChar = string[3]
// characters can't be access like an array

// ## Grapheme clusters
let cafeNormal = "café"
let cafeCombining = "cafe\u{0301}"

cafeNormal.count  // 4
cafeCombining.count  // 4

cafeNormal.unicodeScalars.count  // 4
cafeCombining.unicodeScalars.count  // 5

for codePoint in cafeCombining.unicodeScalars {
  print(codePoint.value)
}

// ## Indexing strings
let firstIndex = cafeCombining.startIndex
let firstChar = cafeCombining[firstIndex]
print(firstChar)

// let lastIndex = cafeCombining.endIndex
// let lastChar = cafeCombining[lastIndex] // Fatal error: String index is out of bounds

let lastIndex = cafeCombining.index(before: cafeCombining.endIndex)
let lastChar = cafeCombining[lastIndex]
print(lastChar)

let fourthIndex = cafeCombining.index(cafeCombining.startIndex, offsetBy: 3)
let fourthChar = cafeCombining[fourthIndex]
print(fourthChar)

fourthChar.unicodeScalars.count // 2
fourthChar.unicodeScalars.forEach { codePoint in
  print(codePoint.value)
}

// ## Equality with combining characters
let equal = cafeNormal == cafeCombining

// # Strings as bi-directional collections
let name = "NocFree"
let backwardName = name.reversed()

let thirdCharIndex = backwardName.index(backwardName.startIndex, offsetBy: 2)
let thirdChar = backwardName[thirdCharIndex] // "r"

let backwardNameString = String(backwardName)

// # Raw strings
let raw1 = #"Raw "No Escaping" \(no interpolation!). Use all the \ you want!"#
print(raw1)

// include # in the raw string, any number of # symbols can be used as long as the beginning and end match
let raw2 = ##"Are't we "# clever"##
print(raw2)

// use interpolation with raw strings
let can = "can do that too"
let raw3 = #"Yes we \#(can)!"#
print(raw3)

// ASCII art
let multiRaw = #"""
 _____ _ __ _
/ ____| (_)/ _| |
| (_____ ___| |_| |_
\___ \ \ /\ / / | _| __|
____) \ V V /| | | | |_
|_____/ \_/\_/ |_|_| \__|
"""#
print(multiRaw)

// ## Substrings
let fullName = "NocFree Keyboard"
let spaceIndex = fullName.firstIndex(of: " ")!
// let firstName = fullName[fullName.startIndex..<spaceIndex] // "NocFree"

// open-ended range
let firstName = fullName[..<spaceIndex] // "NocFree"

let lastName = fullName[fullName.index(after: spaceIndex)...] // "Keyboard"

let lastNameString = String(lastName)

// # Character properties
let singleCharacter: Character = "x"
singleCharacter.isASCII
let singleCharacter2: Character = "🥳"
singleCharacter2.isASCII

let space: Character = " "
space.isWhitespace

let hexDigit: Character = "d"
hexDigit.isHexDigit

let chineseNine: Character = "九"
chineseNine.wholeNumberValue
let thaiNine: Character = "๙"
thaiNine.wholeNumberValue

// # Encoding

// ## UTF-8
let char = "\u{00bd}"
for i in char.utf8 {
  print(i)
}

let characters = "+\u{00bd}\u{21e8}\u{1f643}"
print(characters)

for i in characters.utf8 {
  print("\(i) : \(String(i, radix: 2))")
}

// ## UTF-16
for i in characters.utf16 {
  print("\(i) : \(String(i, radix: 2))")
}

// ## Converting indexes between encoding views
let arrowIndex = characters.firstIndex(of: "\u{21e8}")!
characters[arrowIndex] // "⇨"

if let unicodeScalarsIndex = arrowIndex.samePosition(in: characters.unicodeScalars) {
  characters.unicodeScalars[unicodeScalarsIndex] // 8680
}

if let utf8Index = arrowIndex.samePosition(in: characters.utf8) {
  characters.utf8[utf8Index] // 226
}

if let utf16Index = arrowIndex.samePosition(in: characters.utf16) {
  characters.utf16[utf16Index] // 8680
}
