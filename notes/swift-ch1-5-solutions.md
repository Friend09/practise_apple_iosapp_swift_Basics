# Swift Beginner's Guide: Fundamentals (Chapters 1-5)

This guide provides beginner-friendly solutions for Swift fundamentals. Each concept is explained with simple examples and Python comparisons to help you understand.

**For Beginners**: These are the essential Swift building blocks. Master these first before moving to advanced topics!

## Chapter 2: Basic Types in Swift

### Exercise 2.1: Type Declaration and Inference (Solution)

```swift
// Let Swift figure out the type (type inference)
let name = "Swift Learner"      // Swift knows this is a String
let age = 25                    // Swift knows this is an Int
let height = 5.8                // Swift knows this is a Double
let isStudent = true            // Swift knows this is a Bool

// You can also be explicit about types
let userName: String = "John"
let userAge: Int = 30
let weight: Double = 150.5
let isActive: Bool = false

// Print them out
print("Name: \(name)")
print("Age: \(age)")
print("Height: \(height)")
print("Is student: \(isStudent)")
```

**Beginner Explanation:** Swift is smart enough to figure out what type your variables should be based on the value you give them. This is called "type inference." You can also write the type explicitly with a colon.

**Python Comparison:** This is like Python's dynamic typing, but Swift checks types at compile time:
```python
# Python - types determined at runtime
name = "Swift Learner"  # Python figures out this is a string
age = 25               # Python figures out this is an int
```

### Exercise 2.2: Type Conversion (Solution)

```swift
// Converting between types
let number = 42
let numberAsString = String(number)
print("Number as string: \(numberAsString)")

// Converting string to number (might fail!)
let textNumber = "123"
let convertedNumber = Int(textNumber)

if convertedNumber != nil {
    print("Converted successfully: \(convertedNumber!)")
} else {
    print("Couldn't convert to number")
}

// Converting between numbers
let wholeNumber = 42
let decimalNumber = Double(wholeNumber)
print("As decimal: \(decimalNumber)")

let pi = 3.14159
let piAsInt = Int(pi)  // This cuts off the decimal part
print("Pi as int: \(piAsInt)")
```

**Beginner Explanation:** To convert between types, use the type name like `String()`, `Int()`, or `Double()`. Some conversions might fail (like converting "abc" to a number), so Swift gives you an optional result.

**Python Comparison:** Similar to Python's type conversion, but safer:
```python
# Python - might crash if conversion fails
number = 42
text = str(number)        # Like Swift's String(number)
back_to_int = int(text)   # Like Swift's Int(text), but Swift returns optional
```

### Exercise 2.3: String Manipulation (Solution)

```swift
let firstName = "John"
let lastName = "Doe"

// Combine strings
let fullName = firstName + " " + lastName
print("Full name: \(fullName)")

// String interpolation (putting variables in strings)
let message = "Hello, \(firstName)! You are \(25) years old."
print(message)

// String properties and methods
print("Character count: \(fullName.count)")
print("Uppercase: \(fullName.uppercased())")
print("Lowercase: \(fullName.lowercased())")

// Check string contents
if fullName.contains("John") {
    print("Contains 'John'")
}

if fullName.hasPrefix("John") {
    print("Starts with 'John'")
}
```

**Beginner Explanation:** You can combine strings with `+` or use string interpolation with `\()`. Strings have useful methods like `count`, `uppercased()`, and `contains()`.

**Python Comparison:** Very similar to Python string operations:
```python
# Python string operations
first_name = "John"
last_name = "Doe"
full_name = first_name + " " + last_name        # Same as Swift
message = f"Hello, {first_name}!"               # Like Swift's \() interpolation
print(len(full_name))                           # Like Swift's .count
print(full_name.upper())                        # Like Swift's .uppercased()
```

### Exercise 2.4: Working with Numbers (Solution)

```swift
let a = 10
let b = 3

// Basic math
print("\(a) + \(b) = \(a + b)")
print("\(a) - \(b) = \(a - b)")
print("\(a) * \(b) = \(a * b)")
print("\(a) / \(b) = \(a / b)")  // Integer division = 3
print("\(a) % \(b) = \(a % b)")  // Remainder = 1

// Decimal division
let decimalResult = Double(a) / Double(b)
print("Decimal division: \(decimalResult)")

// Useful functions
print("Maximum: \(max(a, b))")
print("Minimum: \(min(a, b))")
print("Absolute value of -5: \(abs(-5))")

// Random number
let randomNum = Int.random(in: 1...10)
print("Random number 1-10: \(randomNum)")
```

**Beginner Explanation:** Swift has all the basic math operators. Division of integers gives you an integer result. For decimal results, convert to Double first.

**Python Comparison:** Math operations are similar, but Swift is more strict about types:
```python
# Python - automatically handles type conversion
a = 10
b = 3
result = a / b        # Python 3 gives 3.333... automatically
remainder = a % b     # Same as Swift

# Swift requires explicit conversion for decimal division
```

### Mini-Project: Simple Calculator (Solution)

```swift
func calculate(first: Double, second: Double, operation: String) -> Double? {
    switch operation {
    case "+":
        return first + second
    case "-":
        return first - second
    case "*":
        return first * second
    case "/":
        if second != 0 {
            return first / second
        } else {
            print("Error: Can't divide by zero!")
            return nil
        }
    default:
        print("Error: Unknown operation")
        return nil
    }
}

// Test the calculator
let result1 = calculate(first: 10, second: 5, operation: "+")
let result2 = calculate(first: 10, second: 3, operation: "/")
let result3 = calculate(first: 10, second: 0, operation: "/")

if let answer1 = result1 {
    print("10 + 5 = \(answer1)")
}

if let answer2 = result2 {
    print("10 / 3 = \(answer2)")
}

if result3 == nil {
    print("Division by zero failed as expected")
}
```

## Chapter 3: Variables and Constants

### Exercise 3.1: Variables vs Constants (Solution)

```swift
// Constants (can't change after setting)
let userName = "SwiftLearner"
let userId = 12345

// Variables (can change)
var currentScore = 100
var isLoggedIn = false

print("User: \(userName), Score: \(currentScore)")

// We can change variables
currentScore = 150
isLoggedIn = true

print("Updated score: \(currentScore)")
print("Logged in: \(isLoggedIn)")

// These would cause errors:
// userName = "NewName"  // Error! Can't change constants
// userId = 67890        // Error! Can't change constants
```

**Beginner Explanation:** Use `let` for things that won't change (constants) and `var` for things that will change (variables). It's good practice to use `let` by default.

**Python Comparison:** Python doesn't have built-in constants, but Swift enforces them:
```python
# Python - nothing stops you from changing these
USER_NAME = "SwiftLearner"  # Convention says don't change, but you can
user_id = 12345
USER_NAME = "NewName"       # Python allows this

# Swift's 'let' prevents changes at compile time
```

### Exercise 3.2: Variable Scope (Solution)

```swift
let globalMessage = "I'm available everywhere"

func myFunction() {
    let localMessage = "I only exist in this function"

    print(globalMessage)  // Can access global variables
    print(localMessage)   // Can access local variables
}

myFunction()

// print(localMessage)  // Error! Can't access local variables outside function

if true {
    let blockMessage = "I only exist in this if block"
    print(blockMessage)
}

// print(blockMessage)  // Error! Can't access block variables outside block
```

**Beginner Explanation:** Variables have "scope" - where they can be used. Global variables work everywhere. Function variables only work inside that function. Block variables only work inside that block.

**Python Comparison:** Similar scoping rules, but Swift is stricter:
```python
# Python scope works similarly
global_message = "I'm available everywhere"

def my_function():
    local_message = "I only exist in this function"
    print(global_message)  # Can access global
    print(local_message)   # Can access local

# print(local_message)  # Error in both Python and Swift
```

### Exercise 3.3: Type Annotations and Inference (Solution)

```swift
// Swift can figure these out (inference)
let name = "John"           // String
let age = 25               // Int
let isActive = true        // Bool

// Sometimes you need to be explicit
let id: Int = 12345        // Make sure it's Int
let price: Double = 10     // Make sure it's Double, not Int
let items: [String] = []   // Empty array needs type

// Optionals
let optionalName: String? = "John"
let optionalAge: Int? = nil

print("Name: \(name)")
print("Optional name: \(optionalName)")
```

**Beginner Explanation:** Swift usually knows what type you want. Be explicit when the type isn't obvious or when you want a specific type.

**Python Comparison:** Python 3.5+ has type hints, but they're optional:
```python
# Python with type hints (optional)
name: str = "John"          # Like Swift's explicit typing
age: int = 25               # Like Swift's explicit typing
items: list[str] = []       # Like Swift's [String]

# Python without type hints (more common)
name = "John"               # Like Swift's type inference
age = 25                    # Like Swift's type inference
```

### Mini-Project: User Profile System (Solution)

```swift
struct User {
    let id: Int                // Can't change
    var name: String          // Can change
    var email: String         // Can change
    var age: Int              // Can change
    var isActive: Bool        // Can change
}

func createUser(id: Int, name: String, email: String, age: Int) -> User {
    return User(id: id, name: name, email: email, age: age, isActive: true)
}

func displayUser(_ user: User) {
    print("=== User Profile ===")
    print("ID: \(user.id)")
    print("Name: \(user.name)")
    print("Email: \(user.email)")
    print("Age: \(user.age)")
    print("Active: \(user.isActive)")
}

func updateUserName(_ user: inout User, newName: String) {
    user.name = newName
    print("Name updated to: \(newName)")
}

// Test it
var user1 = createUser(id: 1, name: "Alice", email: "alice@email.com", age: 25)
displayUser(user1)

updateUserName(&user1, newName: "Alice Smith")
displayUser(user1)
```

## Chapter 4: If Statements and Operators

### Exercise 4.1: Comparison Operators (Solution)

```swift
let a = 10
let b = 20

print("a = \(a), b = \(b)")
print("a == b: \(a == b)")  // Equal
print("a != b: \(a != b)")  // Not equal
print("a < b: \(a < b)")    // Less than
print("a > b: \(a > b)")    // Greater than
print("a <= b: \(a <= b)")  // Less than or equal
print("a >= b: \(a >= b)")  // Greater than or equal

// Strings
let name1 = "Alice"
let name2 = "Bob"
print("\(name1) < \(name2): \(name1 < name2)")  // Alphabetical order
```

**Beginner Explanation:** Comparison operators let you compare values. They work with numbers, strings, and other types. The result is always true or false.

**Python Comparison:** Exactly the same operators in both languages:
```python
# Python comparison operators (identical to Swift)
a = 10
b = 20
print(a == b)  # False
print(a < b)   # True
print(a != b)  # True
```

### Exercise 4.2: Logical Operators (Solution)

```swift
let isWeekend = true
let isRaining = false

// AND (&&) - both must be true
print("Weekend AND not raining: \(isWeekend && !isRaining)")

// OR (||) - at least one must be true
print("Weekend OR raining: \(isWeekend || isRaining)")

// NOT (!) - flips true/false
print("Not weekend: \(!isWeekend)")

// Real example
let age = 25
let hasLicense = true

let canDrive = age >= 16 && hasLicense
print("Can drive: \(canDrive)")
```

**Beginner Explanation:** Logical operators combine true/false values. `&&` means AND, `||` means OR, `!` means NOT.

**Python Comparison:** Similar operators, different syntax:
```python
# Python logical operators
is_weekend = True
is_raining = False

# Python uses words instead of symbols
print(is_weekend and not is_raining)  # Swift: &&, !
print(is_weekend or is_raining)       # Swift: ||
print(not is_weekend)                 # Swift: !
```

### Exercise 4.3: If-Else Statements (Solution)

```swift
let temperature = 25

if temperature > 30 {
    print("It's hot!")
} else if temperature > 20 {
    print("It's warm")
} else if temperature > 10 {
    print("It's cool")
} else {
    print("It's cold!")
}

// Multiple conditions
let age = 20
let hasTicket = true

if age >= 18 && hasTicket {
    print("Can enter the movie")
} else if age < 18 {
    print("Too young")
} else {
    print("Need a ticket")
}
```

**Beginner Explanation:** If statements let your program make decisions. Use `if-else if-else` for multiple choices. Combine conditions with `&&` and `||`.

**Python Comparison:** Very similar structure, slightly different syntax:
```python
# Python if statements
temperature = 25

if temperature > 30:
    print("It's hot!")
elif temperature > 20:    # Python uses 'elif' instead of 'else if'
    print("It's warm")
else:
    print("It's cool or cold")

# Multiple conditions work the same way
age = 20
has_ticket = True
if age >= 18 and has_ticket:  # Python uses 'and' instead of '&&'
    print("Can enter the movie")
```

### Exercise 4.4: Switch Statements (Solution)

```swift
let dayNumber = 3

switch dayNumber {
case 1:
    print("Monday")
case 2:
    print("Tuesday")
case 3:
    print("Wednesday")
case 4:
    print("Thursday")
case 5:
    print("Friday")
case 6, 7:
    print("Weekend!")
default:
    print("Invalid day")
}

// With ranges
let score = 85

switch score {
case 90...100:
    print("A grade")
case 80...89:
    print("B grade")
case 70...79:
    print("C grade")
default:
    print("Below C")
}
```

**Beginner Explanation:** Switch statements are great for multiple specific values. Use ranges like `90...100` for ranges of numbers. The `default` case handles everything else.

**Python Comparison:** Python 3.10+ has match statements (similar to switch):
```python
# Python 3.10+ match statement (like Swift switch)
day_number = 3

match day_number:
    case 1:
        print("Monday")
    case 2:
        print("Tuesday")
    case 3:
        print("Wednesday")
    case 6 | 7:  # Python uses | for "or"
        print("Weekend!")
    case _:      # Python uses _ instead of default
        print("Invalid day")

# Older Python uses if-elif chains instead
```

### Exercise 4.5: Ternary Conditional Operator (Solution)

```swift
let age = 20
let status = age >= 18 ? "Adult" : "Minor"
print("Status: \(status)")

// Same as:
let status2: String
if age >= 18 {
    status2 = "Adult"
} else {
    status2 = "Minor"
}

// More examples
let score = 85
let grade = score >= 60 ? "Pass" : "Fail"
print("Grade: \(grade)")

let weather = "sunny"
let advice = weather == "rainy" ? "Take umbrella" : "Enjoy the weather"
print(advice)
```

**Beginner Explanation:** The ternary operator `condition ? value1 : value2` is a shortcut for simple if-else statements. Use it for simple choices between two values.

**Python Comparison:** Python has a similar feature but different syntax:
```python
# Python conditional expression
age = 20
status = "Adult" if age >= 18 else "Minor"  # Python syntax
# Swift: let status = age >= 18 ? "Adult" : "Minor"

# Both do the same thing, just different word order
score = 85
grade = "Pass" if score >= 60 else "Fail"
```

### Mini-Project: Grade Calculator (Solution)

```swift
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

## Chapter 5: Functions

### Exercise 5.1: Basic Functions (Solution)

```swift
// Simple function with no parameters
func sayHello() {
    print("Hello, World!")
}

sayHello()

// Function with parameters
func greet(name: String) {
    print("Hello, \(name)!")
}

greet(name: "Alice")

// Function that returns a value
func add(a: Int, b: Int) -> Int {
    return a + b
}

let result = add(a: 5, b: 3)
print("5 + 3 = \(result)")

// Function with multiple return values
func getNameAndAge() -> (String, Int) {
    return ("John", 25)
}

let (name, age) = getNameAndAge()
print("Name: \(name), Age: \(age)")
```

**Beginner Explanation:** Functions are reusable blocks of code. They can take inputs (parameters) and return outputs. Use `func` to create them.

**Python Comparison:** Very similar to Python functions:
```python
# Python functions
def say_hello():                    # Swift: func sayHello()
    print("Hello, World!")

def greet(name):                    # Swift: func greet(name: String)
    print(f"Hello, {name}!")

def add(a, b):                      # Swift: func add(a: Int, b: Int) -> Int
    return a + b

# Python doesn't require type annotations (but you can add them)
result = add(5, 3)
```

### Exercise 5.2: Parameter Labels and Default Values (Solution)

```swift
// External parameter names for clarity
func createUser(withName name: String, andAge age: Int) {
    print("Created user: \(name), age \(age)")
}

createUser(withName: "Bob", andAge: 30)

// Omit parameter labels with underscore
func multiply(_ a: Int, _ b: Int) -> Int {
    return a * b
}

let product = multiply(4, 5)  // No labels needed

// Default values
func greet(name: String, greeting: String = "Hello") {
    print("\(greeting), \(name)!")
}

greet(name: "Alice")                    // Uses default "Hello"
greet(name: "Bob", greeting: "Hi")      // Uses custom greeting

// Multiple values with ...
func sum(numbers: Int...) -> Int {
    var total = 0
    for number in numbers {
        total += number
    }
    return total
}

print("Sum: \(sum(numbers: 1, 2, 3, 4, 5))")
```

**Explanation:** Parameter labels make function calls clearer. Default values let you call functions with fewer arguments. The `...` lets you pass multiple values.

### Exercise 5.3: Scope and Nested Functions (Solution)

```swift
func outerFunction() {
    let message = "I'm in the outer function"

    func innerFunction() {
        print(message)  // Can access outer function's variables
        print("I'm nested inside!")
    }

    print("Calling inner function:")
    innerFunction()
}

outerFunction()

// Nested function with calculations
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

let result = processNumber(10)  // (10 * 2) + 5 = 25
print("Result: \(result)")
```

**Explanation:** You can put functions inside other functions. Inner functions can use variables from the outer function. This helps organize related code.

### Exercise 5.4: Function Types (Solution)

```swift
// Functions can be stored in variables
func add(a: Int, b: Int) -> Int {
    return a + b
}

func multiply(a: Int, b: Int) -> Int {
    return a * b
}

var operation = add
print("Using add: \(operation(5, 3))")

operation = multiply
print("Using multiply: \(operation(5, 3))")

// Functions as parameters
func calculate(_ a: Int, _ b: Int, using operation: (Int, Int) -> Int) -> Int {
    return operation(a, b)
}

let sum = calculate(10, 5, using: add)
let product = calculate(10, 5, using: multiply)

print("Sum: \(sum)")
print("Product: \(product)")

// Functions that return functions
func makeAdder(amount: Int) -> (Int) -> Int {
    func addAmount(to number: Int) -> Int {
        return number + amount
    }
    return addAmount
}

let addFive = makeAdder(amount: 5)
print("7 + 5 = \(addFive(7))")
```

**Explanation:** Functions are values in Swift! You can store them in variables, pass them to other functions, and return them from functions.

### Mini-Project: Student Grade Manager (Solution)

```swift
struct Student {
    let name: String
    var grades: [Int]
}

func addGrade(to student: inout Student, grade: Int) {
    if grade >= 0 && grade <= 100 {
        student.grades.append(grade)
        print("Added grade \(grade) for \(student.name)")
    } else {
        print("Invalid grade: \(grade)")
    }
}

func calculateAverage(grades: [Int]) -> Double {
    if grades.isEmpty {
        return 0.0
    }

    let sum = grades.reduce(0, +)  // Add all grades
    return Double(sum) / Double(grades.count)
}

func getLetterGrade(average: Double) -> String {
    switch average {
    case 90...100:
        return "A"
    case 80..<90:
        return "B"
    case 70..<80:
        return "C"
    case 60..<70:
        return "D"
    default:
        return "F"
    }
}

func printReport(for student: Student) {
    print("\n=== \(student.name)'s Report ===")
    print("Grades: \(student.grades)")

    let average = calculateAverage(grades: student.grades)
    let letter = getLetterGrade(average: average)

    print("Average: \(String(format: "%.1f", average))")
    print("Letter Grade: \(letter)")
}

// Test the system
var alice = Student(name: "Alice", grades: [])
var bob = Student(name: "Bob", grades: [])

addGrade(to: &alice, grade: 95)
addGrade(to: &alice, grade: 87)
addGrade(to: &alice, grade: 92)

addGrade(to: &bob, grade: 78)
addGrade(to: &bob, grade: 85)
addGrade(to: &bob, grade: 82)

printReport(for: alice)
printReport(for: bob)
```

**Explanation:** This project shows how functions work together to manage data. We use `inout` to modify the original student, and break complex tasks into simple functions that each do one thing well.

---

## Key Takeaways for Beginners

### Swift vs Python Quick Reference:

| Concept | Swift | Python |
|---------|-------|--------|
| **Variables** | `var name = "John"` | `name = "John"` |
| **Constants** | `let age = 25` | `AGE = 25` (convention only) |
| **Functions** | `func add(a: Int, b: Int) -> Int` | `def add(a, b):` |
| **If statements** | `if condition && other` | `if condition and other:` |
| **String interpolation** | `"Hello \(name)"` | `f"Hello {name}"` |
| **Type safety** | Enforced at compile time | Optional type hints |

### Essential Beginner Tips:

1. **Start Simple**: Master these basics before moving to optionals and classes
2. **Use `let` by Default**: Only use `var` when you need to change the value
3. **Read Compiler Messages**: Swift gives helpful error messages when something's wrong
4. **Practice in Playgrounds**: Use Xcode Playgrounds to experiment with code
5. **Think in Types**: Swift cares about types - embrace this for safer code

### Common Beginner Mistakes:

1. **Using `var` everywhere** - Prefer `let` for values that don't change
2. **Ignoring type safety** - Let Swift help you catch errors early
3. **Complex functions** - Keep functions small and focused on one task
4. **Not using string interpolation** - Use `\()` instead of concatenating with `+`
5. **Skipping practice** - Write code every day, even if it's just small examples

### Next Steps:

After mastering these fundamentals, you're ready for:
- **Chapter 6**: Optionals (Swift's safety feature for missing values)
- **Chapter 7**: Tuples (grouping related values)
- **Chapter 8**: Structs (creating your own data types)
- **Chapter 9**: Classes (reference types and inheritance)

Remember: Every expert was once a beginner. Focus on understanding these fundamentals thoroughly - they're the foundation for everything else in Swift!
