//
//  Member.swift
//  MemberList
//
//  Created by 김재영 on 2023/11/29.
//

import UIKit

protocol MemberDelegate : AnyObject {
    func addMember(_ member : Member)
    func updateMember(index : Int, _ member : Member)
}

struct Member {
    
    lazy var memberImg : UIImage? = {
        guard let name = name else {return UIImage(systemName: "person")}
        return UIImage(named:"\(name).png") ?? UIImage(systemName: "person")
        
    }()
    
    static var memberNumbers : Int = 0
    
    let memberId : Int
    var name : String?
    var age : Int?
    var phone : String?
    var address : String?
    
    init(name : String?, age : Int?, phone:String?, address : String?){
        self.memberId = Member.memberNumbers
        
        self.name = name
        self.age = age
        self.phone = phone
        self.address = address
        
        Member.memberNumbers += 1
    }
}
