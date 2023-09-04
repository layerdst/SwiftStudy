### Any 타입
- 기본타입을 포함, 커스텀 클래스, 구조체 열거형, 함수타입까지도 포함해서 어떤 타입의 인스턴스도 표현할 수 있는 타입(옵셔널도 가능)
- 저장된 타입의 메모리 구조를 알 수 없어서 "항상 타입캐스팅" 을 해서 사용해야함
```swift
var some : Any = "string"
some = 10
some = 3.2
some = "StringAny"

// 타입캐스팅
(some as! String).count 

let array : [Any] = [5, "sdgsa", Person(), Superman(), 3.4]
```

### Any 타입 분기처리
```swift
for (idx, item) in array.enumerated(){
	switch item{
	case is Int :
		print("정수")	
	case let num as Double :
		print("소수")	
	case is String :
		print("문자열")	
	case let person as Person :
		print("사람클래스")	
	case is (String) -> String :
		print("클로저타입입니다")	
	default :
		print("그외타입")
	}
}

```

### 옵셔널의 Any 변환
- 의도적인 Optional 을 사용할 수 있다
- Any 는 모든 타입을 포함하므로, 의도적으로 옵셔널을 사용하려면 Any 타입으로 변환하여 컴파일러의 경고창을 없앨수 있다
- 옵셔널은 임시적인 값일뿐, 일반적으로 개발자들은 옵셔널 바인딩을 해서 언래핑해서 임의 값을 사용해야함 그래서 경고창으로 알려줌
- 그래서 Any 로 변환하는 것은 그 자체를 사용하겟다는 것을 의미하며 경고를 없앨수 있음
```swift
let optionalTemp : Int? = 3
print(optionalTemp) // 경고
print(optionalTemp as Any) // 경고 없음
```

### AnyObject 타입
- 어떤 클래스의 인스턴스도 표현할 수 있는 타입(구조체 X)
- 해당 타입도 타입캐스팅을 해서 사용해야함
```swift
let objArr : [AnyObject] = [Person(), Superman(), NSString()]

(objArr[0] as! Person).name
```
