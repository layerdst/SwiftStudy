## self
- 인스턴스 자기 자신을 가리키기 위해서 사용한다
- 새로운 값으로 속성 초기화 가능한 패턴(값타입)
```swift
struct Calculator{
	var number : Int = 0

	mutating func plusNumber(_ num : Int){
		number = number + num
	}

	// 값 타입( 구조체, 열거형) 에서 인스턴스 값 자체를 치환
	mutating func reset(){
		self = Calculator() // 값 타입은 새로 생성해서 치환하는 것도 가능
	}
}
```

- 타입 속성 / 메서드에서 사용하면, 인스턴스가 아닌 타입자체를 가르킴
```swift
struct MyStruct {
	static let club = "iOS 부서"

	static func doPrinting(){
		print("소속은 \(self.club)") // 타입을 가르킴
	}
}
```

- 타입 인스턴스를 가르키는 경우에 사용 (외부에서 타입을 가르키는 경우)
```swift
class SomeClass {
	static let name = "SomeClass"
}

let myClass : SomeClass.Type = SomeClass.self // 타입인스턴스를 가르킴

SomeClass.name
SomeClass.self.name

Int.max
Int.self.max

```

## Self
- 해당 타입을 가르키는 용도로 사용
- 타입을 선언하는 위치에서 사용하거나, 타입속성 / 메서드를 지칭하는 자리에서 대신 사용
```swift
extension Int {

	// 타입 저장 속성
	static let zero : Self = 0

	// 인스턴스 계산속성
	var zero : Self {
		return 0
	}

	// 타입 속성 / 메서드에서 지칭
	static func toZero() -> Self{
		return Self.zero
	}

	// 인스턴스 메서드
	func toZero() -> Self{
		return self.zero
	}	
}

Int.zero
6.zero

Int.toZero()
5.toZero()
```

- 프로토콜에서의 Self 사용 (프로토콜을 채택하는 해당 타입을 가르킴)
```swift
extension BinaryInteger {
	func square() -> Self{ // 프로토콜 확장을 채택한 모든 타입을 가르킴
		return self * self
	}
}


// 간단하게 이야기하면 Int, UInt은 비교가능하도록 만드는 프로토콜이 있음
// 해당 비교연산 프로토콜을 채택한 모든 타입에 대해서 비교가 가능함
// 타입이 다름에도 비교가 가능
let x1 : Int = -7
let y1 : UInt = 7

if x1 <= y1 {
	print("\(x1) 가 \(y1) 보다 작거나 같다")
} else {
	print("\(x1) 가 \(y1) 보다 크다")
}

```