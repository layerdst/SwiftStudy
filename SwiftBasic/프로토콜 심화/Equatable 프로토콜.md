## Equatable 프로토콜 
- 동일성 관련 프로토콜 == !=
- Comparable, Hashable 은 Equatable 프로토콜을 상속받는다.
#### Equatable 프로토콜의 채택
- 구조체, 열거형의 경우 Equatable 프로토콜 채택시 모든 저장 속성 / 열거형이 Equatable 프로토콜을 채택한 타입이라면 비교연산자 메서드 자동구현
#### Equatable 프로토콜의 예외
- 클래스는 원칙적으로 동일성을 비교하지 못하기 때문에, 인스턴스 비교를 하는 항등연산자 ( == )가 존재하는 비교 연산자 구현방식에 대해 개발자에게 위임한다 
- 열거형의 경우 연관값이 없다면 기본적으로 Equatable / Hashable 하기 때문에 Equatable 을 채택하지 않아도 된다.

#### Equatable - Enum 의 경우
- 열거형에 연관값이 없다면 기본적으로 Equatable / Hashable 하기 때문에 Equatable 을 채택하지 않아도 된다.
```swift
enum Direction {
	case east
	case west
	case south
	case north
}

Direction.north == Direction.north
Direction.north != Direction.east

```
- 열거형의 경우 Equatable 프로토콜 채택시 모든 저장속성( 열거형은 모든 연관값) 이 Equatable 프토콜을 채택한 타입이라면 비교연산자 메서드가 자동구현됨
```swift
enum Computer : Equatable {
	case cpu(core : Int, ghz : Double)
	case ram(Int)
	case hardDisk(gb:Int)
}

Computer.cpu(core:8, ghz : 3.5) == Computer.cpu(core:16, ghz:2.0)
```

#### Equatable - Struct 의 경우
- 구조체Equatable 프로토콜 채택시 모든 저장 속성 / 열거형이 Equatable 프로토콜을 채택한 타입이라면 비교연산자 메서드 자동구현
- 다만 모든 저장속성의 자료형이 Equatable 프로토콜을 채택한 것이여야함(String, Int...)
```swift
struct Dog{
	var name : String 
	var age : Int
}

extension Dog : Equatable {
	
}


let dog1 = Dog(name : "초코", age : 10)
let dog2 = Dog(name : "보리", age : 2)

```

#### Equatable - Class 의 경우
- 클래스는 예외없이 무조건 구현해야한다
```swift
class Person {
	var name : String
	var age : Int

	init(name : String, age : Int){
		self.name = name
		self.age = age
	}
}

extension Person : Equatable {
	static func == (lhs : Person, rhs : Person) -> Bool {
		return lhs.name == rhs.name && rhs.age == rhs.age
	} 
}
```

## Comparable 프로토콜
- 값의 크기나 순서비교, 정렬 가능하도록 할때 쓰임
- 일반적으로 < 만 구현하면 >, <=, >= 자동구현
- Comparable 프로토콜은 Equatable 프로토콜을 상속받고 있으며, 필요의 경우 == 도 구현해야함
- 스위프트에서 제공하는 기본 숫자타입, String 은 모두다 채택하고 있음(Bool 제외)
```swift
let num1 : Int = 123
let num2 : Int = 456

num1 < num2
num1 > num2
```
#### Comparable 프로토콜 채택
- 구조체, 클래스 모든 저장속성( 열거형은 원시값) 이 Comparable 을 채택한 경우라도, less than 연산자를 직접 구현해야함(순서 정렬 방식에 대해서는 무조건 구체적인 구현이 필요)
- 원시값을 도입하는 순간, 개발자가 직접 대응되는 값을 제공하므로 정렬방식도 구현
```swift
enum Direction : Int {
	case east
	case west
	case south
	case north
}

extension Direction : Comparable {
	static func < (lhs : Direction, rhs : Direction) -> Bool {
		return lhs.rawValue < rhs.rawValue
	}
}

Direction.north < Direction.east // false
Direction.north > Direction.ease // true
```

#### Comparable - Eum
- 열거형의 경우 원시값(연관값이 있어도) 이 없다면 Comparable 채택할때 < less than 연산자는 자동으로 제공한다
```swift
enum Computer : Comparable {
	case cpu(core : Int, ghz : Double)
	case ram(Int)
	case hardDisk(gb : Int)
}
```

#### Comparable - Struct
- 구조체의 경우 메서드는 \==, < 이거나 < 둘중 하나를  직접 구현해야함
```swift
struct Dog{
	var name : String
	var age : Int

	// 저장속성의 자료형이 Equatable 을 채택한 자료형이면 자동으로 구현해준다  
	// static func == (lhs : Dog, rhs : Dog) -> Bool {
	// 	return lhs.name == rhs.name && lhs.age = rhs.age 
	// }

	static func < (lhs : Dog, rhs : Dog)-> Bool {
		return lhs.age < rhs.age
	}
}

let dog1 : Dog = Dog(name : "초코", age : 19)
let dog2 : Dog = Dog(name : "보리", age : 20)
```

#### Comparable - Class
- 클래스의 경우 직접 구현 - \==, < 두개다 구현해줘야함
```swift
class Person {
	var name : String
	var age : Int

	init(name : String, age : Int){
		self.name = name
		self.age = age
	}
}

extension Person : Comparable {
	static func == (lhs : Person, rhs : Person) -> Bool {
		return lhs.name == rhs.name && lhs.age == rhs.age
	}

	static func < (lhs : Person, rhs : Person) -> Bool {
		return lhs.age < rhs.age
	}
}
```

## Hashable 
- Hashable 프로토콜의 역할(유일한 값을 갖도록, Dictionary, Set 의 요소가 될수 있음)
- func hash 메서드의 구현

#### Hashable - Enum
- 모든 저장 속성이 Hashable 프로토콜을 채택한 타입이라면 hash(into:) 메서드 자동구현(추가적인 정보들이 Int, Double 등 이미 Hashable 프로토콜을 채택해서 구체적인 정보들까지 유일한 판별이 가능)
```swift
enum Computer : Hashable{
	case cpu(core : Int, ghz : Double)
	case ram(Int)
	case hardDisk(gb : Int)					 
}

let superSet : Set = [Computer.cpu(core:8, ghz:3.2), Computer.cpu(core:16, ghz : 3.5)]
```

- 연관값이 없다면 Hashable을 채택하지 않아도 유일성 판별이 가능하다
```swift
enum Direction {
	case east
	case west
	case south
	case north
}

let directionSet : Set = [Direction.north, Direction.east]
```

#### Hashable - Struct
-  모든 저장 속성이 Hashable 프로토콜을 채택한 타입이라면 hash(into:) 메서드 자동구현(추가적인 정보들이 Int, Double 등 이미 Hashable 프로토콜을 채택해서 구체적인 정보들까지 유일한 판별이 가능)
```swift
struct Dog{
	var name : String
	var age : Int
}

// 구현할 필요 없음
extension Dog : Hashable {
	func hash(into hasher : inout Hasher){
		hasher.combine(name)
		hasher.combine(age)
	}
}



```
#### Hashable - Class 
- 클래스는 인스턴스 유일성 갖게 하기 위해서 hash(:into) 메서드를 직접 구현해야함(원칙적으로 Hashable 불가함)
```swift
class Person {
	var name : String
	var age : Int
	
	init(name : String, age : Int){
		self.name = name
		self.age = age
	}
}

// 

extension Person : Hashable {
	func hash(into hasher : inout Hasher) {
		hasher.combine(name)
		hasher.combine(age)
	}

	// == 연산자도 직접 구현해야함 (Equatalbe 를 상속받고 있기때문)
	static func == (lhs :Person, rhs:Person) -> Bool {
		return lhs.name == rhs.name && lhs.age == rhs.age
	}
}

```