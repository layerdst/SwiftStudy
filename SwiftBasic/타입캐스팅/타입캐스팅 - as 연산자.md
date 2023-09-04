### 타입캐스팅
- 인스턴스 사용시에 어떤 타입으로 사용할지 메모리 구조에 대한 힌트를 변경하는 것이다
- 메모리의 값을 수정하는 것이 아니라, 해당 타입의 인스턴스를 취급하려는 목적이다

### 다운캐스팅 
- 하위 클래스 타입으로 변환하는 것
-  새로운 변수를 만들어서 타입을 변환하여 "같은 메모리주소" 를 할당함
- 다운캐스팅 전후에 데이터 영역에 클래스는 모두 같은 주소를 가지고 있다.
- as ?  연산자
	- 참이면 반환타입은 Optional 
	- 실패시 nil
- as! 연산자
	- 참이면 강제 언래핑된 타입
	- 실패시 런타임 에러
```swift

let person : Person = Undergraduate()
let person2 : Person = Person()


let UndergraduatePerson = person as? Undergraduate 
// let UndergraduatePerson = person as! Undergraduate 
if let up = UndergraduatePerson {
	...
}

let RealPerson = person2 as? Undergraduate // nil
let RealPerson = person2 as! Undergraduate // error


```

### 업캐스팅
- 상위 클래스 타입으로 변환하는 것
- 인스턴스 as 타입
- 하위클래스의 메모리구조로 저장된 인스턴스를 상위클래스 타입으로 인식 
- 실패가능성이 없음
```swift

let under : Undergraduate = Undergraduate()
let under2 : Undergraduate = Undergraduate()

let under3 = under as Person
let under2 = under2 as Student

```

### 브릿징 
- 서로 호환되는 형식을 캐스팅해서 쉽게 사용하는 것
### 캐스팅 메모리구조

![[Pasted image 20230805224258.png]]


