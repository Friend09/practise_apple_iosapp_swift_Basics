//## Chapter 2: Basic Types in Swift
import Foundation

// NOTE: keyboard shortcut to run is <Shift + Return>
//### Exercise 2.1: Type Declaration and Inference
//
//```swift
//// Declare variables of each basic type (Bool, String, Int, Double, Float)
//// Use both explicit typing and type inference
//```

// -> Explicit Typing
var varBool: Bool = true
var varString: String = "hello world!"
var varInt: Int = 32
var varFloat: Float = 6.8987

// -> type Inference
var varBool1 = true
var varString1 = "hello again"
var varInt1 = 23
var varFloat1 = 8.67


//### Exercise 2.2: Type Conversion
//

// Convert between different types:
// 1. Convert Int to String
let number: Int = 2
let wordedNumber = String(number)
//print("number: \(number) & worded number: \(wordedNumber)")


// 2. Convert String to Int (if possible)
let word: String = "5"
let integeredWord = Int(word)

// 3. Convert Double to Int
let numDouble: Double = 3.14159
let numInt = Int(numDouble)

// 4. Convert Int to Double
let intValue = 42
let intAsDouble = Double(intValue)
//print("\(intValue) as Double: \(intAsDouble)")


//### Exercise 2.3: String Manipulation
//

// 1. Create a string with your name
let myName: String = "Raghu"

// 2. Count the characters in the string
myName.count

// 3. Convert the string to uppercase
myName.uppercased()
myName.lowercased()

// 4. Check if the string contains a specific character or substring
let searchTerm = "Rag"
if myName.contains(searchTerm){
    print("yes, the search Term found: \(searchTerm) in \(myName)")
} else{
    print("no search term in the name")
}


//### Exercise 2.4: Working with Numbers
//

let a1Int: Int = 10
let a2Int: Int = 3

// 1. Perform basic math operations with Int and Double
let result1Sum = a1Int + a2Int
let result2Sum = Double(a1Int) + Double(a2Int)

let result1Diff = a1Int - a2Int

let result1Mul = a1Int * a2Int

let result1Div = a1Int / a2Int
let result2Div = Double(a1Int) / Double(a2Int)

// 2. Calculate the remainder of division (modulo)
let result3Div = a1Int % a2Int //reminder

// 3. Use built-in functions like max(), min(), abs()
max(2,3)
min(1,129)
abs(-123)

let pi = Double.pi
let squareRoot = sqrt(16.0)
let power = pow(2.0, 3.0)
let rounded = round(3.7)

print("π ≈ \(pi)")
print("√16 = \(squareRoot)")
print("2³ = \(power)")
print("round(3.7) = \(rounded)")

//### Mini-Project: Data Analysis Helper
//

// Create a simple "analysis helper" with:
// 1. A function to determine if a value is numeric (return Bool)
func isNumeric(_ string: String) -> Bool {
    return Double(string) != nil
}


// 2. A function to convert any numeric string to Double (handle failure cases)
func numericToString(_ string: String) -> Double? {
    return Double(string)
}

numericToString("3")

// 3. A function to round a number to a specific decimal place
func roundNum(_ value: Double, places: Int) -> Double {
    let divisor = pow(10.0, Double(places))
    return round(value * divisor) / divisor
}

// Test your functions with various inputs

let testValues = ["42", "3.14159", "Hello", "-273.15", ""]

print("\n")
for value in testValues {
    
}
