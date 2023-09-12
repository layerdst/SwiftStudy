## Async, await 의 도입
- 콜백지옥을 벗어나기 위함.
```swift

func longtimeAsyncAwait() {
	firtsFunc(){
		twoFunc(){
			threeFunc()
		}
	}
}

func longtimeAsyncAwait() async -> Int {
	... await firtsFunc()
	... await twoFunc()
	... await threeFunc()
}
```