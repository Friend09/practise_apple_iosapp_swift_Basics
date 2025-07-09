import Foundation


//## Chapter 5: Functions
//
//### Exercise 5.1: Basic Functions (Beginner)
//**Goal**: Learn how to create and use functions
// 1. Simple function with no parameters
func sayHello() {
    print("Hello, World!")
}

sayHello()

// 2. Function with parameters
func greet(name: String) {
    print("Hello, \(name)")
}

greet(name: "Vamsi")

// 3. Function that returns a value
//func add(a: Int, b: Int) -> Int {
//    return a + b
//}
//
//add(a: 2, b: 3)

// 4. Function with multiple return values
func getNameAndAge() -> (String, Int) {
    return ("John", 25)
}

getNameAndAge()


//### Exercise 5.2: Parameter Labels and Default Values (Beginner)
//**Goal**: Learn about parameter labels and default values
// 1. External parameter names for clarity
func createUser(withName name: String, andAge age: Int) {
    print("Created user: \(name), age \(age)")
}

createUser(withName: "raghu", andAge: 35)

// 2. Omit parameter labels with underscore
//func multiply(_ a: Int, _ b: Int) -> Int {
//    return a*b
//}
//
//multiply(4, 3)

// 3. Default values
func greet(name: String, greeting: String) {
    print("\(greeting) \(name)")
}

greet(name: "Raghu", greeting: "Hello")

// 4. Multiple values with ...
func sum(numbers: Int...) -> Int {
    var total = 0
    for number in numbers {
        total += number
    }
    return total
}

sum(numbers: 1,2,3)

//### Exercise 5.3: Scope and Nested Functions (Beginner)
//**Goal**: Learn about function scope and nested functions
// 1. Function scope
func outerFunction() {
    let message = "I'm in the outer function"
    
    func innerFunction() {
        print(message)
        print("I'm nested inside!")
    }
    
    innerFunction()
}

outerFunction()


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

processNumber(11)


//### Exercise 5.4: Function Types (Beginner)
//**Goal**: Learn how functions can be stored and passed around
// 1. Functions can be stored in variables
func add(a: Int, b: Int) -> Int {
    return a + b
}

func multiply(a: Int, b: Int) -> Int {
    return a * b
}

var operation = multiply
operation(2,3)

// 2. Functions as parameters
func calculate(_ a: Int, _ b: Int, using operation: (Int, Int) -> Int) -> Int {
    return operation(a,b)
}

calculate(2,3, using: operation)

// 3. Functions that return functions
func makeAdder(amount: Int) -> (Int) -> Int {
    func addAmount(to number: Int) -> Int {
        return number + amount
    }
    return addAmount
}

let addFive = makeAdder(amount: 5)
let result = addFive(10)
result

//### Mini-Project: Student Grade Manager (Beginner)
//**Goal**: Create a student grade management system using functions
// Create a student grade manager that:

// 1. Stores student information and grades
struct Student {
    let name: String
    var grades: [Int]
}

// 2. Has functions to add grades
func addGrade(to student: inout Student, grade: Int) {
    if grade >= 0 && grade <= 100 {
        student.grades.append(grade)
        print("Added grade \(grade) for \(student.name)")
    } else {
        print("Invalid grade: \(grade)")
    }
}

// 3. Calculates averages and letter grades
func calculateAverages(grades: [Int]) -> Double {
    if grades.isEmpty {
        return 0.0
    }
    
    let sum = grades.reduce(0, +)
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

// 4. Prints student reports
func printReport(for student: Student) {
    print("\n=== \(student.name)'s Report ===")
    print("Grades: \(student.grades)")
    
    let average = calculateAverages(grades: student.grades)
    let letter = getLetterGrade(average: average)
    
    print("Average: \(String(format: "%.1f", average))")
    print("Letter Grade: \(letter)")
}


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
