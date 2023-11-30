//
//  MemberListManager.swift
//  MemberList
//
//  Created by 김재영 on 2023/11/29.
//

import UIKit

class MemberListManager {
    
    private var membersList : [Member] = []
    
    func makeMembersListData(){
        membersList = [
            Member(name: "a", age: 20, phone: "010101010", address: "SS"),
            Member(name: "aa", age: 20, phone: "010101010", address: "SS"),
            Member(name: "aaa", age: 20, phone: "010101010", address: "SS"),
            Member(name: "aaaa", age: 20, phone: "010101010", address: "SS"),
            Member(name: "aaaaa", age: 20, phone: "010101010", address: "SS"),
            Member(name: "aaaaaa", age: 20, phone: "010101010", address: "SS"),
        ]
    }
    
    func getMemberList() -> [Member] {
        return membersList
    }
    
    func addMember(_ member : Member) {
        membersList.append(member)
    }
    
    func updateMember(index : Int, _ member : Member){
        membersList[index] = member
    }
    
    subscript(index : Int) -> Member{
        get{
            return membersList[index]
        }
    }
    
    
    
    
    
}

