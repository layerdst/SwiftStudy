## GCD 사용시 주의사항
#### 반드시 메인큐에서 처리해야하는 작업
- UI 와 관련된 작업은 메인스레드로 보낼 필요가 있다
```swift
DispatchQueue.global(qos:.utility).async{
	...
	self.textLabel.text = "main Thread" // 메인스레드 작업 에러발생
}

DispatchQueue.global(qos:.utility).async{
	DispatchQueue.main.async{
		self.textLabel.text = "main Thread" // UI 작업은 메인큐!
	}
}
```

- 컴플리션핸들러 존재이유 - 올바른 콜백함수
	- 함수를 아래처럼 설계하면 절대 안됌!
```swift
func getImage(with urlString : String) -> UIImage?{
	let url = URL(string:urlString)?

	var photoImage : UIImage? = nil

	URLSession.shared.dataTask(with : url){ url, resp, err in
		if let err = err {
			print("에러 있음 : \(err)")
		}

		guard let imageData = data else { return }
		photoImage = UIImage(data : imageData)
	}.resume() 

	return photoImage
}

getImage(with : "https://....") // 무조건 nil 을 리턴함
```

- 올바른 함수 형태
```swift
func getImage(with urlString : String), completionHandler : @escaping (UIImage?) -> Void{
	let url = URL(string:urlString)?

	var photoImage : UIImage? = nil

	URLSession.shared.dataTask(with : url){ url, resp, err in
		if let err = err {
			print("에러 있음 : \(err)")
		}

		guard let imageData = data else { return }
		photoImage = UIImage(data : imageData)
		completionHandler(photoImage)
	}.resume() 

	return photoImage
}

getImage(with : "/...") { image in 
	DispatchQueue.main.async{
	....
	}				 
}
```
- weak, strong 캡처주의
```swift
DispatchQueue.global(qos:.utility).async{ [weak self] in
	guard let self = self else { return }
	DispatchQueue.main.async{
		self.textLabel.text = "main Thread" // UI 작업은 메인큐!
	}
}
```

- 동기함수를 비동기 함수로 동작하는 함수를 변형하는 법
```swift
func longtimePrint(name : String) -> String{
	print("프린트 - 1")
	sleep(1)
	print("프린트 - 2")
	sleep(1)
	print("프린트 - 3 \(name)")
	sleep(1)
	print("프린트 - 4")
	sleep(1)
}

func asyncLongtimePrint(name : String, completionHandler : @escaping (String) -> Void ){
	
	DispatchQueue.global().async{
		let n = longtimePrint(name : name)
		completion(n)
	}
}

asyncLongtimePrint(name : "잡스"){ result in
	print(result)				
}
```

- 비동기함수 메서드의 이해
```swift
URLSession // 자체적으로 비동기 처리가 되어있음

```