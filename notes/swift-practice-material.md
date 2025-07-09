# Swift Learning Path: Beginner to Confident Developer

This learning path provides beginner-friendly practice exercises for each Swift concept. Each section builds on previous knowledge with simple, clear examples and Python comparisons.

## How to Use This Guide (For Beginners)

1. **Start with Xcode Playgrounds** - Perfect for experimenting with code
2. **Read the explanations first** - Don't jump straight to coding
3. **Try each exercise yourself** - Then check the solutions in the corresponding files
4. **Compare with Python** - Use your existing knowledge to understand Swift
5. **Practice daily** - Even 15 minutes a day makes a big difference

**For Python Developers**: This guide assumes you know Python basics and draws parallels between Swift and Python concepts.

**Files to Use Alongside This Guide:**

- `swift-ch1-5-solutions.md` - Detailed solutions for fundamentals
- `swift-ch6-7-solutions.md` - Optionals and tuples with examples
- `swift-ch8-11-solutions.md` - Structs and classes explained simply
- `swift-ch11-end-solutions.md` - Advanced classes and protocols

Let's begin your Swift journey!

## Chapter 2: Basic Types in Swift

### Exercise 2.1: Type Declaration and Inference (Beginner)

**Goal**: Learn how Swift handles types (similar to Python's type hints, but enforced)

```swift
// 1. Let Swift figure out types (like Python without type hints)
let name = "Swift Learner"     // Swift knows this is String
let age = 25                   // Swift knows this is Int
let height = 5.8               // Swift knows this is Double
let isStudent = true           // Swift knows this is Bool

// 2. Be explicit about types (like Python with type hints)
let userName: String = "John"
let userAge: Int = 30
let userHeight: Double = 5.9
let isActive: Bool = false

// 3. Practice string interpolation
let message = "Hello, \(name)! You are \(age) years old."
print(message)
```

**Python Comparison**: Like Python's `f"Hello, {name}!"` but with `\(name)` instead of `{name}`

### Exercise 2.2: Type Conversion (Beginner)

**Goal**: Learn safe type conversion (Swift is stricter than Python)

```swift
// 1. Convert numbers to strings (like Python's str())
let number = 42
let numberAsString = String(number)

// 2. Convert strings to numbers (safer than Python's int())
let textNumber = "123"
let convertedNumber = Int(textNumber)  // Returns optional (might fail!)

// 3. Check if conversion worked
if convertedNumber != nil {
    print("Conversion succeeded: \(convertedNumber!)")
} else {
    print("Conversion failed")
}

// 4. Convert between numeric types
let wholeNumber = 42
let decimalNumber = Double(wholeNumber)
let pi = 3.14159
let piAsInt = Int(pi)  // This cuts off the decimal part
```

**Python Comparison**: Python's `int("123")` crashes if it fails, Swift's `Int("123")` returns `nil` safely

### Exercise 2.3: String Manipulation (Beginner)

**Goal**: Work with strings (very similar to Python)

```swift
// 1. Combine strings (like Python's + operator)
let firstName = "John"
let lastName = "Doe"
let fullName = firstName + " " + lastName

// 2. Use string methods (similar to Python)
print("Length: \(fullName.count)")           // Like Python's len()
print("Uppercase: \(fullName.uppercased())")  // Like Python's upper()
print("Contains: \(fullName.contains("John"))") // Like Python's "John" in name

// 3. String interpolation in complex expressions
let score = 85
let message = "Your score of \(score) is \(score >= 60 ? "passing" : "failing")"

// 4. Check string contents
if fullName.contains("John") {
    print("Contains 'John'")
}

if fullName.hasPrefix("John") {
    print("Starts with 'John'")
}
```

**Python Comparison**: Swift's `.count` = Python's `len()`, `.uppercased()` = `.upper()`

### Exercise 2.4: Working with Numbers (Beginner)

```swift
// 1. Perform basic math operations with Int and Double
let a = 10
let b = 3

print("\(a) + \(b) = \(a + b)")
print("\(a) - \(b) = \(a - b)")
print("\(a) * \(b) = \(a * b)")
print("\(a) / \(b) = \(a / b)")  // Integer division = 3
print("\(a) % \(b) = \(a % b)")  // Remainder = 1

// 2. Decimal division
let decimalResult = Double(a) / Double(b)
print("Decimal division: \(decimalResult)")

// 3. Use operators like % (remainder), && (logical AND), || (logical OR)
let isEven = a % 2 == 0
let isPositive = a > 0 && b > 0

// 4. Use built-in functions like max(), min(), abs()
print("Maximum: \(max(a, b))")
print("Minimum: \(min(a, b))")
print("Absolute value of -5: \(abs(-5))")

// 5. Random numbers
let randomNum = Int.random(in: 1...10)
print("Random number 1-10: \(randomNum)")
```

### Mini-Project: Grade Calculator (Beginner)

```swift
// Create a simple grade calculator that:
// 1. Takes a numeric score (0-100)
// 2. Returns a letter grade (A, B, C, D, F)
// 3. Provides advice based on the grade
// 4. Shows pass/fail status

func calculateGrade(score: Int) -> String {
    if score >= 90 {
        return "A"
    } else if score >= 80 {
        return "B"
    } else if score >= 70 {
        return "C"
    } else if score >= 60 {
        return "D"
    } else {
        return "F"
    }
}

func getAdvice(grade: String) -> String {
    switch grade {
    case "A":
        return "Excellent work!"
    case "B":
        return "Good job!"
    case "C":
        return "Satisfactory"
    case "D":
        return "Needs improvement"
    case "F":
        return "Please study more"
    default:
        return "Invalid grade"
    }
}

// Test it
let scores = [95, 87, 76, 65, 45]

for score in scores {
    let grade = calculateGrade(score: score)
    let advice = getAdvice(grade: grade)
    let status = score >= 60 ? "PASS" : "FAIL"

    print("Score: \(score) → Grade: \(grade) → \(advice) (\(status))")
}
```

**Check your solution** in `swift-ch1-5-solutions.md` - Mini-Project section

## Chapter 3: Variables and Constants

### Exercise 3.1: Variables vs Constants (Beginner)

**Goal**: Learn the difference between `let` and `var` (Python doesn't have constants)

```swift
// 1. Constants - can't change after setting (like Python's naming convention)
let userName = "SwiftLearner"    // Like Python's USER_NAME = "SwiftLearner"
let userId = 12345               // But Swift actually prevents changes!

// 2. Variables - can change
var currentScore = 100
var isLoggedIn = false

// 3. Try changing them (guess what happens!)
currentScore = 150    // This works
// userName = "NewName"   // This causes an error - uncomment to see

// 4. Type inference with variables
var count = 0        // Swift knows this is Int
var price = 19.99    // Swift knows this is Double
var name = "Swift"   // Swift knows this is String
```

**Python Comparison**: Python uses naming conventions (CONSTANTS), Swift enforces with compiler

### Exercise 3.2: Variable Scope (Beginner)

```swift
// 1. Understand different scopes (global, function, if statement)
let globalMessage = "I'm available everywhere"

func myFunction() {
    let localMessage = "I only exist in this function"
    print(globalMessage)  // Can access global
    print(localMessage)   // Can access local
}

// 2. Understand variable shadowing and best practices
let x = 10
if true {
    let x = 20  // Different x, shadows the outer one
    print("Inner x: \(x)")  // 20
}
print("Outer x: \(x)")  // 10
```

### Exercise 3.3: Type Annotations and Inference (Beginner)

```swift
// 1. Use type inference effectively
let name = "John"           // String
let age = 25               // Int
let isActive = true        // Bool

// 2. Add explicit types when clarity is needed
let id: Int = 12345        // Make sure it's Int
let price: Double = 10     // Make sure it's Double, not Int
let items: [String] = []   // Empty array needs type

// 3. Practice with complex generic types
let numbers: [Int] = [1, 2, 3]
let dictionary: [String: Int] = ["one": 1, "two": 2]

// 4. Use type aliases for complex types
typealias Point = (x: Int, y: Int)
let origin: Point = (0, 0)
```

### Mini-Project: User Profile System (Beginner)

**Goal**: Practice variables, constants, and functions together

```swift
// Create a simple user profile system that:
// 1. Stores user information (name, age, email)
// 2. Has functions to update the profile
// 3. Validates the data (age > 0, email contains @)
// 4. Shows a summary of the user

struct User {
    let id: Int              // Can't change
    var name: String         // Can change
    var age: Int            // Can change
    var email: String       // Can change
}

// Add functions to create, update, and display users
```

**Check your solution** in `swift-ch1-5-solutions.md` - Mini-Project section

## Chapter 4: Control Flow and Operators

### Exercise 4.1: Comparison and Pattern Matching (Beginner)

```swift
// 1. Use comparison operators with different types
let a = 10
let b = 20
print("a == b: \(a == b)")  // Equal
print("a != b: \(a != b)")  // Not equal
print("a < b: \(a < b)")    // Less than

// 2. Practice pattern matching with switch statements
let score = 85
switch score {
case 90...100:
    print("A grade")
case 80..<90:
    print("B grade")
case 70..<80:
    print("C grade")
default:
    print("Below C")
}

// 3. Use range operators (..<, ...)
let range1 = 1...5    // 1, 2, 3, 4, 5
let range2 = 1..<5    // 1, 2, 3, 4

// 4. Implement Comparable protocol for custom types
struct Person: Comparable {
    let name: String
    let age: Int

    static func < (lhs: Person, rhs: Person) -> Bool {
        return lhs.age < rhs.age
    }
}
```

### Exercise 4.2: Logical Operators and Short-Circuiting (Beginner)

```swift
// 1. Understand short-circuit evaluation
let isWeekend = true
let isRaining = false

// AND (&&) - both must be true
print("Weekend AND not raining: \(isWeekend && !isRaining)")

// OR (||) - at least one must be true
print("Weekend OR raining: \(isWeekend || isRaining)")

// NOT (!) - flips true/false
print("Not weekend: \(!isWeekend)")

// 2. Use nil coalescing (??) and optional chaining
let name: String? = nil
let displayName = name ?? "Guest"
let count = name?.count ?? 0

// 3. Practice with complex boolean expressions
let age = 25
let hasLicense = true
let canDrive = age >= 16 && hasLicense
```

### Exercise 4.3: Control Flow with Optionals (Beginner)

```swift
// 1. Use if-let and guard-let for optional handling
let optionalName: String? = "John"

// if-let style
if let name = optionalName {
    print("Hello, \(name)")
}

// guard-let style
func greet(name: String?) {
    guard let name = name else {
        print("No name provided")
        return
    }
    print("Hello, \(name)")
}

// 2. Practice with switch statements and pattern matching
let point = (x: 10, y: 20)
switch point {
case (0, 0):
    print("Origin")
case (_, 0):
    print("On x-axis")
case (0, _):
    print("On y-axis")
case (let x, let y):
    print("Point at (\(x), \(y))")
}

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
```

### Exercise 4.4: Advanced Switch Patterns (Beginner)

```swift
// 1. Use switch with tuples and ranges
let coordinates = (x: 10, y: 20)
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
let point = (x: 5, y: 5)
switch point {
case let (x, y) where x == y:
    print("Point is on diagonal")
case let (x, y) where x == -y:
    print("Point is on anti-diagonal")
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
case .circle(let radius):
    print("Circle with radius \(radius)")
case .rectangle(let width, let height):
    print("Rectangle \(width)x\(height)")
}
```

### Exercise 4.5: Conditional Expressions (Beginner)

```swift
// 1. Ternary operator usage
let age = 20
let status = age >= 18 ? "Adult" : "Minor"
print("Status: \(status)")

// 2. Nil coalescing with multiple fallbacks
let name: String? = nil
let email: String? = nil
let displayName = name ?? email ?? "Guest"
print("Display name: \(displayName)")

// 3. Simple if-else statements
let score = 85
let grade: String
if score >= 90 {
    grade = "A"
} else if score >= 80 {
    grade = "B"
} else if score >= 70 {
    grade = "C"
} else {
    grade = "F"
}
print("Grade: \(grade)")

// 4. Switch statements
let grade2: String
switch score {
case 90...100:
    grade2 = "A"
case 80..<90:
    grade2 = "B"
case 70..<80:
    grade2 = "C"
default:
    grade2 = "F"
}
```

### Mini-Project: Enhanced Grade Calculator (Beginner)

```swift
// Create a modern grade calculator that:
// 1. Takes a numeric score (0-100)
// 2. Returns a letter grade with plus/minus
// 3. Provides detailed feedback
// 4. Handles invalid scores safely

enum GradeError: Error {
    case invalidScore
    case outOfRange
}

struct GradeResult {
    let letter: String
    let feedback: String
    let needsImprovement: Bool
}

func calculateGrade(score: Int) throws -> GradeResult {
    // Validate input
    guard score >= 0 && score <= 100 else {
        throw GradeError.outOfRange
    }

    // Traditional switch statement for grade calculation
    let letter: String
    switch score {
        case 97...100:
            letter = "A+"
        case 93..<97:
            letter = "A"
        case 90..<93:
            letter = "A-"
        case 87..<90:
            letter = "B+"
        case 83..<87:
            letter = "B"
        case 80..<83:
            letter = "B-"
        case 77..<80:
            letter = "C+"
        case 73..<77:
            letter = "C"
        case 70..<73:
            letter = "C-"
        case 67..<70:
            letter = "D+"
        case 63..<67:
            letter = "D"
        case 60..<63:
            letter = "D-"
        default:
            letter = "F"
    }

    // Traditional if-else for feedback
    let feedback: String
    if score >= 90 {
        feedback = "Excellent work! Keep it up!"
    } else if score >= 80 {
        feedback = "Good job! You're on the right track."
    } else if score >= 70 {
        feedback = "You're passing, but there's room for improvement."
    } else {
        feedback = "You need to work harder to improve your grade."
    }

    return GradeResult(
        letter: letter,
        feedback: feedback,
        needsImprovement: score < 70
    )
}
```

## Chapter 5: Functions

### Exercise 5.1: Basic Functions (Beginner)

**Goal**: Learn how to create and use functions

```swift
// 1. Simple function with no parameters
func sayHello() {
    print("Hello, World!")
}

// 2. Function with parameters
func greet(name: String) {
    print("Hello, \(name)!")
}

// 3. Function that returns a value
func add(a: Int, b: Int) -> Int {
    return a + b
}

// 4. Function with multiple return values
func getNameAndAge() -> (String, Int) {
    return ("John", 25)
}
```

### Exercise 5.2: Parameter Labels and Default Values (Beginner)

**Goal**: Learn about parameter labels and default values

```swift
// 1. External parameter names for clarity
func createUser(withName name: String, andAge age: Int) {
    print("Created user: \(name), age \(age)")
}

// 2. Omit parameter labels with underscore
func multiply(_ a: Int, _ b: Int) -> Int {
    return a * b
}

// 3. Default values
func greet(name: String, greeting: String = "Hello") {
    print("\(greeting), \(name)!")
}

// 4. Multiple values with ...
func sum(numbers: Int...) -> Int {
    var total = 0
    for number in numbers {
        total += number
    }
    return total
}
```

### Exercise 5.3: Scope and Nested Functions (Beginner)

**Goal**: Learn about function scope and nested functions

```swift
// 1. Function scope
func outerFunction() {
    let message = "I'm in the outer function"

    func innerFunction() {
        print(message)  // Can access outer function's variables
        print("I'm nested inside!")
    }

    innerFunction()
}

// 2. Nested function with calculations
func processNumber(_ number: Int) -> Int {
    func double(_ value: Int) -> Int {
        return value * 2
    }

    func addFive(_ value: Int) -> Int {
        return value + 5
    }

    let doubled = double(number)
    let final = addFive(doubled)
    return final
}
```

### Exercise 5.4: Function Types (Beginner)

**Goal**: Learn how functions can be stored and passed around

```swift
// 1. Functions can be stored in variables
func add(a: Int, b: Int) -> Int {
    return a + b
}

func multiply(a: Int, b: Int) -> Int {
    return a * b
}

var operation = add
// Now you can use: operation(5, 3)

// 2. Functions as parameters
func calculate(_ a: Int, _ b: Int, using operation: (Int, Int) -> Int) -> Int {
    return operation(a, b)
}

// 3. Functions that return functions
func makeAdder(amount: Int) -> (Int) -> Int {
    func addAmount(to number: Int) -> Int {
        return number + amount
    }
    return addAmount
}
```

### Mini-Project: Student Grade Manager (Beginner)

**Goal**: Create a student grade management system using functions

```swift
// Create a student grade manager that:
// 1. Stores student information and grades
// 2. Has functions to add grades
// 3. Calculates averages and letter grades
// 4. Prints student reports

struct Student {
    let name: String
    var grades: [Int]
}

func addGrade(to student: inout Student, grade: Int) {
    // Your implementation here
    // Add grade if it's valid (0-100)
}

func calculateAverage(grades: [Int]) -> Double {
    // Your implementation here
    // Return average of grades
}

func getLetterGrade(average: Double) -> String {
    // Your implementation here
    // Return letter grade based on average
}

func printReport(for student: Student) {
    // Your implementation here
    // Print a nice report for the student
}
```

**Check your solution** in `swift-ch1-5-solutions.md` - Mini-Project section

## 🎉 Congratulations! You've Completed the Swift Fundamentals

You've now learned the essential Swift building blocks:

- **Types**: String handling, numeric types, and type inference
- **Variables**: Constant and variable handling
- **Control Flow**: Pattern matching and expressions
- **Functions**: Parameter handling and type inference
- **Closures**: Functional programming features

### What's Next?

Now you're ready for the intermediate concepts covered in the other solution files:

1. **Next: Optionals** (`swift-ch6-7-solutions.md`)

   - Optional handling
   - Error handling
   - Result type usage

2. **Then: Structs & Classes** (`swift-ch8-11-solutions.md`)

   - Value types
   - Reference types
   - Memory management

3. **Finally: Advanced Features** (`swift-ch11-end-solutions.md`)
   - Protocols
   - Generics
   - Concurrency

### Learning Tips

- **Use Xcode Playgrounds**: Perfect for experimenting with Swift features
- **Practice Patterns**: Focus on Swift idioms and best practices
- **Build Projects**: Apply Swift features in real applications
- **Stay Updated**: Follow Swift evolution proposals for new features
- **Use Development Tools**: Leverage Swift's development tools

**Remember**: Swift is about safety, performance, and expressiveness. These fundamentals will help you build robust iOS applications!

---

## 📚 Ready for Advanced Topics?

The fundamentals above (Chapters 1-5) are your foundation. Once you're comfortable with them, continue your Swift journey with these intermediate and advanced topics:

### Intermediate Topics

**Chapter 6-7: Optionals & Tuples**

- Optional handling
- Error handling
- Result type usage
- Tuple patterns

**Chapter 8-11: Structs & Classes**

- Value types
- Reference types
- Memory management
- Property wrappers

**Advanced Features**

- Protocols
- Generics
- Concurrency
- Memory safety

### Learning Path

1. **Master Fundamentals** (this file)
2. **Build Projects** using Swift features
3. **Learn Optionals** for safer code
4. **Understand Types** for better architecture
5. **Explore Concurrency** for better performance

### Final Tips

- **Use Features**: Leverage Swift's capabilities
- **Write Safe Code**: Take advantage of Swift's safety features
- **Think Functionally**: Use functional programming patterns
- **Stay Current**: Keep up with Swift evolution
- **Build Apps**: Apply these concepts to real-world applications

**Happy Swift Learning! 🚀**

---

## Chapter 6: Optionals - Handling Missing Values

Think of optionals like a box that might contain something or might be empty. In Python, you might use `None` to represent missing values - Swift optionals work similarly but are much safer!

### Exercise 6.1: Basic Optionals (Beginner)

**Goal**: Learn how to safely handle values that might be missing

```swift
// 1. What are optionals?
// In Python: name = None  # Could be None or a string
// In Swift: var name: String? = nil  # Could be nil or a string

// Creating optionals (values that might be missing)
var userName: String? = "Alice"        // Has a value
var userAge: Int? = nil               // No value (empty)
var userEmail: String? = "alice@example.com"

// 2. Checking if optionals have values - the safe way
// Using if-let (like Python's "if value is not None:")
if let name = userName {
    print("Hello, \(name)!")  // Only runs if userName has a value
} else {
    print("No name provided")
}

// 3. Multiple optionals at once
if let name = userName, let email = userEmail {
    print("User: \(name), Email: \(email)")
} else {
    print("Missing some information")
}

// 4. Using guard for early exits (like Python's early return)
func greetUser(name: String?, age: Int?) {
    // Check requirements first
    guard let name = name else {
        print("Can't greet without a name!")
        return
    }

    guard let age = age else {
        print("Hello \(name)! (age unknown)")
        return
    }

    print("Hello \(name), you are \(age) years old!")
}

// 5. Default values with ?? (nil coalescing)
// Like Python's: name = user_name or "Guest"
let displayName = userName ?? "Guest"
let displayAge = userAge ?? 0

print("Display: \(displayName), Age: \(displayAge)")
```

**Python Comparison**: Swift optionals are like Python's `None` handling, but Swift enforces safe unwrapping at compile time.

### Exercise 6.2: Safe Error Handling (Beginner)

**Goal**: Learn how to handle errors gracefully in Swift

```swift
// 1. Creating custom errors (like Python exceptions)
enum UserError: Error {
    case nameEmpty
    case ageTooYoung
    case emailInvalid

    // Human-readable error messages
    var message: String {
        switch self {
        case .nameEmpty:
            return "Name cannot be empty"
        case .ageTooYoung:
            return "Must be at least 13 years old"
        case .emailInvalid:
            return "Email must contain @"
        }
    }
}

// 2. Functions that can fail (like Python functions that raise exceptions)
func createUser(name: String, age: Int, email: String) throws -> String {
    // Check each requirement
    if name.isEmpty {
        throw UserError.nameEmpty
    }

    if age < 13 {
        throw UserError.ageTooYoung
    }

    if !email.contains("@") {
        throw UserError.emailInvalid
    }

    return "User created: \(name)"
}

// 3. Using do-catch (like Python's try-except)
func testUserCreation() {
    // Try to create a user
    do {
        let result = try createUser(name: "Alice", age: 25, email: "alice@example.com")
        print("Success: \(result)")
    } catch let error as UserError {
        print("Error: \(error.message)")
    } catch {
        print("Unexpected error: \(error)")
    }

    // Try with invalid data
    do {
        let result = try createUser(name: "", age: 10, email: "invalid")
        print("Success: \(result)")
    } catch let error as UserError {
        print("Error: \(error.message)")
    }
}

// 4. Result type - explicit success/failure
func validateEmail(_ email: String) -> Result<String, UserError> {
    if email.contains("@") {
        return .success(email.lowercased())
    } else {
        return .failure(.emailInvalid)
    }
}
```

### Exercise 6.3: Working with Optional Collections (Beginner)

**Goal**: Learn how to work with collections that might be nil

```swift
// 1. Optional arrays and dictionaries
var numbers: [Int]? = [1, 2, 3, 4, 5]
var scores: [String: Int]? = ["Alice": 95, "Bob": 87]
var emptyList: [String]? = nil

// 2. Safe access to optional collections
if let numbers = numbers {
    print("We have \(numbers.count) numbers")
    print("First number: \(numbers.first ?? 0)")
} else {
    print("No numbers available")
}

// 3. Using nil coalescing with collections
let safeNumbers = numbers ?? []  // Empty array if nil
let safeScores = scores ?? [:]   // Empty dictionary if nil

print("Safe numbers count: \(safeNumbers.count)")
print("Safe scores count: \(safeScores.count)")

// 4. Filtering out nil values with compactMap
let mixedNumbers: [Int?] = [1, nil, 3, nil, 5]
let validNumbers = mixedNumbers.compactMap { $0 }  // Removes nils
print("Valid numbers: \(validNumbers)")  // [1, 3, 5]

// 5. Working with nested optionals
struct User {
    let name: String
    var address: Address?
}

struct Address {
    let street: String
    let city: String
}

let user = User(name: "Alice", address: Address(street: "Main St", city: "Boston"))

// Optional chaining (like Python's getattr with default)
let city = user.address?.city ?? "Unknown"
print("User city: \(city)")

// Example with nil address
let userWithoutAddress = User(name: "Bob", address: nil)
let unknownCity = userWithoutAddress.address?.city ?? "Unknown"
print("User city: \(unknownCity)")
```

### Mini-Project: Simple Grade Book (Beginner)

**Goal**: Create a grade book system using optionals and error handling

```swift
// A simple grade book using tuples and optionals
struct GradeBook {
    // Store grades as tuples with student info
    private var grades: [(name: String, subject: String, score: Int)] = []

    // Add a grade
    mutating func addGrade(name: String, subject: String, score: Int) -> Bool {
        guard score >= 0 && score <= 100 else {
            print("Score must be between 0 and 100")
            return false
        }

        grades.append((name, subject, score))
        return true
    }

    // Get average for a student
    func getAverage(for studentName: String) -> Double? {
        let studentGrades = grades.filter { $0.name == studentName }
        guard !studentGrades.isEmpty else { return nil }

        let total = studentGrades.reduce(0) { $0 + $1.score }
        return Double(total) / Double(studentGrades.count)
    }

    // Get grade for specific subject
    func getGrade(for student: String, in subject: String) -> Int? {
        return grades.first { $0.name == student && $0.subject == subject }?.score
    }

    // Get class statistics for a subject
    func getClassStats(for subject: String) -> (average: Double, highest: Int, lowest: Int)? {
        let subjectGrades = grades.filter { $0.subject == subject }
        guard !subjectGrades.isEmpty else { return nil }

        let scores = subjectGrades.map { $0.score }
        let total = scores.reduce(0, +)
        let average = Double(total) / Double(scores.count)
        let highest = scores.max()!
        let lowest = scores.min()!

        return (average, highest, lowest)
    }
}
```

**Check your solution** in `swift-ch6-7-solutions.md` - Mini-Project section

## Chapter 7: Tuples - Grouping Related Values

Tuples are like Python tuples - they group related values together. Great for returning multiple values from functions!

### Exercise 7.1: Basic Tuples (Beginner)

**Goal**: Learn how to group related values together

```swift
// 1. Creating tuples (like Python tuples)
let person = ("Alice", 25)  // Name and age
let point = (x: 10, y: 20)  // Coordinates with labels
let rgb = (red: 255, green: 0, blue: 0)  // Color values

// 2. Accessing tuple values
// By position (like Python: person[0])
let name = person.0
let age = person.1
print("Person: \(name), Age: \(age)")

// By label (more readable)
let x = point.x
let y = point.y
print("Point: (\(x), \(y))")

// 3. Destructuring tuples (like Python: name, age = person)
let (userName, userAge) = person
print("Destructured: \(userName), \(userAge)")

// Ignoring values with underscore
let (r, _, b) = rgb  // Only get red and blue
print("Red: \(r), Blue: \(b)")

// 4. Tuples with different types
let mixedData = ("Swift", 5.7, true)  // String, Double, Bool
let (language, version, isAwesome) = mixedData
print("\(language) \(version) is awesome: \(isAwesome)")
```

### Exercise 7.2: Functions Returning Tuples (Beginner)

**Goal**: Learn how to return multiple values from functions

```swift
// 1. Functions returning multiple values
func getPersonInfo() -> (name: String, age: Int) {
    return ("Bob", 30)
}

// Using the returned tuple
let personInfo = getPersonInfo()
print("Name: \(personInfo.name), Age: \(personInfo.age)")

// Or destructure immediately
let (personName, personAge) = getPersonInfo()
print("Person: \(personName), \(personAge)")

// 2. Math function returning multiple results
func divideWithRemainder(_ a: Int, by b: Int) -> (quotient: Int, remainder: Int)? {
    guard b != 0 else { return nil }  // Can't divide by zero
    return (a / b, a % b)
}

// Using the function
if let result = divideWithRemainder(17, by: 5) {
    print("17 ÷ 5 = \(result.quotient) remainder \(result.remainder)")
} else {
    print("Cannot divide by zero")
}

// 3. Finding min and max
func findMinMax(in numbers: [Int]) -> (min: Int, max: Int)? {
    guard !numbers.isEmpty else { return nil }

    let min = numbers.min()!  // Safe because we checked empty
    let max = numbers.max()!
    return (min, max)
}

// 4. Coordinate calculations
func calculateDistance(from point1: (x: Double, y: Double),
                      to point2: (x: Double, y: Double)) -> (distance: Double, midpoint: (x: Double, y: Double)) {
    let dx = point2.x - point1.x
    let dy = point2.y - point1.y
    let distance = sqrt(dx * dx + dy * dy)
    let midpoint = (x: (point1.x + point2.x) / 2, y: (point1.y + point2.y) / 2)

    return (distance, midpoint)
}
```

### Exercise 7.3: Comparing Tuples (Beginner)

**Goal**: Learn how tuples can be compared and sorted

```swift
// 1. Tuples can be compared if their elements can be compared
let point1 = (x: 1, y: 2)
let point2 = (x: 1, y: 3)
let point3 = (x: 2, y: 1)

// Comparison works left to right
print("point1 < point2: \(point1 < point2)")  // true (same x, but 2 < 3)
print("point1 < point3: \(point1 < point3)")  // true (1 < 2)

// 2. Useful for sorting
let points = [(1, 3), (2, 1), (1, 2), (3, 1)]
let sortedPoints = points.sorted { $0 < $1 }
print("Sorted points: \(sortedPoints)")

// 3. Comparing students by grade, then by name
let students = [
    (name: "Alice", grade: 95),
    (name: "Bob", grade: 87),
    (name: "Charlie", grade: 95),
    (name: "Diana", grade: 92)
]

// Sort by grade (descending), then by name
let sortedStudents = students.sorted { student1, student2 in
    if student1.grade != student2.grade {
        return student1.grade > student2.grade  // Higher grade first
    } else {
        return student1.name < student2.name    // Alphabetical for ties
    }
}
```

## Chapter 8: Structs - Value Types

Structs are like Python's dataclasses - they group related data together. In Swift, structs are "value types" which means they get copied when you assign them.

### Exercise 8.1: Basic Structs (Beginner)

**Goal**: Learn how to create and use structs for simple data

```swift
// 1. Creating a simple struct (like Python's dataclass)
struct Person {
    let name: String      // Can't change after creation
    var age: Int         // Can be changed
    var email: String    // Can be changed

    // Computed property (like Python's @property)
    var description: String {
        return "\(name), \(age) years old (\(email))"
    }

    // Method to have a birthday
    mutating func haveBirthday() {
        age += 1
        print("Happy birthday \(name)! Now \(age) years old.")
    }
}

// 2. Creating and using structs
var person1 = Person(name: "Alice", age: 25, email: "alice@example.com")
print(person1.description)

// Structs are copied when assigned (value semantics)
var person2 = person1
person2.age = 30  // Only changes person2, not person1

print("Person 1: \(person1.age)")  // Still 25
print("Person 2: \(person2.age)")  // Now 30

// Using methods
person1.haveBirthday()  // Alice is now 26
```

### Exercise 8.2: Structs vs Classes (Beginner)

**Goal**: Understand the difference between value types and reference types

```swift
// 1. Struct (Value Type) - Gets copied
struct PointStruct {
    var x: Int
    var y: Int

    mutating func moveBy(x deltaX: Int, y deltaY: Int) {
        x += deltaX
        y += deltaY
    }
}

// 2. Class (Reference Type) - Gets shared
class PointClass {
    var x: Int
    var y: Int

    init(x: Int, y: Int) {
        self.x = x
        self.y = y
    }

    func moveBy(x deltaX: Int, y deltaY: Int) {
        x += deltaX
        y += deltaY
    }
}

// 3. Comparing behavior
print("=== Struct Behavior (Value Type) ===")
var structPoint1 = PointStruct(x: 10, y: 20)
var structPoint2 = structPoint1  // COPIED

structPoint2.moveBy(x: 5, y: 5)  // Only affects structPoint2

print("Struct Point 1: (\(structPoint1.x), \(structPoint1.y))")  // (10, 20) - unchanged
print("Struct Point 2: (\(structPoint2.x), \(structPoint2.y))")  // (15, 25) - changed

print("\n=== Class Behavior (Reference Type) ===")
let classPoint1 = PointClass(x: 10, y: 20)
let classPoint2 = classPoint1  // SHARED (same object)

classPoint2.moveBy(x: 5, y: 5)  // Affects BOTH because they're the same object

print("Class Point 1: (\(classPoint1.x), \(classPoint1.y))")  // (15, 25) - changed!
print("Class Point 2: (\(classPoint2.x), \(classPoint2.y))")  // (15, 25) - changed!
```

### Exercise 8.3: Practical Struct Example (Beginner)

**Goal**: Create a practical example using structs

```swift
// A practical example: Bank Account
struct BankAccount {
    let accountNumber: String
    private(set) var balance: Double  // Can only be changed by the struct itself
    let accountHolder: String

    init(accountNumber: String, accountHolder: String, initialBalance: Double = 0) {
        self.accountNumber = accountNumber
        self.accountHolder = accountHolder
        self.balance = max(0, initialBalance)  // Can't start with negative balance
    }

    // Deposit money
    mutating func deposit(_ amount: Double) -> Bool {
        guard amount > 0 else {
            print("Cannot deposit negative or zero amount")
            return false
        }

        balance += amount
        print("Deposited $\(amount). New balance: $\(balance)")
        return true
    }

    // Withdraw money
    mutating func withdraw(_ amount: Double) -> Bool {
        guard amount > 0 else {
            print("Cannot withdraw negative or zero amount")
            return false
        }

        guard amount <= balance else {
            print("Insufficient funds. Current balance: $\(balance)")
            return false
        }

        balance -= amount
        print("Withdrew $\(amount). New balance: $\(balance)")
        return true
    }

    // Check balance
    func checkBalance() {
        print("\(accountHolder)'s account (\(accountNumber)): $\(balance)")
    }
}
```

## Chapter 9: Classes - Reference Types

Classes are like Python classes - they can be inherited and are shared when assigned. Use classes when you need sharing or inheritance.

### Exercise 9.1: Basic Classes (Beginner)

**Goal**: Learn how to create and use classes

```swift
// 1. Base class
class Animal {
    let name: String
    var age: Int
    var energy: Int = 100

    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }

    func eat() {
        energy += 10
        print("\(name) is eating. Energy: \(energy)")
    }

    func sleep() {
        energy += 20
        print("\(name) is sleeping. Energy: \(energy)")
    }

    func makeSound() {
        print("\(name) makes a sound")
    }

    func describe() -> String {
        return "\(name) is a \(age)-year-old animal with \(energy) energy"
    }
}

// 2. Subclass (inheritance)
class Dog: Animal {
    let breed: String
    var isGoodBoy: Bool = true

    init(name: String, age: Int, breed: String) {
        self.breed = breed
        super.init(name: name, age: age)  // Call parent's init
    }

    // Override parent method
    override func makeSound() {
        print("\(name) the \(breed) barks: Woof! Woof!")
    }

    // New method specific to dogs
    func fetch() {
        guard energy >= 15 else {
            print("\(name) is too tired to fetch")
            return
        }

        energy -= 15
        print("\(name) fetches the ball! Energy: \(energy)")
    }

    func wagTail() {
        print("\(name) wags tail happily!")
    }

    // Override description to include breed
    override func describe() -> String {
        return "\(name) is a \(age)-year-old \(breed) with \(energy) energy"
    }
}

class Cat: Animal {
    let isIndoor: Bool
    var livesLeft: Int = 9

    init(name: String, age: Int, isIndoor: Bool) {
        self.isIndoor = isIndoor
        super.init(name: name, age: age)
    }

    override func makeSound() {
        print("\(name) the cat meows: Meow!")
    }

    func purr() {
        energy += 5
        print("\(name) purrs contentedly. Energy: \(energy)")
    }

    func climb() {
        guard energy >= 10 else {
            print("\(name) is too tired to climb")
            return
        }
        energy -= 10
        print("\(name) climbs up high!")
    }
}
```

### Exercise 9.2: Inheritance (Beginner)

**Goal**: Learn how to create class hierarchies

```swift
// Using the Animal class from Exercise 9.1, let's see inheritance in action

// Create instances and test inheritance
let dog = Dog(name: "Buddy", age: 3, breed: "Golden Retriever")
let cat = Cat(name: "Whiskers", age: 2, isIndoor: true)

print("=== Animal Behaviors ===")
dog.makeSound()  // Calls Dog's version
cat.makeSound()  // Calls Cat's version

print("\n=== Shared Animal Methods ===")
dog.eat()        // Inherited from Animal
cat.sleep()      // Inherited from Animal

print("\n=== Specific Behaviors ===")
dog.fetch()      // Dog-specific
dog.wagTail()    // Dog-specific
cat.purr()       // Cat-specific
cat.climb()      // Cat-specific

print("\n=== Descriptions ===")
print(dog.describe())
print(cat.describe())
```

### Exercise 9.3: Properties and Methods (Beginner)

**Goal**: Learn about different types of properties and methods

```swift
// Advanced property features
class Temperature {
    // Stored property with property observers
    var celsius: Double = 0 {
        willSet {
            print("Temperature will change from \(celsius)°C to \(newValue)°C")
        }
        didSet {
            print("Temperature changed from \(oldValue)°C to \(celsius)°C")
        }
    }

    // Computed properties
    var fahrenheit: Double {
        get {
            return celsius * 9/5 + 32
        }
        set {
            celsius = (newValue - 32) * 5/9
        }
    }

    var kelvin: Double {
        get {
            return celsius + 273.15
        }
        set {
            celsius = newValue - 273.15
        }
    }

    // Read-only computed property
    var description: String {
        return String(format: "%.1f°C (%.1f°F, %.1fK)", celsius, fahrenheit, kelvin)
    }

    init(celsius: Double) {
        self.celsius = celsius
    }

    // Class method (like Python's @classmethod)
    class func roomTemperature() -> Temperature {
        return Temperature(celsius: 22)
    }

    // Static method
    static func freezingPoint() -> Temperature {
        return Temperature(celsius: 0)
    }
}
```

### Mini-Project: Simple Library System (Beginner)

```swift
// A beginner-friendly library management system

// 1. Book struct (value type for simple data)
struct Book {
    let isbn: String
    let title: String
    let author: String
    let pages: Int
    var isAvailable: Bool = true

    var description: String {
        let status = isAvailable ? "Available" : "Checked out"
        return "\"\(title)\" by \(author) (\(pages) pages) - \(status)"
    }
}

// 2. Library Member class (reference type for shared state)
class LibraryMember {
    let memberID: String
    let name: String
    let email: String
    private var checkedOutBooks: [String] = []  // Store ISBNs
    let maxBooks: Int

    init(memberID: String, name: String, email: String, maxBooks: Int = 3) {
        self.memberID = memberID
        self.name = name
        self.email = email
        self.maxBooks = maxBooks
    }

    func canCheckoutMore() -> Bool {
        return checkedOutBooks.count < maxBooks
    }

    func checkoutBook(isbn: String) -> Bool {
        guard canCheckoutMore() else {
            print("\(name) has reached the maximum limit of \(maxBooks) books")
            return false
        }

        checkedOutBooks.append(isbn)
        print("\(name) checked out book with ISBN: \(isbn)")
        return true
    }

    func returnBook(isbn: String) -> Bool {
        if let index = checkedOutBooks.firstIndex(of: isbn) {
            checkedOutBooks.remove(at: index)
            print("\(name) returned book with ISBN: \(isbn)")
            return true
        } else {
            print("\(name) doesn't have a book with ISBN: \(isbn)")
            return false
        }
    }

    func getCheckedOutBooks() -> [String] {
        return checkedOutBooks
    }

    var summary: String {
        return "\(name) (\(memberID)) - \(checkedOutBooks.count)/\(maxBooks) books checked out"
    }
}

// 3. Library class (manages books and members)
class Library {
    private var books: [String: Book] = [:]  // ISBN -> Book
    private var members: [String: LibraryMember] = [:]  // MemberID -> Member

    // Add a book to the library
    func addBook(_ book: Book) {
        books[book.isbn] = book
        print("Added book: \(book.title)")
    }

    // Register a new member
    func registerMember(_ member: LibraryMember) {
        members[member.memberID] = member
        print("Registered member: \(member.name)")
    }

    // Check out a book
    func checkoutBook(isbn: String, memberID: String) -> Bool {
        guard var book = books[isbn] else {
            print("Book with ISBN \(isbn) not found")
            return false
        }

        guard let member = members[memberID] else {
            print("Member with ID \(memberID) not found")
            return false
        }

        guard book.isAvailable else {
            print("Book \"\(book.title)\" is already checked out")
            return false
        }

        guard member.checkoutBook(isbn: isbn) else {
            return false  // Member couldn't check out more books
        }

        book.isAvailable = false
        books[isbn] = book  // Update the book in our dictionary
        print("Successfully checked out \"\(book.title)\" to \(member.name)")
        return true
    }

    // Return a book
    func returnBook(isbn: String, memberID: String) -> Bool {
        guard var book = books[isbn] else {
            print("Book with ISBN \(isbn) not found")
            return false
        }

        guard let member = members[memberID] else {
            print("Member with ID \(memberID) not found")
            return false
        }

        guard member.returnBook(isbn: isbn) else {
            return false  // Member didn't have this book
        }

        book.isAvailable = true
        books[isbn] = book
        print("Successfully returned \"\(book.title)\" from \(member.name)")
        return true
    }

    // Search for books
    func searchBooks(title: String) -> [Book] {
        return books.values.filter { book in
            book.title.lowercased().contains(title.lowercased())
        }
    }

    // Get available books
    func getAvailableBooks() -> [Book] {
        return books.values.filter { $0.isAvailable }
    }

    // Get member info
    func getMemberInfo(memberID: String) -> String? {
        return members[memberID]?.summary
    }
}
```

**Check your solution** in `swift-ch8-11-solutions.md` - Mini-Project section

## Chapter 10: Protocols - Defining Behavior

Protocols are like Python's Abstract Base Classes - they define what a type must be able to do. Unlike inheritance, a class can conform to multiple protocols.

### Exercise 10.1: Basic Protocols (Beginner)

**Goal**: Learn how to define and use protocols

```swift
// 1. Protocol definition (like Python's ABC - Abstract Base Class)
protocol Flyable {
    var maxAltitude: Double { get }
    var canFly: Bool { get }

    func takeOff()
    func land()
    func fly(to destination: String)
}

// Protocol with default implementation (like Python's ABC with default methods)
extension Flyable {
    func fly(to destination: String) {
        if canFly {
            takeOff()
            print("Flying to \(destination)...")
            land()
        } else {
            print("Cannot fly to \(destination)")
        }
    }
}

// 2. Classes conforming to protocols
class Bird: Animal, Flyable {
    let species: String
    let maxAltitude: Double
    var canFly: Bool = true

    init(name: String, age: Int, species: String, maxAltitude: Double) {
        self.species = species
        self.maxAltitude = maxAltitude
        super.init(name: name, age: age)
    }

    // Protocol requirements
    func takeOff() {
        guard energy >= 20 else {
            print("\(name) is too tired to take off")
            canFly = false
            return
        }
        energy -= 20
        print("\(name) the \(species) takes off!")
    }

    func land() {
        energy -= 5
        print("\(name) lands gracefully")
    }

    override func makeSound() {
        print("\(name) the \(species) chirps")
    }
}

class Airplane: Flyable {
    let model: String
    let maxAltitude: Double
    var canFly: Bool = true
    var fuel: Double = 100

    init(model: String, maxAltitude: Double) {
        self.model = model
        self.maxAltitude = maxAltitude
    }

    func takeOff() {
        guard fuel >= 30 else {
            print("\(model) doesn't have enough fuel to take off")
            canFly = false
            return
        }
        fuel -= 30
        print("\(model) airplane takes off with a roar!")
    }

    func land() {
        fuel -= 10
        print("\(model) airplane lands on the runway")
    }

    func refuel() {
        fuel = 100
        canFly = true
        print("\(model) has been refueled")
    }
}
```

### Exercise 10.2: Access Control (Beginner)

**Goal**: Learn how to control access to properties and methods

```swift
// 1. Access control levels (like Python's public/private conventions)
class BankAccount {
    // Public - anyone can access (like Python: no underscore)
    let accountNumber: String
    let accountHolder: String

    // Private - only this class can access (like Python: __private)
    private var balance: Double = 0
    private var pin: String

    // Internal - same module can access (default in Swift)
    internal var accountType: String = "Checking"

    // File-private - only this file can access
    fileprivate var lastTransaction: String = "None"

    init(accountNumber: String, accountHolder: String, pin: String, initialBalance: Double = 0) {
        self.accountNumber = accountNumber
        self.accountHolder = accountHolder
        self.pin = pin
        self.balance = max(0, initialBalance)
    }

    // Public methods to safely access private data
    func checkBalance(enteredPin: String) -> Double? {
        guard validatePin(enteredPin) else {
            print("Invalid PIN")
            return nil
        }
        return balance
    }

    func deposit(_ amount: Double, pin enteredPin: String) -> Bool {
        guard validatePin(enteredPin) else {
            print("Invalid PIN")
            return false
        }

        guard amount > 0 else {
            print("Cannot deposit negative or zero amount")
            return false
        }

        balance += amount
        lastTransaction = "Deposited $\(amount)"
        print("Successfully deposited $\(amount). New balance: $\(balance)")
        return true
    }

    func withdraw(_ amount: Double, pin enteredPin: String) -> Bool {
        guard validatePin(enteredPin) else {
            print("Invalid PIN")
            return false
        }

        guard amount > 0 else {
            print("Cannot withdraw negative or zero amount")
            return false
        }

        guard amount <= balance else {
            print("Insufficient funds")
            return false
        }

        balance -= amount
        lastTransaction = "Withdrew $\(amount)"
        print("Successfully withdrew $\(amount). New balance: $\(balance)")
        return true
    }

    // Private helper method
    private func validatePin(_ enteredPin: String) -> Bool {
        return enteredPin == pin
    }

    // Read-only computed property for safe access
    var accountSummary: String {
        return "\(accountHolder)'s \(accountType) account (\(accountNumber))"
    }
}
```

### Mini-Project: Simple Pet Care System (Beginner)

```swift
// A beginner-friendly pet care system using classes, inheritance, and protocols

// 1. Protocol for things that need care
protocol Caregivable {
    var name: String { get }
    var happiness: Int { get set }
    var health: Int { get set }

    mutating func feed()
    mutating func play()
    mutating func giveAttention()
}

// Default implementations
extension Caregivable {
    mutating func giveAttention() {
        happiness += 5
        print("\(name) feels loved! Happiness: \(happiness)")
    }
}

// 2. Base Pet class
class Pet: Caregivable {
    let name: String
    let species: String
    var age: Int
    var happiness: Int = 50
    var health: Int = 100
    var energy: Int = 100

    // Private properties for internal state
    private var lastFed: String = "Never"
    private var lastPlayed: String = "Never"

    init(name: String, species: String, age: Int) {
        self.name = name
        self.species = species
        self.age = age
    }

    func feed() {
        health += 10
        happiness += 5
        energy += 15
        lastFed = "Recently"
        print("\(name) enjoyed the meal! Health: \(health), Happiness: \(happiness)")
    }

    func play() {
        guard energy >= 20 else {
            print("\(name) is too tired to play")
            return
        }

        happiness += 15
        energy -= 20
        lastPlayed = "Recently"
        print("\(name) had fun playing! Happiness: \(happiness), Energy: \(energy)")
    }

    func sleep() {
        energy = min(100, energy + 40)
        print("\(name) had a good nap. Energy: \(energy)")
    }

    func getStatus() -> String {
        return "\(name) (\(species), \(age) years old) - Health: \(health), Happiness: \(happiness), Energy: \(energy)"
    }

    // Method that can be overridden
    func makeSound() {
        print("\(name) makes a sound")
    }
}

// 3. Specific pet types with inheritance
class Dog: Pet {
    let breed: String
    var hasWalked: Bool = false

    init(name: String, age: Int, breed: String) {
        self.breed = breed
        super.init(name: name, species: "Dog", age: age)
    }

    override func makeSound() {
        print("\(name) the \(breed) barks: Woof!")
    }

    override func play() {
        guard energy >= 20 else {
            print("\(name) is too tired to play fetch")
            return
        }

        happiness += 20  // Dogs love playing more than generic pets
        energy -= 20
        print("\(name) loved playing fetch! Happiness: \(happiness)")
    }

    func walk() {
        guard energy >= 25 else {
            print("\(name) is too tired for a walk")
            return
        }

        energy -= 25
        happiness += 10
        health += 5
        hasWalked = true
        print("\(name) enjoyed the walk! Health: \(health), Happiness: \(happiness)")
    }
}

class Cat: Pet {
    let isIndoor: Bool
    var hasBeenPetted: Bool = false

    init(name: String, age: Int, isIndoor: Bool) {
        self.isIndoor = isIndoor
        super.init(name: name, species: "Cat", age: age)
    }

    override func makeSound() {
        print("\(name) the cat meows: Meow!")
    }

    override func play() {
        guard energy >= 15 else {  // Cats need less energy to play
            print("\(name) is too tired to play")
            return
        }

        happiness += 10
        energy -= 15
        print("\(name) played with a toy mouse! Happiness: \(happiness)")
    }

    func pet() {
        happiness += 8
        hasBeenPetted = true
        print("\(name) purrs while being petted! Happiness: \(happiness)")
    }
}

// 4. Pet owner class to manage pets
class PetOwner {
    let name: String
    private var pets: [Pet] = []

    init(name: String) {
        self.name = name
    }

    func adoptPet(_ pet: Pet) {
        pets.append(pet)
        print("\(name) adopted \(pet.name)!")
    }

    func feedAllPets() {
        print("\n\(name) is feeding all pets:")
        for pet in pets {
            pet.feed()
        }
    }

    func playWithAllPets() {
        print("\n\(name) is playing with all pets:")
        for pet in pets {
            pet.play()
        }
    }

    func checkAllPets() {
        print("\n=== Pet Status Report ===")
        for pet in pets {
            print(pet.getStatus())
            pet.makeSound()
        }
    }

    func giveDailyAttention() {
        print("\n\(name) is giving attention to all pets:")
        for var pet in pets {
            pet.giveAttention()
        }
    }

    func getPetCount() -> Int {
        return pets.count
    }
}
```

**Check your solution** in `swift-ch11-end-solutions.md` - Mini-Project section

## Key Takeaways for Beginners

### About Optionals:

1. **Use `?` for values that might be missing** - like `String?` instead of `String`
2. **Always unwrap safely** - use `if let` or `guard let`, avoid `!`
3. **Use `??` for default values** - like `name ?? "Guest"`
4. **Optional chaining with `?.`** - safely access nested properties

### About Tuples:

1. **Perfect for grouping related values** - especially for function returns
2. **Use labels for clarity** - `(name: String, age: Int)` is better than `(String, Int)`
3. **Great for simple data** - don't need a full struct for everything
4. **Can be compared and sorted** - useful for multi-criteria sorting

### About Structs vs Classes:

- **Structs** = Like separate photocopies (value types)
- **Classes** = Like shared documents (reference types)
- **Use structs for simple data** - no need for sharing or inheritance
- **Use classes for complex objects** - need shared state or inheritance

### About Protocols:

- **Define what a type must be able to do** (like Python's ABC)
- **A class can conform to multiple protocols**
- **Protocols can have default implementations**
- **Enable polymorphism without inheritance**

### Python Comparisons:

- **Swift Optional** ≈ **Python None checks**, but safer
- **Swift Tuples** ≈ **Python tuples**, but with optional labels
- **Swift Struct** ≈ **Python dataclass** with value semantics
- **Swift Class** ≈ **Python class** with reference semantics
- **Swift Protocol** ≈ **Python ABC (Abstract Base Classes)**
- **Swift `if let`** ≈ **Python `if value is not None:`**
- **Swift `??`** ≈ **Python `or` operator** for defaults

Remember: Start with simple examples and gradually build complexity. These concepts form the foundation for more advanced Swift programming!
