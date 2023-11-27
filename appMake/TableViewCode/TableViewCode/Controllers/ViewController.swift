//
//  ViewController.swift
//  TableViewCode
//
//  Created by 김재영 on 2023/11/22.
//

import UIKit

class ViewController: UIViewController {

    var tableView = UITableView()
    var movieDataMangager = DataManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .white
        setNaviBar()
        setDatas()

        setTableView()
        setTableViewConstraints()
    }
    
    func setNaviBar(){
        
        title = "목록"
        
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = .white
        
        navigationController?.navigationBar.tintColor = .systemBlue
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.compactAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
    }
    
    func setTableView(){
        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = 120
        
        tableView.register(MyTableViewCell.self, forCellReuseIdentifier: "MovieCell")
    }
    
    
    func setDatas(){
        movieDataMangager.makeData()
    }
    
    func setTableViewConstraints(){
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0)
        ])
    }
}

extension ViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell", for: indexPath) as! MyTableViewCell
        let movieRow = movieDataMangager.getMovieData()[indexPath.row]
        
        cell.mainImgView.image = movieRow.movieImage
        cell.movieNameLabel.text = movieRow.movieName
        cell.descriptionLabel.text = movieRow.movieDescription
        cell.selectionStyle = .none
        
        return cell
        
    }
    
    func tableView(_ tableView : UITableView, numberOfRowsInSection section : Int) -> Int {
        return movieDataMangager.getMovieData().count
    }
}

extension ViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        let detailVC = DetailViewController()
        detailVC.movieData = movieDataMangager.getMovieData()[indexPath.row]
        navigationController?.pushViewController(detailVC, animated: true)
        
    }
}

