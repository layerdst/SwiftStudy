//
//  ViewController.swift
//  MemberList
//
//  Created by 김재영 on 2023/11/29.
//

import UIKit

class ViewController: UIViewController {

    
    let tableView = UITableView()
    
    var memberList = MemberListManager();
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        memberList.makeMembersListData()
        setUpTableView()
        setNavBar()
        // Do any additional setup after loading the view.
    }
    
    func setNavBar(){
        title = "목록"
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = .white
        
        navigationController?.navigationBar.tintColor = .systemBlue
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.compactAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        
//        self.navigationItem.rightBarButtonItem = self.plusBtn
    }
    
    func setUpTableView(){
        
        tableViewContraints()
        tableView.dataSource = self
        tableView.rowHeight = 60
    }
    
    
    func tableViewContraints(){
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
        ])
    }
}

extension ViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return memberList.getMemberList().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        return UITableViewCell()
    }
    
    
}

