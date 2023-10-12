import UIKit


protocol RemoteControlDelegate{
    func channelUp()
    func channelDown()
}


class RemoteControl  {
    var delegate : RemoteControlDelegate?
    
    func doSomething(){
        print("리모콘 조작이 일어남")
    }
    
    func channelUp(){
        delegate?.channelUp()
    }
    
    func channelDown(){
        delegate?.channelDown()
    }
    
}


class TV : RemoteControlDelegate{
    func channelUp(){
        print("UP")
    }
    
    func channelDown(){
        print("down")
    }
}

let remote = RemoteControl()
let samsungTv = TV()

remote.delegate = samsungTv


remote.channelUp()
remote.channelDown()

class SmartPhone : RemoteControlDelegate {
    init(remote : RemoteControl){
        remote.delegate = self
    }
    
    func channelUp() {
        print("S UP")
    }
    
    func channelDown() {
        print("S Down")
    }
}


let smartPhone = SmartPhone(remote:  remote)
remote.channelUp()
remote.channelDown()

