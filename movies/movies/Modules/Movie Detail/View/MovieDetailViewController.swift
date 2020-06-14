//
//  MovieDetailViewController.swift
//  movies
//
//  Created by Shady Abdelaziz on 6/13/20.
//  Copyright © 2020 SWVL. All rights reserved.
//

import UIKit

class MovieDetailViewController: UIViewController {
    

    @IBOutlet weak var errorLabel: UILabel!
    
    @IBOutlet weak var errorView: UIView!
    
    @IBOutlet weak var scrollViewHeight: NSLayoutConstraint!
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var presenter: MovieDetailPresenterProtocol?
    
    @IBOutlet weak var movieTitleLabel: UILabel!
    
    @IBOutlet weak var movieCategoriesLabel: UILabel!
    
    @IBOutlet weak var movieActorsLabel: UILabel!
    
    @IBOutlet weak var movieDetailView: UIView!
    
    @IBOutlet weak var noMoviesView: UIView!
    
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    
    @IBOutlet weak var containerView: UIView!
    
    @IBOutlet weak var collectionViewHeight: NSLayoutConstraint!
    
    var photos: [String] = []
    
    @IBOutlet weak var stackView: UIStackView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.spinner.startAnimating()
        self.presenter?.viewWillAppear()
    }
    
    ///setup main view
    private func setupView(){
        self.setupCollectionView()
        self.errorView.isHidden = true
        
        guard let movie = self.presenter?.getMovie() else{
            self.noMoviesView.isHidden = false
            self.movieDetailView.isHidden = true
            return
        }
        self.movieTitleLabel.text = movie.title
        self.movieActorsLabel.text = movie.cast.joined(separator: ", ")
        self.movieCategoriesLabel.text = movie.genres.joined(separator: ", ")
        self.noMoviesView.isHidden = true
        self.movieDetailView.isHidden = false
    }
    
    ///setup collection view
    private func setupCollectionView(){
        let cellSize = CGSize(width:self.containerView.bounds.width/3 , height:self.containerView.bounds.width/3)
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.itemSize = cellSize
        layout.sectionInset = UIEdgeInsets(top: 1, left: 1, bottom: 1, right: 1)
        layout.minimumLineSpacing = 1.0
        layout.minimumInteritemSpacing = 1.0
        collectionView.setCollectionViewLayout(layout, animated: true)
    }

    ///handle pressing back
    @IBAction func backPressed(_ sender: UIButton) {
        self.presenter?.back()
    }
    
}

extension MovieDetailViewController: MovieDetailViewProtocol{
    ///loads photos from movie name
    func loadPhotosUrls(urls: [String]) {
        self.spinner.stopAnimating()
        self.photos = urls
        self.collectionView.reloadData()
        updateViewHeight()
    }
    
    ///update height of the view if content view height changes
    private func updateViewHeight(){
        self.collectionViewHeight.constant = collectionView.collectionViewLayout.collectionViewContentSize.height
        self.scrollViewHeight.constant = self.collectionViewHeight.constant + self.stackView.bounds.height + self.spacings
        self.view.layoutIfNeeded()
    }
    
    ///represent error if loading images failed
    func showError(error: String) {
        self.errorLabel.text = error
        self.errorView.isHidden = false
        self.spinner.stopAnimating()
    }
}

extension MovieDetailViewController: UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.photos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = self.collectionView.dequeueReusableCell(withReuseIdentifier: R.reuseIdentifier.movieDetailCollectionViewCell.identifier, for: indexPath) as? MovieDetailCollectionViewCell{
            cell.setupView(image: photos[indexPath.row])
            return cell
        }
        return UICollectionViewCell()
    }
    
}

extension MovieDetailViewController: UICollectionViewDelegate{}

extension MovieDetailViewController{
    var spacings: CGFloat{
        return 100
    }
}
