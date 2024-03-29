//
//  ViewController.swift
//  MusicApp
//
//  Created by 김재영 on 2024/01/16.
//

import UIKit

class ViewController: UIViewController {
    
    var musicArr : [Music] = []
    var networkManager = NetworkManager.shared

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBOutlet weak var musicTableView: UITableView!
    
    func setupTableView(){
        musicTableView.dataSource = self
        
        
        musicTableView.delegate = self
        
        musicTableView.register(UINib(nibName: Cell.musicCellIdentifier, bundle: nil),
                                forCellReuseIdentifier: Cell.musicCellIdentifier)
    }
    
    
    func setupDatas(){
        networkManager.fetchMusic(searchTerm: "jazz") { result in
            switch result{
            case .success(let musicDatas) :
                self.musicArr = musicDatas
                DispatchQueue.main.sync {
                    self.musicTableView.reloadData()
                }
            case .failure(let err) :
                print(err.localizedDescription)
            }
        }
    }
}

extension ViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.musicArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = musicTableView.dequeueReusableCell(withIdentifier: Cell.musicCellIdentifier, for: indexPath) as! MusicCell
        let cellIdx = musicArr[indexPath.row]
        
        cell.imgUrl = cellIdx.imgUrl
        cell.artistNameLabel.text = cellIdx.songName
        cell.ablumNameLabel.text = cellIdx.artistName
        cell.releaseDateLabel.text = cellIdx.realeaseDateString
        cell.songNameLabel.text = cellIdx.songName
        
        cell.selectionStyle = .none
        return cell
    }
    
    
}


extension ViewController : UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
}
