# Swift Beginner's Guide: Classes and Protocols (Final Chapters)

This guide covers the final concepts for beginners: class inheritance, protocols, and access control. Each concept is explained with simple examples and Python comparisons.

## Chapter 11: Classes and Inheritance

### Exercise 11.1: Simple Class Inheritance (Beginner Solution)

```swift
// 1. Base class (like Python's base class)
class Animal {
    let name: String
    var age: Int
    var energy: Int = 100

    // Initializer (like Python's __init__)
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }

    // Methods that can be overridden
    func makeSound() {
        print("\(name) makes a sound")
    }

    func eat() {
        energy += 10
        print("\(name) is eating. Energy is now \(energy)")
    }

    func sleep() {
        energy += 20
        print("\(name) is sleeping. Energy is now \(energy)")
    }

    func describe() -> String {
        return "\(name) is a \(age)-year-old animal with \(energy) energy"
    }
}

// 2. Subclass (inheritance like Python)
class Dog: Animal {
    let breed: String
    var isGoodBoy: Bool = true

    // Custom initializer that calls parent's init
    init(name: String, age: Int, breed: String) {
        self.breed = breed
        super.init(name: name, age: age)  // Call parent's initializer
    }

    // Override parent method (like Python method override)
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

// Using inheritance
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

**Beginner Explanation:** Inheritance in Swift works like Python inheritance. Child classes inherit all properties and methods from their parent, and can override them or add new ones. Use `super` to call the parent's methods.

### Exercise 11.2: Protocols (Like Python's ABC)

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

// Using protocols
let eagle = Bird(name: "Sky", age: 5, species: "Eagle", maxAltitude: 10000)
let plane = Airplane(model: "Boeing 737", maxAltitude: 35000)

print("=== Flying Examples ===")
eagle.fly(to: "the mountains")
plane.fly(to: "New York")

// Protocol as type (polymorphism)
let flyingThings: [Flyable] = [eagle, plane]
for thing in flyingThings {
    print("Max altitude: \(thing.maxAltitude) feet")
}
```

**Beginner Explanation:** Protocols in Swift are like Python's Abstract Base Classes (ABC). They define a contract that classes must follow. Unlike inheritance, a class can conform to multiple protocols.

### Exercise 11.3: Access Control (Beginner Solution)

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

// Extension to add more functionality
extension BankAccount {
    // This can access fileprivate properties
    func getLastTransaction() -> String {
        return lastTransaction
    }

    func transfer(_ amount: Double, to otherAccount: BankAccount, pin enteredPin: String) -> Bool {
        guard withdraw(amount, pin: enteredPin) else {
            return false
        }

        // For this example, we'll assume the other account accepts the deposit
        // In real life, you'd need the other account's PIN too
        otherAccount.balance += amount
        otherAccount.lastTransaction = "Received $\(amount) transfer"

        print("Transferred $\(amount) to \(otherAccount.accountHolder)")
        return true
    }
}

// Using access control
let account1 = BankAccount(accountNumber: "12345", accountHolder: "Alice", pin: "1234", initialBalance: 500)
let account2 = BankAccount(accountNumber: "67890", accountHolder: "Bob", pin: "5678", initialBalance: 200)

print("=== Bank Account Operations ===")
print(account1.accountSummary)

// These work because they use the correct PIN
account1.deposit(100, pin: "1234")
if let balance = account1.checkBalance(enteredPin: "1234") {
    print("Current balance: $\(balance)")
}

// This fails because of wrong PIN
account1.withdraw(50, pin: "wrong")

// This works with correct PIN
account1.withdraw(50, pin: "1234")

// Transfer between accounts
account1.transfer(75, to: account2, pin: "1234")

print("Last transaction: \(account1.getLastTransaction())")

// These would cause compiler errors because balance and pin are private:
// print(account1.balance)  // ❌ Cannot access private property
// account1.pin = "new"     // ❌ Cannot access private property
```

**Beginner Explanation:** Access control in Swift is like Python's naming conventions:
- **public** = No restrictions (like Python: no underscore)
- **internal** = Same module only (default in Swift)
- **fileprivate** = Same file only
- **private** = Same class/struct only (like Python: `__private`)

### Mini-Project: Simple Pet Care System (Beginner Solution)

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

// Test the pet care system
let owner = PetOwner(name: "Sarah")

// Create different types of pets
let dog = Dog(name: "Buddy", age: 3, breed: "Golden Retriever")
let cat = Cat(name: "Whiskers", age: 2, isIndoor: true)

// Adopt pets
owner.adoptPet(dog)
owner.adoptPet(cat)

// Initial status
owner.checkAllPets()

// Daily care routine
owner.feedAllPets()
owner.playWithAllPets()

// Specific activities
print("\n=== Specific Pet Activities ===")
dog.walk()
dog.makeSound()

cat.pet()
cat.makeSound()

// Rest time
print("\n=== Rest Time ===")
dog.sleep()
cat.sleep()

// Give attention using protocol method
owner.giveDailyAttention()

// Final status
owner.checkAllPets()

print("\n\(owner.name) has \(owner.getPetCount()) pets")
```

**Beginner Explanation:** This pet care system demonstrates:

1. **Protocols** (`Caregivable`) define what all pets must be able to do
2. **Inheritance** (Dog and Cat inherit from Pet) for shared behavior
3. **Method overriding** for pet-specific behaviors
4. **Access control** with private properties to protect internal state
5. **Polymorphism** - treating different pet types the same way

## Key Takeaways for Beginners

### Class Inheritance:
- **Base class** defines common properties and methods
- **Subclasses** inherit everything and can add or override
- Use `super` to call parent methods
- Swift classes have single inheritance (unlike Python's multiple inheritance)

### Protocols:
- Define what a type must be able to do (like Python's ABC)
- A class can conform to multiple protocols
- Protocols can have default implementations in extensions
- Enable polymorphism without inheritance

### Access Control:
- **public** - Anyone can access
- **internal** - Same module (default)
- **fileprivate** - Same file
- **private** - Same type only

### When to Use What:
- **Inheritance** when you have an "is-a" relationship (Dog is-a Pet)
- **Protocols** when you have a "can-do" relationship (Pet can-do Caregivable things)
- **Access control** to hide implementation details and protect data

### Python Comparisons:
- **Swift inheritance** ≈ **Python class inheritance**
- **Swift protocols** ≈ **Python ABC (Abstract Base Classes)**
- **Swift private** ≈ **Python `__private` convention**
- **Swift override** ≈ **Python method override**

Remember: Start simple with basic classes, then add inheritance and protocols as you need them. Focus on making your code clear and safe!
