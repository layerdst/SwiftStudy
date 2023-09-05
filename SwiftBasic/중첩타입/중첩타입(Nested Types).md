## 중첩타입 
- 내부에 타입을 선언하는 것을 말함
- 특정타입 내에서 사용하기 위함
- 타입 간의 연관성을 명확히 구분하고, 내부 구조를 디테일하게 설계가능
```swift
class Aclass {
	struct Bstruct{
		enum CEnum{
			case aCase
			case bCase

			struct Dstruct{
			
			}
		}
		var name : Cenum
	}
}

let aClass : Aclass = Aclass()
let bStruct : Aclass.Bstruct = Aclass.Bstruct(name : .bCase)
let cEnum : Aclass.Bstruct.cEnum = Aclass.Bstruct.cEnum.aCase
let dStruct : Aclass.Bstruct.Dstruct = Aclass.Bstruct.cEnum.Dstruct()
```

### 예제
```swift
class Message {

    private enum Status {
        case sent
        case received
        case read

    }

    let sender : String, recipient : String, content : String
    let timeStamp : Date
    private var status  = Message.Status.sent

    init(sender : String, recipient : String, content : String){
        self.sender = sender
        self.recipient = recipient
        self.content = content
        self.timeStamp = Date()
    }

    func getBasicInfo()-> String {
        return "보낸 사람 : \(sender) , 받는 사람 \(recipient), 메세지 내용 \(content), 보낸시간 : \(timeStamp.description)"
    }

    func statusColor() -> UIColor{
        switch status {
        case .sent :
            return UIColor(red: 1, green: 0, blue: 0, alpha: 1)
        case .received :
            return UIColor(red: 0, green: 0, blue: 1, alpha: 0)
        case .read :
            return UIColor(red: 0, green: 1, blue: 1, alpha: 1)
        }
    }
}
```