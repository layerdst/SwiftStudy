##  IS 연산자(Type Check Operator)
 - 타입에 대한 검사를 수행하는 이항연산자
	 - 인스턴스 is 타입 -> true, false 리턴
	 - 상속관계에서 "포함관계" 를 의미하기도함
```swift
class Person {
	var id = 0
	var name = "이름"
	var email = "abc@gmail.com"
}

class Student : Person{
	var studentId = 1
}

class Undergraduate : Student{
	var major = "전공"
}

var person1 = Person()
var student1 = Student()
var undergraduate1 = Undergraduate()

person1 is Person // true
person1 is Student // false
person1 is Undergraduate // false


student1 is Person // true
student1 is Student // true
student1 is Undergraduate // false

undergraduate1 is Person // true
undergraduate1 is Student // true
undergraduate1 is Undergraduate // true
```

### is 연산자의 활용
```swift
let person2 = Person()
let student2 = Student()
let undergraduate = Undergraduate()

let people = [person1, person2, student1, student2, undergraduate1, undergraduate2]

var studentNum = 0
for some in people{
	if some is Student{
		studentNum += 1
	}
}
// print 4

let reduceTempArrIs = tempArrIs.filter {$0 is A}.reduce(into : []) { a, b in
    return a.append(b)
}

```