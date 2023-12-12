//
//  TableViewController.swift
//  MemberList
//
//  Created by 김재영 on 2023/12/04.
//

import UIKit

class DetailViewController : UIViewController{
    
    private let detailView = DetailView()
    
    var member : Member?
    
    override func loadView() {
        view = detailView
        setupBtnAction()
    }
    
    func setupBtnAction(){
        detailView.updateBtn.addTarget(self, action: #selector(saveBtnTapped), for: .touchUpInside)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        detailView.member = member
    }
    
    @objc func saveBtnTapped(){
        
        if member == nil {
            let name = detailView.nameTextField.text ?? ""
            let age = Int(detailView.ageTextField.text ?? "")
            let phoneNumner = detailView.phoneTextField.text ?? ""
            let address = detailView.addressTextField.text ?? ""
            
            var newMember = Member(name: name, age: age, phone: phoneNumner, address: address)
            newMember.memberImg = detailView.mainImgView.image
            
            let idx = navigationController!.viewControllers.count - 2
            let vc = navigationController?.viewControllers[idx] as! ViewController
            vc.memberList.addMember(newMember)
            
        }else {
            member!.memberImg = detailView.mainImgView.image
            let memberId = Int(detailView.memberIdTextField.text!) ?? 0
            member!.name = detailView.nameTextField.text ?? ""
            member!.age = Int(detailView.ageTextField.text ?? "") ?? 0
            member!.phone = detailView.phoneTextField.text ?? ""
            member!.address = detailView.addressTextField.text ?? ""
            
            detailView.member = member
            
            let idx = navigationController!.viewControllers.count - 2
            let vc = navigationController?.viewControllers[idx] as! ViewController
            vc.memberList.updateMember(index: memberId, member!)
        }
        
        self.navigationController?.popViewController(animated: true)
    }
    
    
}
