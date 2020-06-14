//
//  MoviesListViewController.swift
//  movies
//
//  Created by Shady Abdelaziz on 6/13/20.
//  Copyright © 2020 SWVL. All rights reserved.
//

import UIKit

class MoviesListViewController: UIViewController {

    var presenter: MoviesListPresenterProtocol?
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupSearchBar()
        self.presenter?.viewWillAppear()
    }
    
    private func setupSearchBar(){
        self.searchBar.searchTextField.backgroundColor = UIColor.white
        self.searchBar.delegate = self
    }

}

extension MoviesListViewController: MoviesListViewProtocol{
    func reload() {
        self.tableView.reloadData()
    }
}

extension MoviesListViewController: UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.presenter?.getMoviesCount(section: section) ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = self.tableView.dequeueReusableCell(withIdentifier: R.reuseIdentifier.movieTableViewCell.identifier, for: indexPath) as? MovieTableViewCell{
            cell.setupView(movie: self.presenter?.getMovie(section: indexPath.section, index: indexPath.row))
            return cell
        }
        return UITableViewCell()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.presenter?.getSectionsCount() ?? 0
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        guard let year = self.presenter?.getSection(index: section) else {
            return ""
        }
        return "\(year)"
    }
    
    
}

extension MoviesListViewController: UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //go to detail view when clicking on the movie cell
        self.presenter?.presentDetail(section: 0, index: indexPath.row)
    }
    
}

extension MoviesListViewController: UISearchBarDelegate{
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        self.presenter?.search(searchTxt: searchText)
    }
    
}
