
## map
- 기존 배열등의 각 아이템을 새롭게 매핑해서 매핑방식은 클로저가 제공하여 새로운 배열을 리턴하는 함수
```swift 
let numbers = [1,2,3,4,5]

let a = numbers.map{ Int in
	return "숫자 : \(num)"
} // Int -> 문자열로 바꿈

let b = numbers.map{ "숫자 \($0)"}

["숫자 : 1","숫자 : 2","숫자 : 3","숫자 : 4","숫자 : 5"]
```

#### filter
- 기존 배열등의 각 아이템을 조건을 확인후 true 를 만족하는 아이템을 걸로 새로운 배영을 리턴
```swift

let namesArr = ["apple", "black", "circle", "dream", "blue"]

let namseFilter = namesArr.filter{ str in 
	return str.contains("b")
}

let numArr = [1,2,3,4,5,6,7,8]

var evenNumArr = array.filter{ num in
	return num % 2
}

var evenNumArrA = array.filter{ $0 % 2 == 0 }

//["black", "blue"]
```

- filter 두번 적용하기
```swift
var evenArrFiveLessThan = array.filter{ $0 % 2 == 0 }.filter{ $0 < 5 } // 5보다 작은 짝수
```

#### reduce
- 기존 배열 등의 아이템을 클로저가 제공하는 방식으로 결합해서 마지막 결과값을 리턴
- 초기값이 필요한 클로저
```swift
var numsArrayRe = [1,2,3,4,5,6,7,8,9,10]

let intSum = numsArrayRe.reduce(0){ sum, num in
	return sum + num
}

let stringSum = numsArrayRe.reduce("0"){ result , item in
	return result + String(item)
}
```

#### map, filter, reduce 활용
- 홀수만 제곱해서 그 숫자를 다 더한값
```swift

numsArrayCombine = [1,2,3,4,5,6,7,8,9]

numsArrayCombine.filter{num in 
	return num % 2 == 1
}.map{ num in 
	return num * num
}.reduce(0){ result, item in
	return result + item
}


numsArrayCombine.filter{
	$0 % 2 == 1
}.map{  
	$0 * $0
}.reduce(0){ 
	$0 + $1
}
```

#### forEach
- 기존 배열에서 각 아이템을 활용하여 특정작업을 실행하는 것
```swift
let immutableArray = [1,2,3,4,5]

immutableArray.forEach{ num in
	print(num)		   
}

immutableArray.forEach{print($0)}
```

#### compactMap
- 자동으로 옵셔널 형식을 제거해주고 새로운 배열을 리턴한다
```swift
let stringOptArr : [String?] = ["A", nil, "B", nil, "C"]
var stringArr = stringOptArr.compactMap{$0} // ["A", "B", "C"]
//stringOptArr.filter{$0 != nil}.map($0!)


let numbers = [-2, -1, 0, 1, 2]
var positiveNumbers = numbers.compactMap{$0 > 0 ? $0 : nil} // [1,2]
// numbers.filter{$0 > 0}
```

#### flatMap
- 중첩된 배열에 각 배열을 새롭게 매핑해서 내부 중첩된 매열을 제거하고 리턴
```swift
var nestedArr = [[1,2,3], [4,5,6], [7,8,9]]
nestedArr.flatMap{$0} //[1,2,3,4,5,6,7,8,9]


var twoNestedArr = [[[1,2,3],[4,5,6]],[[7,8,9],[10,11,12]]]
twoNestedArr.flatMap{$0}.flatMap{$0} //[1,2,3,4,5,6,7,8,9]

```