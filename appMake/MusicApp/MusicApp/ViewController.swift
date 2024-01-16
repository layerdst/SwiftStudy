//
//  ViewController.swift
//  MusicApp
//
//  Created by 김재영 on 2024/01/16.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBOutlet weak var musicTableView: UITableView!
    
    func setupTableView(){
        musicTableView.dataSource = self
        musicTableView.delegate = self
    }
    
    
}

extension ViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    
}


extension ViewController : UITableViewDelegate {
    
}
