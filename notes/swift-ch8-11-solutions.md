# Swift Beginner's Guide: Structs and Classes (Chapters 8-11)

This guide provides beginner-friendly solutions for Swift Structs and Classes. Each concept is explained with simple examples and Python comparisons.

## Chapter 8: Structs - Value Types (Like Python's dataclasses)

Structs are like Python's dataclasses - they group related data together. In Swift, structs are "value types" which means they get copied when you assign them.

### Exercise 8.1: Basic Structs (Beginner Solution)

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

**Beginner Explanation:** Structs are perfect for simple data that doesn't need to be shared. When you copy a struct, you get a completely separate copy - like photocopying a document.

### Exercise 8.2: Structs vs Classes (Beginner Solution)

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

**Beginner Explanation:**
- **Structs** = Like separate photocopies (value types)
- **Classes** = Like shared documents (reference types)

In Python, this is like the difference between copying a list (`new_list = old_list.copy()`) vs sharing a list (`new_list = old_list`).

### Exercise 8.3: Practical Struct Example (Beginner Solution)

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

// Using the bank account
var account = BankAccount(accountNumber: "12345", accountHolder: "Alice", initialBalance: 100)

account.checkBalance()
account.deposit(50)
account.withdraw(30)
account.withdraw(200)  // Should fail - insufficient funds
account.checkBalance()
```

**Beginner Explanation:** This shows how structs can have private data (like `balance`) and methods that safely modify that data. The `mutating` keyword tells Swift this method will change the struct.

## Chapter 9: Classes - Reference Types

Classes are like Python classes - they can be inherited and are shared when assigned. Use classes when you need sharing or inheritance.

### Exercise 9.1: Basic Classes (Beginner Solution)

```swift
// 1. Basic class (like Python class)
class Vehicle {
    let make: String
    let model: String
    var year: Int
    var speed: Double = 0

    // Initializer (like Python's __init__)
    init(make: String, model: String, year: Int) {
        self.make = make
        self.model = model
        self.year = year
    }

    // Methods
    func accelerate(by amount: Double) {
        speed += amount
        print("\(make) \(model) is now going \(speed) mph")
    }

    func brake(by amount: Double) {
        speed = max(0, speed - amount)
        print("\(make) \(model) slowed down to \(speed) mph")
    }

    func description() -> String {
        return "\(year) \(make) \(model)"
    }
}

// Using the class
let car = Vehicle(make: "Toyota", model: "Camry", year: 2023)
print(car.description())
car.accelerate(by: 30)
car.brake(by: 10)

// Classes are shared (reference semantics)
let sameCar = car  // Same object, not a copy
sameCar.accelerate(by: 20)
print("Original car speed: \(car.speed)")  // Also changed to 40!
```

**Beginner Explanation:** Classes are like Python classes. When you assign a class to another variable, both variables point to the same object in memory.

### Exercise 9.2: Inheritance (Beginner Solution)

```swift
// 1. Base class
class Animal {
    let name: String
    var energy: Int = 100

    init(name: String) {
        self.name = name
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
}

// 2. Subclass (inheritance)
class Dog: Animal {
    let breed: String

    init(name: String, breed: String) {
        self.breed = breed
        super.init(name: name)  // Call parent's init
    }

    // Override parent method
    override func makeSound() {
        print("\(name) the \(breed) barks: Woof!")
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
}

class Cat: Animal {
    let isIndoor: Bool

    init(name: String, isIndoor: Bool) {
        self.isIndoor = isIndoor
        super.init(name: name)
    }

    override func makeSound() {
        print("\(name) the cat meows: Meow!")
    }

    func purr() {
        energy += 5
        print("\(name) purrs contentedly. Energy: \(energy)")
    }
}

// Using inheritance
let dog = Dog(name: "Buddy", breed: "Golden Retriever")
let cat = Cat(name: "Whiskers", isIndoor: true)

dog.makeSound()  // Calls Dog's version
cat.makeSound()  // Calls Cat's version

dog.eat()        // Inherited from Animal
dog.fetch()      // Dog-specific method

cat.purr()       // Cat-specific method
cat.sleep()      // Inherited from Animal
```

**Beginner Explanation:** Inheritance lets you create specialized versions of a class. Dogs and Cats are both Animals, but they have their own specific behaviors. Use `override` to change inherited methods.

### Exercise 9.3: Properties and Methods (Beginner Solution)

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

// Using properties
let temp = Temperature(celsius: 25)
print("Initial: \(temp.description)")

// Computed properties automatically convert
temp.fahrenheit = 100  // This changes celsius
print("After setting Fahrenheit: \(temp.description)")

temp.kelvin = 300      // This also changes celsius
print("After setting Kelvin: \(temp.description)")

// Using class methods
let roomTemp = Temperature.roomTemperature()
let freezing = Temperature.freezingPoint()
print("Room temperature: \(roomTemp.description)")
print("Freezing point: \(freezing.description)")
```

**Beginner Explanation:**
- **Stored properties** = Regular variables that store values
- **Computed properties** = Like Python's `@property` - calculated on the fly
- **Property observers** = Run code when a property changes
- **Class/static methods** = Methods that belong to the class, not instances

### Mini-Project: Simple Library System (Beginner Solution)

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

// Test the library system
let library = Library()

// Add some books
let book1 = Book(isbn: "978-1234567890", title: "Swift Programming", author: "Apple Inc.", pages: 500)
let book2 = Book(isbn: "978-0987654321", title: "iOS Development", author: "Dev Team", pages: 300)
let book3 = Book(isbn: "978-1111111111", title: "Swift Advanced", author: "Expert Dev", pages: 400)

library.addBook(book1)
library.addBook(book2)
library.addBook(book3)

// Register members
let member1 = LibraryMember(memberID: "M001", name: "Alice Johnson", email: "alice@example.com")
let member2 = LibraryMember(memberID: "M002", name: "Bob Smith", email: "bob@example.com")

library.registerMember(member1)
library.registerMember(member2)

// Test checkout and return
print("\n=== Library Operations ===")
library.checkoutBook(isbn: "978-1234567890", memberID: "M001")
library.checkoutBook(isbn: "978-0987654321", memberID: "M001")

// Show member status
if let memberInfo = library.getMemberInfo(memberID: "M001") {
    print("Member status: \(memberInfo)")
}

// Try to checkout to different member
library.checkoutBook(isbn: "978-1234567890", memberID: "M002")  // Should fail - already checked out

// Return a book
library.returnBook(isbn: "978-1234567890", memberID: "M001")

// Now Bob can check it out
library.checkoutBook(isbn: "978-1234567890", memberID: "M002")

// Search for books
print("\n=== Search Results ===")
let swiftBooks = library.searchBooks(title: "Swift")
for book in swiftBooks {
    print(book.description)
}

// Show available books
print("\n=== Available Books ===")
let availableBooks = library.getAvailableBooks()
for book in availableBooks {
    print(book.description)
}
```

**Beginner Explanation:** This library system shows:
- **Structs for simple data** (Book) - no need for sharing or inheritance
- **Classes for complex objects** (LibraryMember, Library) - need shared state and behavior
- **Encapsulation** with private properties to protect data
- **Methods** that safely modify object state
- **Error handling** with guard statements and validation

## Key Takeaways for Beginners

### When to Use Structs vs Classes:

**Use Structs When:**
- Simple data containers (like coordinates, colors, configurations)
- You want independent copies
- No inheritance needed
- Value semantics (copying) makes sense

**Use Classes When:**
- Complex objects with behavior
- Need inheritance
- Want shared state between variables
- Reference semantics (sharing) makes sense

### Memory and Performance:
- **Structs**: Stored on the stack (faster), automatically cleaned up
- **Classes**: Stored on the heap (flexible), reference counted for cleanup

### Python Comparisons:
- **Swift Struct** ≈ **Python dataclass** with value semantics
- **Swift Class** ≈ **Python class** with reference semantics
- **Swift `mutating`** ≈ Modifying **Python dataclass** fields
- **Swift inheritance** ≈ **Python class inheritance**

Remember: Start with structs for simple data, use classes when you need inheritance or shared state!
