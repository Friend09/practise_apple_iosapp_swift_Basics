// Chapter 3: Variables and Constants

// Exercise 3.1: Variables vs Constants (Beginner)
// Goal: Learn the difference between `let` and `var` (Python doesn't have constants)

// 1. Constants - can't change after setting (like Python's naming convention)
let userName = "SwiftLearner"    // Like Python's USER_NAME = "SwiftLearner"
let userId = 12345               // But Swift actually prevents changes!

// 2. Variables - can change
var currentScore = 100
var isLoggedIn = false

// 3. Try changing them (guess what happens!)
currentScore = 150    // This works
// userName = "NewName"   // This causes an error - uncomment to see

// Python Comparison: Python uses naming conventions (CONSTANTS), Swift enforces with compiler

// Exercise 3.2: Variable Scope
// 1. Understand different scopes (global, function, closure, if statement)
// 2. Practice with capture lists in closures
// 3. Understand variable shadowing and best practices

// Exercise 3.3: Type Annotations and Inference
// 1. Use type inference effectively
// 2. Add explicit types when clarity is needed
// 3. Practice with complex generic types
// 4. Use type aliases for complex types

// Mini-Project: User Profile System (Beginner)
// Goal: Practice variables, constants, and functions together

// Create a simple user profile system that:
// 1. Stores user information (name, age, email)
// 2. Has functions to update the profile
// 3. Validates the data (age > 0, email contains @)
// 4. Shows a summary of the user

struct User {
    let id: Int              // Can't change
    var name: String         // Can change
    var age: Int             // Can change
    var email: String        // Can change
}

// Add functions to create, update, and display users

// Check your solution in `swift-ch1-5-solutions.md` - Mini-Project section
