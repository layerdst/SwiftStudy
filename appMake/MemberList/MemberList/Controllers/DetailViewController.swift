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
        print("버튼이 눌림")
    }
    
    
}
