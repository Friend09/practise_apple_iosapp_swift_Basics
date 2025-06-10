import Foundation
import SwiftUI

// ## Chapter 4: Control Flow and Operators

// ### Exercise 4.1: Comparison and Pattern Matching
let a = 10
let b = 20


// 1. Use comparison operators with different types
print("a = \(a), b = \(b)")
a != b
a == b
a > b
a >= b
a < b
a <= b

let c = "cat"
let d = "dog"

c > d


// 2. Practice pattern matching with switch statements


// 3. Use range operators (..<, ...)
// 4. Implement Comparable protocol for custom types

// ### Exercise 4.2: Logical Operators and Short-Circuiting

// 1. Understand short-circuit evaluation
// 2. Use nil coalescing (??) and optional chaining
// 3. Practice with complex boolean expressions

// ### Exercise 4.3: Modern Control Flow

// 1. Use if-let and guard-let for optional handling
// 2. Practice with switch statements and pattern matching
// 3. Use where clauses in control flow statements

// ### Exercise 4.4: Advanced Switch Patterns

// 1. Use switch with tuples and ranges
// 2. Practice value binding and where clauses
// 3. Use switch with enums and associated values

// ### Exercise 4.5: Conditional Expressions

// 1. Use ternary operator appropriately
// 2. Practice with nil coalescing chains
// 3. Use if expressions (Swift 5.9+)

// ### Mini-Project: Grade Calculator (Beginner)

// **Goal**: Use if statements and switch statements together

// Create a grade calculator that:
// 1. Takes a numeric score (0-100)
// 2. Returns a letter grade (A, B, C, D, F)
// 3. Gives advice based on the grade
// 4. Handles invalid scores properly

func calculateGrade(score: Int) -> String {
    // Use if-else to determine letter grade
}

func getAdvice(grade: String) -> String {
    // Use switch statement to give advice
}
