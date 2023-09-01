## Never 타입
- 런타임에 발생할 수 있는 에러를 미리 발견하고, 검증 테스트 하기 위함
- 앱의 해킹이라는 극단적인 예를 들었지만, 실제로 앱의 해킹이 아닌 조금 가벼운 에러라면 실제앱을 출시에는 해당코드를 삭제해야함
- 삭제하지 않으면 앱이 꺼질 가능성이 높기 때문에 사용자에게 사용성이 안좋은 앱으로 평가받을 가능성이 높음
- 내부가 빈 열거형으로 선언
- 인스턴스를 생성할수 없음(Uninhabited Type)
## NoneReturning 함수
- 제어권을 전달하지 않는 함수 (함수를 호출했던 코드로 다시 제어권을 전달하지 않음)
- 명시적으로 제어권을 전달하지 않는 다는 것을 표시하기 위해 Never 타입으로 선언
```swift
func crashAndBurn () -> Never {
	fatalError()
}

print("1")
crashAndBurn()
print("2") // Will never be executed
```
## Never 타입을 리턴하는 함수
- 함수내부에서 프로그램을 종료할시
- 항상 에러를 던져서, catch 문에서 처리하도록 해야할때 제어권을 catch 문으로 전달함

## Never 관련된 함수 - 디버깅함수
#### fatalError
```swift
func fatalError(_ message : @autoclosure() -> String = String(), 
			   file : StaticString = #file
			   line : UInt = #line) -> Never

1) message : 에러메세지
2) file : 파일이름
3) line : 라인번호

리턴형 Never 타입


func someCloseAppSituation(){
	fatalError("앱해킹시도 흔적 발견")
} // 에러발생.. 메세지 : 앱해킹시도 흔적 발견
```

#### assert
- 실제 앱을 출시시, 일부러 앱을 종료시켜야 정도의 상황은 아니지만 디버그 모드에서는 검증가능
```swift
func enterWrongValue1() {
	let someWrongInt = -1
	assert(someWrongInput>0, "유저가 값을 잘못 입력")
}

func enterWrongValue2() {
	let someWrongInput = -1
	if someWrongInput > 0 {
		//정상적으로 처리하는 코드
	}else{
		assertionsFailure("유저가 값을 잘못입력")
	}
}
```

#### precondition 
- 실제 앱을 출시시에 일부러 앱을 의도적으로 종료시켜야함
```swift
func appUpdateCheck1() {
	let update = false
	precondition(update, "앱을 업데이트 하지 않음")
}

func appUpdateCheck2() {
	let update = false

	if update {
	
	} else {
		preconditionFailure("앱을 업데이트 하지 않음")
	} 
}
```
#### 예시
```swift
enum SomeError : Error {
	case aError
	case bError
}

func someThrowErrorFunction () throws -> Never {
	if true {
		throw SomeError.aError
	} else {
		throw SomeError.bError
	}
}

do {
	try someThrowingErrorFunction()
} catch {
	print(error)	
}
```