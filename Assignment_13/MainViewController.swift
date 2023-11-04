//
//  MainViewController.swift
//  Assignment_13
//
//  Created by Macbook Air 13 on 30.10.23.
//

import UIKit

final class MainViewController: UIViewController {
    
    // MARK: - Properties
    private let songsTableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        return tableView
    }()
    
    private var songs = Song.dummyData

    // MARK: - ViewLifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupBackground()
        setupSubviews()
        setupTableViewConstraints()
        setupTableView()
    }

    // MARK: - Private Methods
    private func setupBackground() {
        view.backgroundColor = .white
    }
    
    private func setupSubviews() {
        view.addSubview(songsTableView)
    }
    
    private func setupTableViewConstraints() {
        NSLayoutConstraint.activate([
            songsTableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 50),
            songsTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            songsTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            songsTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -15)
        ])
    }
    
    private func setupTableView() {
        songsTableView.dataSource = self
        songsTableView.register(CustomTableViewCell.self, forCellReuseIdentifier: "song")
    }
}

// MARK: - TableView DataSource
extension MainViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        songs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = songsTableView.dequeueReusableCell(withIdentifier: "song", for: indexPath)
        let song = songs[indexPath.row]
        
        if let songCell = cell as? CustomTableViewCell {
            songCell.configure(with: song)
        }
        
        return cell
    }
}

// MARK: - TableView Delegate
extension MainViewController: UITableViewDelegate {
    
}
