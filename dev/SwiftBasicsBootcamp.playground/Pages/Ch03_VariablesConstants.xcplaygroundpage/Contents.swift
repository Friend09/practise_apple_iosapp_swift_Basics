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
let name = "John"
let age = 25
let isActive = true

// 2. Add explicit types when clarity is needed
let id: Int = 12345
let price: Double = 19.99
let items: [String] = []

//optionals
var optionalName: String? = "Raghu"
let optionalAge: Int? = nil

// 3. Practice with complex generic types
let shoppingCart: [(String, Double)] = []

// 4. Use type aliases for complex types

// Mini-Project: User Profile System (Beginner)
// Goal: Practice variables, constants, and functions togethero

// Create a simple user profile system that:
// 1. Stores user information (name, age, email)
struct User {
    let id: Int
    var name: String
    var email: String
    var age: Int
    var isActive: Bool
}

// Add functions to create, update, and display users
// 2. Has functions to update the profile
func createUser(id: Int, name: String, email: String, age: Int) -> User {
    return User(id: id, name: name, email: email, age: age, isActive: true)
}

func updateUserName (_ user: inout User, newName: String) {
    user.name = newName
    print("Name updated to: \(newName)")
}

// 3. Validates the data (age > 0, email contains @)

// 4. Shows a summary of the user
func displayUser(_ user: User) {
    print("=== User Profile ===")
    print("ID: \(user.id)")
    print("Name: \(user.name)")
    print("Email: \(user.email)")
    print("Age: \(user.age)")
    print("Active: \(user.isActive)")
}



// Check your solution in `swift-ch1-5-solutions.md` - Mini-Project section
var user1 = createUser(id: 1, name: "Raghu", email: "raghu@email.com", age: 32)
displayUser(user1)

updateUserName(&user1, newName: "vamsi")
displayUser(user1)
