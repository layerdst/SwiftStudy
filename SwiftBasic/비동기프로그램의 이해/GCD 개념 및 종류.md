## GCD(DispatchQueue)
#### DispatchQueue
- 글로벌 메인큐 : DispatchQueue.main : 1번 스레드 -> 직렬 
- 글로벌 큐 : DispatchQueue.global() : 동시성, 서비스의 품질에 따라 여러종류가 있음
	- 서비스 품질에 따라 더 많은 스레드를 배치하고,  CPU의 집중도를 높인다.
- 프라이빗 큐 : DispatchQueue(label : "...")
	- 기본적인 설정은 직렬이나 동시성도 가능한 커스텀큐이다.

#### DispatchQueue 종류
- 글로벌 메인큐
```swift
let mainQueue = DispatchQueue.main
```

- 글로벌 큐 - 서비스 품질 및 속도순서에 따라 (빠름 -> 느림순)
```swift
DispatchQueue.global(qos : .userInterative)
DispatchQueue.global(qos : .userInitiated)
DispatchQueue.global() // 주로사용
DispatchQueue.global(qos : .utility)// 주로 사용
DispatchQueue.global(qos : .background)
DispatchQueue.global(qos : .unspecified)
```

- 프라이빗큐 
```swift
let privateQueue = DispatchQueue(label : "com.inflearn.serial")
DispatchQueue(label : "serial")
DispatchQueue(label : "custom", attribute : .concurrent)


```
#### OperationQueue
- 메인큐 : OperationQueue.mai\
- 프라이빗큐 : OperationQueue()