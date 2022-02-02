//
//  ViewController.swift
//  UnionCoopTask
//
//  Created by Mustafa Magdy on 1/3/22.
//

import UIKit
import RxCocoa
import RxSwift

class FirstViewController: UIViewController, UITableViewDelegate {
    
    @IBOutlet weak var searchButton: UIButton!
    @IBOutlet weak var tableView: UITableView!
    
    let firstViewModel = FirstViewModel()
    let disposeBag = DisposeBag()
    var refreshControl = UIRefreshControl()
    let tableViewCell = "TableViewCell"
    
    override func viewWillAppear(_ animated: Bool) {
        self.title = "StackOverFlowDemo"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        
        if !SearchViewController.isFiltered {
            getData()
        }
        bindToDataSource()
        refreshControl.attributedTitle = NSAttributedString(string: "Pull to refresh")
        refreshControl.addTarget(self, action: #selector(self.refresh(_:)), for: .valueChanged)
        tableView.addSubview(refreshControl) // not required when using UITableViewController
        subscribeToFilterButton()
    }
        
    @objc func refresh(_ sender: AnyObject) {
        // Code to refresh table view
        refreshControl.endRefreshing() // End Refreshing
    }
    
    
    func setupTableView() {
        tableView.register(UINib(nibName: tableViewCell, bundle: nil), forCellReuseIdentifier: tableViewCell)
    }
    
    func bindToDataSource() {
            firstViewModel.dataSource.bind(to: tableView.rx.items(cellIdentifier: tableViewCell, cellType: TableViewCell.self)) { row, data, cell in
                cell.textLabel?.text = data.title
                print("title: \(data.title)")
            }.disposed(by: disposeBag)
        print("dataSource is : \(firstViewModel.dataSource.value)")
    }

    func getData() {
        firstViewModel.getData()
    }
    
        func subscribeToFilterButton() {
            searchButton.rx.tap.subscribe { _ in
                let searchSB = UIStoryboard(name: "Search", bundle: nil)
                let searchVC = searchSB.instantiateViewController(identifier: "SearchViewController") as! SearchViewController
                searchVC.T = self.firstViewModel
                self.navigationController?.pushViewController(searchVC, animated: true)
            }.disposed(by: disposeBag)
    }
    
}
