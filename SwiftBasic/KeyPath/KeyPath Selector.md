## KeyPath
```swift
class Dog{
	var name : String
	init (name : String){
		self.name = name
	}
}

let dog1 = Dog(name : "초코")
dog1.name

class School{
	var name : String
	var affiliate : SmallSchool

	init(name : String, affiliate : SmallSchool){
		self.name = name
		self.affiliate = affiliate
	}
}

class SmallSchool{
	var classMember : Person
	init(classMember : Person){
		self.classMembe = classMember
	}
}

class Person {
	var name : String
	init(name : String){
		self.name = name
	}
}

let person1 = Person(name : "홍길동")
let smallSchool1 = SmallSchool(classMember : person1)
let schoo1 = School(name : "슈퍼고", affiliate : smallSchool)

let gildongName = school1.smallSchool1.person1.name
```
#### keyPath 표현식
```swift
let namePath = \School.affiliate.classMember.name // 경로를 지정
let namePathIn = \School.affiliate.classMember
let namePathAdd = namePathIn.appending(path : \.name) // 경로추가 가능

school[keyPath : namePath] // 딕셔너리 방식 서브스크립트로 접근
```
#### keyPath 표현식의 종류
```
AnyKeyPath : 어떤 속성인지 특정되지 않음
PartialKeyPath<Root> : 타입에 대한 키패스(예를 들어 배열같은 것으로 묶을때 사용)
KeyPath<Root, value> : 타입과 읽기/ 쓰기에 대한 키패스(구조체)
WriteableKeyPath<Root, Value> : 타입과 읽기 / 쓰기 가능한 속성에 대한 키패스(구조체)
ReferenceWritableKeyPath<Root, Value> : 클래스타입과 읽기/쓰기 가능한 속성에 대한 키패스
```
#### 예전 버전, 그리고 Obective-C 의 방식 - \#KeyPath
- NSObject 클래스 상속(구조체 지원 안함)
- NSObject value(forKey :) 메서드가 구현되어 있기 때문이다
- 속성에도 @objc 를 붙어야함
- 사용시 구체적타입으로 다시 타입캐스팅해서 사용해야함
```swift
class Person : NSObject {
	@objc var name : String
	init(name : String){
		self.name = name
	}
}


let person2 = Person(name: "임꺽정")
person2.name

let gjName = person2.value(forKey : "name") as? String
let gjName2 = person2.value(forKeyPath: #keyPath(Person.name)) as? String

let path = #keyPath(Person.name)
let gjName3 = person2.value(forKeyPath : path) as? String
```

## Selector
- 클래스. Objective-C 프로토콜에 포함된 멤버에 적용가능(구조체 불가)
- 내부적으로 Objective-C 프레임워크를 사용하기 있기때문에 @objc 특성을 추가해야지만 사용가능
```swift
class Dog{
	var num = 1.0
	@objc var doubleName : Double {
		get{
			return num * 2.0
		}
		set{
			num = newValue / 2.0
		}
	}

	@objc func run(){
		print("강아지가 달립니다")
	}
}


// 계산속성을 가르킬때
let eyesSelector= #selector(getter:Dog.doubleNum)
let nameSelector =#selector(setter:Dog.doubleNum)


// 메서드를 가르킬때
let runSelector = #selector(Dog.run)
```