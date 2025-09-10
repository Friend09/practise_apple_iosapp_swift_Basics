import Foundation

//## Chapter 6: Optionals - Handling Missing Values

//### Exercise 6.1: Basic Optionals (Beginner)
var userName: String? = nil
var userAge: Int? = nil
var userEmail: String? = "alice@example.com"

// 2. Checking if optionals have values - the safe way
// Using if-let (like Python's "if value is not None:")
if let name = userName {
    print("Hello, \(name)!")  // Only runs if userName has a value
} else {
    print("No name provided")
}

if let name = userName, let email = userEmail {
    print("User: \(name), Email \(email)")
} else {
    print("Missing some information")
}

// 4. Using guard for early exits (like Python's early return)
func greetUser(name: String?, age: Int?) {
    guard let name  = name else {
        print("Cant greet without a name")
        return
    }
    
    guard let age = age else {
        print("Hello \(name)! age unknown")
        return
    }
    
    print("Hello \(name), you are \(age) years old")
}

print(greetUser(name: "raghu", age: nil))

// 5. Default values with ?? (nil coalescing)
let displayName = userName ?? "Guest"
let displayAge = userAge ?? 0


//### Exercise 6.2: Safe Error Handling (Beginner)
enum UserError: Error {
    case nameEmpty
    case ageTooYoung
    case emailInvalid
    
    var message: String {
        switch self {
        case .nameEmpty:
            return "Name cannot be empty"
        case .ageTooYoung:
            return "Must be atleast 13 years old"
        case .emailInvalid:
            return "Email must contain @"
        }
    }
}

// 2. Functions that can fail (like Python functions that raise exceptions)
func createUser(name: String, age: Int, email: String) throws -> String {
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
        print("UserError: \(error.message)")
    } catch {
        print("Other error: \(error.localizedDescription)")
    }

    // Try with invalid data
    do {
        let result = try createUser(name: "", age: 10, email: "invalid")
        print("Success: \(result)")
    } catch let error as UserError {
        print("UserError: \(error.message)")
    } catch {
        print("Other error: \(error.localizedDescription)")
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

print(validateEmail("heshu"))

//### Exercise 6.3: Working with Optional Collections (Beginner)
var numbers: [Int]? = [1,2,3,4,5]
var scores: [String: Int]? = ["Alice": 95, "Bob":87]
var emptyList: [String]? = nil

if let numbers = numbers {
    print("We have \(numbers.count) numbers")
    print("First number: \(numbers.first ?? 0)")
} else {
    print("No numbers available")
}

let safeNumbers = numbers ?? []
let safeScores = scores ?? [:]

print("Safe numbers count: \(safeNumbers.count)")
print("Safe scores count: \(safeScores.count)")

let mixedNumbers: [Int?] = [1, nil, 3, nil, 5]
let validNumbers = mixedNumbers.compactMap{ $0 }

// 5. nested optionals
struct User {
    let name: String
    var address: Address?
}

struct Address {
    let street: String
    let city: String
}

let user = User(
    name: "Alice",
    address: Address(
        street: "Main St", city: "Boston"
    )
)

let city = user.address?.city ?? "Unknown"
print("User city: \(city)")

let userWithoutAddress = User(name: "Bob", address: nil)
let unknownCity = userWithoutAddress.address?.city ?? "Unknown"
print("User city: \(unknownCity)")


//### Mini-Project: Simple Grade Book (Beginner)

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
    
    func getClassStats(for subject: String) -> (average: Double, highest: Int, lowest: Int)? {
        let subjectGrades = grades.filter {$0.subject == subject}
        guade !subjectGrades.isEmpty else {return nil}
        
        let scores = subjectGrades.map($0.score)
    }
}
