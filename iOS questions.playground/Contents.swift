import UIKit

var greeting = "Hello, playground"

class ABCViewController: UIViewController {

override func viewDidLoad() {
    super.viewDidLoad()
    
}
    
    func call() {
        print("1")
        DispatchQueue.global(qos: .userInitiated).sync {
            print("2")
            DispatchQueue.global(qos: .userInitiated).sync {
                print("3")
            }
            print("4")
        }
        print("5")
    }

}

let a = ABCViewController()
a.call()


class AnotherObject {
   var name = "NAME"
}

class B {
   weak var anotherObject: AnotherObject?

   func someFunc() {
       anotherObject = AnotherObject()
       anotherObject?.name = "Naveen"
       print(anotherObject?.name)
   }
}

var b = B()
b.someFunc()




class BCD {
   func getabc() -> String {
       return "child"
   }
}

class XYZ {
   var bcd: BCD? = BCD()
}

var some = XYZ()
var bcd = some.bcd
some.bcd = nil

print(bcd?.getabc())
print(some.bcd?.getabc())



func test() {
   defer { print("a")}
   defer { print("b")}
   defer { print("c")}
print("d")
}

test()


     var count = 0
    var book: String = {
       count += 1
       return "Advance Swift"
    }()
    
    func add(_ completion: @autoclosure () -> String) -> Int {
       defer {
           count += 1
       }
       return count
    }
    
    let result = add(book)
    print(result,count)
    
    
    for i in stride(from: 10, to: 0, by: -1) {
       print(i)
    }
    
    
    protocol DrawingProtocol {
       func render()
    }
    
    extension DrawingProtocol {
       func circle() { print("protocol") }
       func render() { circle() }
    }
    
    class SVG: DrawingProtocol {
       func circle() { print("class") }
    }
    
    SVG().render()
    let s: DrawingProtocol = SVG()
    s.render()
    
    
    
    
    let nsstring = NSString("Hello")
    let swiftString = String(nsstring)
    
    let num = UInt.min
    
    
    var x = 5

    class BarOne {
       var callbacks: [()-> Void] = []
    
       init() {
           callbacks.append[self]
           print("init called")
       }
       func bar() {
           print("bar called")
       }
    
       deinit {
           print("deinit called")
       }
    }
    
    var barOne: BarOne? = BarOne()
    barOne = nil





var answer = ""
class MyClass {
   func greeting() {
       answer += "Hello, World!"
   }
}

class Handler {
   var closure: (() -> Void)?
   let obj = MyClass()

   func setupClosure() {
       closure = {
           self.obj.greeting()
       }
   }

   deinit {
       answer += " Handler is being deinitialized."
   }
}

func handlerDeinitialization() -> String {
   var handler: Handler? = Handler()
   handler!.setupClosure()
   handler!.closure!()
   handler = nil
   return answer
}

handlerDeinitialization()




struct A {
   var number = 10

   let fibonacciOfNumber: Int = {
       return fibonacci(of: number)
   }()

   func fibonacci(of num: Int) -> Int {
       if num < 2 {
           return num
       } else {
           return fibonacci(of: num - 1) + fibonacci(of: num - 2)
       }
   }
}

func fibonacci10th() -> Int {
   let a = A()
   return a.fibonacciOfNumber
}




class Car {
   var name = "Mercedes"
}

enum Direction {
   case north, south, east, west
}

func update(vechicle: Car, direction: Direction) {
   let newVechicle = vechicle
   vechicle.name = "BMW"

   var newDirection = direction
   newDirection = .west

   print("\(vechicle.name) \(newVechicle.name)")
   print("\(newDirection) \(direction)")
}

update(vechicle: Car(), direction: .east)




class author {
   var book : Book?
}

class Book {
   var number = 100
}


let john = author()
john.book = Book()

var page:Int = john.book!.number
print("\(page)")

john.book = nil
page = john.book?.number

print("\(page)")




func increment(b: Int) -> () -> Int {
   var a = 0
   func sum() -> Int {
       a += b
       return a
   }
   return sum
}

let incrementByTen = increment(b: 10)
print(incrementByTen())
print(incrementByTen())
let incrementByFive = increment(b: 5)
print(incrementByFive())
print(incrementByFive())



var closureArray: [() -> ()] = []
var i = 0

for _ in 1...5 {
   closureArray.append {
       print(i)
   }
   i += 1
}

closureArray[0]()
closureArray[3]()




protocol Foo {
    var moo: String { get }
}

extension Foo {
    var moo: String {
        return "Moo"
    }
    
    func test() {
        print("extension")
        //print("Foo \(moo)")
    }
}

class Bar: Foo {
    var moo: String {
        return "Mooo"
    }
    func test() {
        print("class")
        //print("Bar \(moo)")
    }
}

let c: Foo = Bar()
c.test()


