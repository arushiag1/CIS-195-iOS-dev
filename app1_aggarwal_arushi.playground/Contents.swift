import UIKit

/*
 Name: Arushi Aggarwal
 Pennkey: arushiag
 App: 1
 
 Looking forward to most in CIS 195: Learning how to actually make what I envision in Xcode. I've tried and given up several times because I get stuck and don't know how to teach myself. I can't wait to learn this tool but also to learn how to learn other tools.
 */


// EXERCISE 1

let foo: Int = 42
let fooStr: String? = String(foo)

// forced unwrapping
if fooStr != nil {
    print("My number is \(fooStr!)")
}

// optional binding
if let constant = fooStr {
    print("My number is \(constant)")
}

// nil coalescing
let defaultString = "x"
print("My number is \(fooStr ?? defaultString)")


// EXERCISE 2

let characters: [Character] = ["c", "i", "s", "1", "9", "5", " ", "i", "s", " ", "f", "u", "n"]
var charString: String = String(characters)
charString.append("!")
print(charString)
var peopleDict: [String: Int] = ["PersonA": 20, "PersonB": 3, "PersonC": 25]
dump(peopleDict)
let myInfo = ("Arushi", 2023)
print(myInfo)


// EXERCISE 3

for (person, age) in peopleDict {
    if age < 21 {
        print("My friend \(person) is under 21")
    }
    else {
        print("My friend \(person) is not under 21")
    }
}

for index in 1...10 {
    print(index)
}

for character in characters {
    print(character)
}


// EXERCISE 4

func sumAndDiff(_ intA: Int, _ intB: Int) -> (Int, Int) {
    return (intA + intB, intA - intB)
}
print(sumAndDiff(5, 4))

typealias Course = String
typealias PennId = Int

func enroll(in course: Course, using pennid: PennId) {
    print("Enrolled \(pennid) in \(course)")
}

let newCourse: String = "CIS195"
let myPennId: Int = 1234
enroll(in: newCourse, using: myPennId)


// EXERCISES 5 AND 6

struct Rectangle {
    var length: Int
    var width: Int
    var area: Int {
        get {
            return length * width
        }
    }
    var description: String? {
        didSet {
            if description != nil {
                print(description!)
            }
        }
    }

}

var myRect = Rectangle(length: 10, width: 5)
myRect.description = "This is my rectangle."
print(myRect.area)

typealias School = String
typealias Major = String

class Student {
    var name: String
    var school: School?
    var major: Major = "undeclared"
    
    init(name: String, school: School, major: Major) {
        self.name = name
        self.school = school
        self.major = major
    }
    
    init(name: String) {
        self.name = name
    }
}

let me = Student(name: "Arushi")
let babyQuaker = Student(name: "Freshie")
let majors: [Major] = ["CIS", "Math", "Systems Engineering"]
babyQuaker.major = majors.randomElement()!

