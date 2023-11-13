//
//  MainViewController.swift
//  Assignment_13
//
//  Created by Macbook Air 13 on 30.10.23.
//

import UIKit

final class MainViewController: UIViewController {
    
    // MARK: - Properties
    private let searchBar: UISearchBar = {
        let search = UISearchBar()
        search.translatesAutoresizingMaskIntoConstraints = false
        
        return search
    }()
    
    private let songsTableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        return tableView
    }()
    
    private var songs = Song.dummyData
    private var searchResultSongs = [Song]()
    var searching = false
    
    
    // MARK: - ViewLifeCycles
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    
    // MARK: - Private Methods
    private func setupUI() {
        view.backgroundColor = .white
        setupNavigationBar()
        setupSearchBar()
        setupTableView()
    }
    
    private func setupNavigationBar() {
        setupBarTitle()
        setupAddSongBarButton()
    }
    
    private func setupBarTitle() {
        self.navigationItem.title = "Songs"
    }
    
    private func setupAddSongBarButton() {
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(
            image: UIImage(systemName: "plus"),
            style: .plain,
            target: self,
            action: #selector(didTapButton)
        )
    }
    
    @objc func didTapButton() {
        let addSongPage = AddNewItemToListViewController()
        self.navigationController?.pushViewController(addSongPage, animated: true)
        addSongPage.delegate = self
    }
    
    private func setupSearchBar() {
        view.addSubview(searchBar)
        setSearchBarConstraints()
        searchBar.delegate = self
    }
    
    private func setupTableView() {
        view.addSubview(songsTableView)
        setTableViewConstraints()
        configureTableView()
        registerCell()
    }
    
    private func configureTableView() {
        songsTableView.dataSource = self
        songsTableView.delegate = self
    }
    
    private func registerCell() {
        songsTableView.register(CustomTableViewCell.self, forCellReuseIdentifier: "SongCell")
    }
    
    
    // MARK: - Constraints
    private func setSearchBarConstraints() {
        NSLayoutConstraint.activate([
            searchBar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            searchBar.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            searchBar.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
    
    private func setTableViewConstraints() {
        NSLayoutConstraint.activate([
            songsTableView.topAnchor.constraint(equalTo: searchBar.bottomAnchor, constant: 10),
            songsTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            songsTableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            songsTableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
        ])
    }
}


// MARK: - SearchBar Delegate
extension MainViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        searchResultSongs = songs.filter( { $0.name.lowercased().prefix(searchText.count) == searchText.lowercased() } )
        searching = true
        songsTableView.reloadData()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searching = false
        searchBar.text = ""
        songsTableView.reloadData()
    }
}


// MARK: - TableView DataSource
extension MainViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if searching {
            return searchResultSongs.count
        } else {
            return songs.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = songsTableView.dequeueReusableCell(withIdentifier: "SongCell", for: indexPath)
        
        if searching {
            let song = searchResultSongs[indexPath.row]
            if let songCell = cell as? CustomTableViewCell {
                songCell.configure(song: song)
            }
        } else {
            let song = songs[indexPath.row]
            if let songCell = cell as? CustomTableViewCell {
                songCell.configure(song: song)
            }
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let delete = UIContextualAction(style: .normal, title: "Delete") { action, view, handler in
            self.songs.remove(at: indexPath.row)
            self.songsTableView.reloadData()
        }
        delete.image = UIImage(systemName: "trash")
        delete.backgroundColor = .red
        
        let swipeAction = UISwipeActionsConfiguration(actions: [delete])
        return swipeAction
    }
}

// MARK: - TableView Delegate
extension MainViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let songSelected = songs[indexPath.row]
        let itemDetailsView = ItemDetailsViewController()
        self.navigationController?.pushViewController(itemDetailsView, animated: true)
        itemDetailsView.configure(song: songSelected)
    }
}


// MARK: - Delegate Protocol
protocol Delegate {
    func addNewSong(song: Song)
}

extension MainViewController: Delegate {
    func addNewSong(song: Song) {
        self.songs.append(song)
        self.songsTableView.reloadData()
    }
}
