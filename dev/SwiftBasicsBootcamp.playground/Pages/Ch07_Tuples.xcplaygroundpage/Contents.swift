//Chapter 7: Tuples - Grouping Related Values

import Foundation



//### Exercise 7.1: Basic Tuples (Beginner)
let person = ("Alice", 25)
let point = (X:10, y:20)
let rgb = (red: 255, green: 0, blue: 0 )

let name = person.0
let age = person.1
print("Person: \(name), Age: \(age)")

let x = point.X
let y = point.y
print("Point \(x), \(y)")

let (userName, userAge) = person
print("User: \(userName), Age: \(userAge)")

let (r,_,b) = rgb
print("Red: \(r), Blue: \(b)")

let mixedData = ("Swift", 5.7, true)
let (language, version, isAwesome) = mixedData
print("\(language) \(version) is awesome: \(isAwesome)")


//### Exercise 7.2: Functions Returning Tuples (Beginner)
func getPersonInfo() -> (name: String, age: Int) {
    return ("Bob", 30)
}

let personInfo = getPersonInfo()

func divideWithRemainder(_ a: Int, by b: Int) -> (quotient: Int, remainder: Int)? {
    guard b != 0 else { return nil }
    return (a/b, a%b)
}

if let result = divideWithRemainder(17, by: 5) {
    print("\(result.quotient), \(result.remainder)")
} else {
    print("cannot divide by zero")
}

func findMinMax(in numbers: [Int]) -> (min: Int, max: Int) {
    let min = numbers.min()!
    let max = numbers.max()!
    return (min, max)
}

print(findMinMax(in: [2,34,1,45]))

//### Exercise 7.3: Comparing Tuples (Beginner)
let point1 = (x: 1, y:2)
let point2 = (x:1, y:3)
let point3 = (x:2, y:1)

print("point1 < point2 \(point1 < point2)")
print("point1 < point3 \(point1 < point3)")
print("point2 < point3 \(point2 < point3)")

let points = [(1, 3), (2, 1), (1, 2), (3, 1)]
let sortedPoints = points.sorted {$0 < $1}
print("Sorted points: \(sortedPoints)")

let students = [
    (name: "Alice", grade: 95),
    (name: "Bob", grade: 87),
    (name: "Charlie", grade: 95),
    (name: "Diana", grade: 92)
]

let sortedStudents = students.sorted {
    student1, student2 in
    if student1.grade != student2.grade {
        return student1.grade > student2.grade
    } else {
        return student1.name < student2.name
    }
}

print(sortedStudents)

// create Ch08
// File > New > Playground Page
