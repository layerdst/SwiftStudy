//
//  TableViewController.swift
//  MemberList
//
//  Created by 김재영 on 2023/12/04.
//

import UIKit
import PhotosUI

class DetailViewController : UIViewController{
    
    private let detailView = DetailView()
    
    weak var delegate : MemberDelegate?
    
    var member : Member?
    
    override func loadView() {
        view = detailView
        setupBtnAction()
    }
    
    func setupBtnAction(){
        detailView.updateBtn.addTarget(self, action: #selector(saveBtnTapped), for: .touchUpInside)
    }
    
    func setUpImgPicker (){
        var configuration = PHPickerConfiguration()
        configuration.selectionLimit = 0
        configuration.filter = .any(of: [.images, .videos])
        
        let picker = PHPickerViewController(configuration: configuration)
        picker.delegate = self
        self.present(picker, animated : true , completion : nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        detailView.member = member
    }
    
    func setupTapGesture () {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(touchImgView))
        detailView.mainImgView.addGestureRecognizer(tapGesture)
        detailView.mainImgView.isUserInteractionEnabled = true
    }
    
    @objc func touchImgView(){
        print("touch")
        setUpImgPicker()
    }
    
    @objc func saveBtnTapped(){
        
        if member == nil {
            let name = detailView.nameTextField.text ?? ""
            let age = Int(detailView.ageTextField.text ?? "")
            let phoneNumner = detailView.phoneTextField.text ?? ""
            let address = detailView.addressTextField.text ?? ""
            
            var newMember = Member(name: name, age: age, phone: phoneNumner, address: address)
            newMember.memberImg = detailView.mainImgView.image
            
//            let idx = navigationController!.viewControllers.count - 2
//            let vc = navigationController?.viewControllers[idx] as! ViewController
//            vc.memberList.addMember(newMember)
            delegate?.addMember(newMember)
            
        }else {
            member!.memberImg = detailView.mainImgView.image
            let memberId = Int(detailView.memberIdTextField.text!) ?? 0
            member!.name = detailView.nameTextField.text ?? ""
            member!.age = Int(detailView.ageTextField.text ?? "") ?? 0
            member!.phone = detailView.phoneTextField.text ?? ""
            member!.address = detailView.addressTextField.text ?? ""
            
            detailView.member = member
            
//            let idx = navigationController!.viewControllers.count - 2
//            let vc = navigationController?.viewControllers[idx] as! ViewController
//            vc.memberList.updateMember(index: memberId, member!)
            delegate?.updateMember(index: memberId, member!)
        }
    
        self.navigationController?.popViewController(animated: true)
    }
    
    
}

extension DetailViewController : PHPickerViewControllerDelegate {
    func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
        let itemProvider = results.first?.itemProvider
        
        if let itemProvider = itemProvider, itemProvider.canLoadObject(ofClass: UIImage.self) {
            itemProvider.loadObject(ofClass: UIImage.self) { (image, error) in
                DispatchQueue.main.async {
                    self.detailView.mainImgView.image = image as? UIImage
                }
            }
        }else {
            print("이미지 불러옴")
        }
        
    }
}
