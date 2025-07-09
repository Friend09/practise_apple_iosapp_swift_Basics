import Foundation
import SwiftUI

// ## Chapter 4: Control Flow and Operators

// ### Exercise 4.1: Comparison and Pattern Matching

// 1. Use comparison operators with different types
let a = 10
let b = 20
print("a == b: \(a == b)")  // Equal
print("a != b: \(a != b)")  // Not equal
print("a < b: \(a < b)")    // Less than

// 2. Practice pattern matching with switch statements
//let score = 85
//switch score {
//case 90...100:
//    print("A grade")
//case 80..<90:
//    print("B grade")
//case 70..<80:
//    print("C grade")
//default:
//    print("Needs help!")
//}

// 3. Use range operators (..<, ...)
let range1 = 1...5    // 1, 2, 3, 4, 5
let range2 = 1..<5    // 1, 2, 3, 4

range2
// 4. Implement Comparable protocol for custom types
struct Person: Comparable {
    let name: String
    let age: Int
    
    static func < (lhs: Person, rhs: Person) -> Bool {
        return lhs.age < rhs.age
    }
}

let alice = Person(name: "Alice", age: 25)
let bob = Person(name: "Bob", age: 30)

print(alice>bob)
print( ([bob, alice]).sorted())

// ### Exercise 4.2: Logical Operators and Short-Circuiting

let isWeekend = true
let isRaining = false

// AND (&&) - both must be true
print("Weekend AND not raining: \(isWeekend && !isRaining)")

// OR (||) - at least one must be true
print("Weekend OR raining: \(isWeekend || isRaining)")

// NOT (!) - flips true/false
print("Not weekend: \(!isWeekend)")

//let name: String? = nil
//let displayName = name ?? "Guest"
//let count = name?.count ?? 45

// 3. Practice with complex boolean expressions
//let age = 25
//let hasLicense = true
//let canDrive = age >= 16 && hasLicense

// ### Exercise 4.3: Modern Control Flow

// 1. Use if-let and guard-let for optional handling

let optionalName: String? = "John"

if let name = optionalName {
    print("Hello, \(name)")
}

// guard
func greet(name: String?) {
    guard let name = name else {
        print("No name provided")
        return
    }
    print("Hello, \(name)")
}

greet(name: nil)

// 2. Practice with switch statements and pattern matching
//let point = (x: 10, y : 20)
//switch point {
//case (0,0):
//    print("Origin")
//case (_, 0):
//    print("On X-axis")
//case(0, _):
//    print("On Y-axis")
//case (let x, let y):
//    print("Point at (\(x), \(y))")
//}

// 3. Use where clauses in control flow statements
let number = 15
switch number {
case let n where n % 2 == 0:
    print("\(n) is even")
case let n where n % 2 != 0:
    print("\(n) is odd")
default:
    break
}


// ### Exercise 4.4: Advanced Switch Patterns

// 1. Use switch with tuples and ranges
let coordinates = (x:10, y:20)
switch coordinates {
case (0...5, 0...5):
    print("In first quadrant")
case (-5...0, 0...5):
    print("In second quadrant")
case (-5...0, -5...0):
    print("In third quadrant")
case (0...5, -5...0):
    print("In fourth quadrant")
default:
    print("Outside our grid")
}

// 2. Practice value binding and where clauses
let point = (x:5, y:5)
switch point {
case let (x,y) where x == y:
    print("Point is diagonal")
case let (x,y) where x == -y:
    print("Point is anti-diagonal")
default:
    print("Point is elsewhere")
}

// 3. Use switch with enums and associated values
enum Shape {
    case circle(radius: Double)
    case rectangle(width: Double, height: Double)
}

let shape = Shape.circle(radius: 5.0)
switch shape {
case .circle(let  radius):
    print("Circle with radius \(radius)")
case .rectangle(let width, let height):
    print("Rectangle \(width)x\(height)")
}

// ### Exercise 4.5: Conditional Expressions

// 1. Use ternary operator appropriately
let age = 20
let status = age >= 18 ? "Adult" : "Minor"
print("Status: \(status)")


// 2. Practice with nil coalescing chains
let name: String? = nil
let email: String? = nil
let displayName = name ?? email ?? "Guest"
print("Display name: \(displayName)")

//// 3. Use if expressions (Swift 5.9+)
//let score = 85
//let grade = if score >= 90 { "A" }
//            else if score >= 80 { "B" }
//            else if score >= 70 { "C" }
//            else { "F" }
//print("Grade: \(grade)")
//
//let grade2 = switch score {
//case 90...100: "A"
//case 80..<90: "B"
//case 70..<80: "C"
//default: "F"
//}




// ### Mini-Project: Grade Calculator (Beginner)

// **Goal**: Use if statements and switch statements together


// Create a grade calculator that:
// 1. Takes a numeric score (0-100)
// 2. Returns a letter grade (A, B, C, D, F)


// 3. Gives advice based on the grade
// 4. Handles invalid scores properly
