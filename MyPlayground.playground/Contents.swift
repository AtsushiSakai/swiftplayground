//一行コメント
/*
 複数行コメント
 */
print("hello world")

var msg = "test"
print(msg)
msg = "test3"
print(msg) //再代入
var msg2: String
msg2 = "test3"
print(msg2)

// 数値演算
print(8 / 3) // 2
print(8.0 / 3) // 2.666..
print(8 % 3) // 2 余り

var x = 10
x += 5
print(x) // 15

// 文字列演算
print("hello " + "world")
print("x * 2 is \(x * 2)") //Stringへの埋め込み

// 論理演算
// && || !
print(true && false) // false
print(true || false) // true
print(!false) // true

let score = 50
let result: String

if score > 80 {
    result = "great"
}
else if score > 60 {
    result = "good"
}
else {
    result = "bad"
}
print(result) // bad

// switch
let num = 16

switch num {
case 0:
    print("0")
case 1, 2, 3: //複数指定
    print("1/2/3")
case 4...6: //範囲指定
    print("4/5/6")
case 7..<9: // 範囲指定(末尾を含まない)
    print("7/8")
case 15:
    break //何もしない場合はbreak
case let n where n > 20: //変数を受け取ることも可能
    print("\(n) is huge!")
default:
    print("default ")
}

// while
var n = 0
while n < 3 {
    print(n)
    n += 1
}

n = 9
//実行されない
while n < 3 {
    print(n)
    n += 1
}

//一度実行される
repeat {
    print(n)
    n += 1
} while n < 3

// for 
for i in 0...5 {
    print(i)
}

// nil
//let s1: String = nil //error
let s2: Optional<String> = nil
let s3: String? = nil

// nil判定
if s2 != nil {
    print(s2!) // オプショナル型のデータを取り出す時は、!を付ける (unwrap)
}

// s3がnil出ない場合のみ、値を表示(Optional Binding)
if let value = s3 {
    print(value)
}

// s3がnilでなければ値を表示
print(s3 ?? "this is nil!")

// Array
// initialize
var scores: [Int] = [50, 40]
var scores2 = [50.0, 40.0] //型推論
var scores3: [String] //空Arrayで初期化
var scores4 = [String]() //上記と同じ初期化

print(scores[0]) // Arrayの要素を表示
scores[1] = 30  //Arrayの要素に代入
print(scores)   //Array全体を表示

print(scores.count) // Arrayの要素数を計算
print(scores.isEmpty) // Arrayが空集合か判定

var names = [String]()
names.append("Tom")
names.append("Jon")
names += ["Lisa"]

for name in names {
    print(name)
}


//taple
var items1 = ("cat", 5)
print(items1.0) //cat
items1.1 = 8
print(items1)

let (product, amount) = items1
print(product)
print(amount)

//let (product, _) = items
//print(product)

var items = (product: "apple", amount: 5)
print(items.product)

//set
var set: Set<Int> = [3, 5, 8, 8] //Setの初期化
var set2: Set = [3, 5, 8, 8] //型推論
print(set)


print(set.contains(3))//3が入っているか?
set.insert(10)//10を追加
set.remove(5)//5を削除
print(set)
print(set.count)//要素の数を数える

//let s = Set<Int>()
//print(s.isEmpty)

let a: Set = [1, 3, 5, 8]
let b: Set = [3, 5, 8, 9]

print(a.union(b))
print(a.intersection(b))
print(a.subtracting(b))


var scored: Dictionary<String, Int> = ["tom": 200, "ken": 300] //Dictionary 初期化
var scored2 = ["tom": 200, "ken": 300] //型推論
let emptyd = [String: Int]()


scored["tom"] = 500 //要素に代入
print(scored["lina"] ?? "n.a.") //ある要素の表示
scored["lina"] = 100 //新しい要素を追加
print(scored.count)

for (key, value) in scored {
    print("\(key): \(value)")
}

//func

func test1() {
    print("test1")
}
test1()

func test2() -> String {
    return "test2"
}

print(test2())

func test3(input: String = "aaa") {//default
    print("\(input)")
}
test3(input: "bbb")


func test4(_ input: String) {
    print("\(input)")
}

test4("bbb")

func test5(str input: String) {
    print("\(input)")
}

test5(str: "bbb")

//================

class User {
    let name: String
    var age: Int
    init() {
        self.name = "Tom"
        self.age = 23
    }
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
}


let user: User = User()
let user2 = User() // 型推論
print(user.name)
print(user.age)
user.age = 26
print(user.age)


let tom = User(name: "tom", age: 23)
print(tom.name)
print(tom.age)

let bob = User()
print(bob.name)
print(bob.age)

// Class

class User2 {
    let name: String
    var score: Int
    //computed propterty
    var level: Int {
        get {
            return Int(self.score / 10)
        }
        set {
            if newValue >= 0 {
                score = newValue * 10
            }
        }
    }
    // getterのみの場合は省略形が使える
    var level2: Int {
        return Int(score / 20)
    }
    init(name: String, score: Int) {
        self.name = name
        self.score = score
    }
}

let tom2 = User2(name: "tom", score: 23)
print(tom2.level)
tom2.level = 5
print(tom2.score)
tom2.level = -3
print(tom2.score)
print(tom2.level2)

class User3 {
    let name: String
    var score: Int {
        willSet {// 変更前
            print("\(score) -> \(newValue)")
        }
        didSet {// 変更後
            // after change
            print("Changed: \(score - oldValue)")
        }
    }
    init(_ name: String, _ score: Int) {
        self.name = name
        self.score = score
    }
    func sayHi(msg: String) {
        print("\(msg) \(name)")
    }
}

let tom3 = User3("tom", 23)
tom3.score = 53
tom3.score = 40


// 継承
// User -> AdminUser

class User4 {
    let name: String
    var score: Int
    init(name: String, score: Int) {
        self.name = name
        self.score = score
    }
    func sayHi() {
        print("hi \(name)")
    }
    final func sayHiHi() {//オーバライド禁止する時はfinalを使う
        print("hiHi \(name)")
    }
}

// inheritance
class AdminUser: User4 {
    func sayHello() {
        print("hello \(name)")
    }
    override func sayHi() { //親クラスのメソッドをオーバライド
        print("[admin] hi \(name)")
    }
}

let tom4 = User4(name:"tom", score: 23)
let bob3 = AdminUser(name:"bob", score: 33)
print(bob3.name)
print(bob3.score)
bob3.sayHi()
bob3.sayHello()


class User5 {
    let name: String
    var score: Int
    static var count = 0 //static property
    init(_ name: String, _ score: Int) {
        self.name = name
        self.score = score
        User5.count += 1
    }
    static func getInfo() { //static method
        print("number of instance: \(count) ")
    }
}


User5.getInfo()
let tom5 = User5("tom", 23)
User5.getInfo()



class User6 {
    let name: String
    init(_ name: String) {
        self.name = name
    }
}
class AdminUser6: User6 {}

let tom6 = User6("tom")
let bob6 = AdminUser6("bob")

let users = [tom6, bob6]

for user in users {
    if let u = user as? AdminUser6 {//AdminUserのみ
        print(u.name)
    }
}

// Protocol

protocol Printable {
    var type: String { get }//Readのみ可能なプロパティ
    var count: Int { get set }//ReadとWriteが可能なプロパティ
    func printout()
}

class User7: Printable {
    let type = "Laser"
    var count = 0
    let name: String
    init(_ name: String) {
        self.name = name
    }
    func printout() {
        count += 1
        print("\(type): \(count)")
    }
}

let tom7 = User7("tom")
tom7.printout()
tom7.printout()
tom7.printout()

extension String {
    var length: Int {
        return self.characters.count
    }
}

let msg0 = "hello"
print(msg0.characters.count)
print(msg0.length)

enum Direction {
    case right
    case left
}

var dir: Direction
dir = Direction.right

switch (dir) {
case .right:
    print("right")
case .left:
    print("left")
}

enum Direction2: Int {
    case right = 1
    case left = -1
}

print(Direction2.right.rawValue)

// Generics
func getThree<T>(x: T) {
    print(x)
    print(x)
}

getThree(x: 5)
getThree(x: "hello")
getThree(x: 2.3)

class Team {
    var members = ["ichiro", "matsui", "yuu"]
    subscript(index: Int) -> String {
        get {
            return members[index]
        }
        set {
            members.insert(newValue, at: index)
        }
    }
}

var team1 = Team()
print(team1[1]) // matsui
team1[3] = "tanaka"
print(team1[3]) //

func say(_ msg: String?) {
    guard let s = msg else {
        print("value not set!")
        return
    }
    print(s)
}

say(nil)
say("hello")

enum LoginError: Error {
    case emptyName
    case shortName
}

class User0 {
    let name: String
    init(_ name: String) {
        self.name = name
    }
    func login() throws {
        guard name != "" else {
            throw LoginError.emptyName
        }
        guard name.characters.count > 5 else {
            throw LoginError.shortName
        }
        print("login success")
    }
}

let tom0 = User0("")

do {
    try tom0.login()
} catch LoginError.emptyName {
    print("please enter your name")
} catch LoginError.shortName {
    print("too short")
}
