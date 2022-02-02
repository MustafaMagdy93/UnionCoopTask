//
//  SerachViewController.swift
//  UnionCoopTask
//
//  Created by Mustafa Magdy on 1/3/22.
//

import UIKit
import RxSwift
import RxCocoa


class SearchViewController: UIViewController {

    @IBOutlet weak var applyButton: UIButton!
    @IBOutlet weak var secondTextField: UITextField!
    @IBOutlet weak var firstTextField: UITextField!
    
    var T: FirstViewModel! {
        didSet {
            searchViewModel = SearchViewModel()
            searchViewModel.delegate = T
        }
    }
    let disposeBag = DisposeBag()
    var searchViewModel: SearchViewModel!
    static var isFiltered = false
    override func viewWillAppear(_ animated: Bool) {
        self.title = "Filter"
        navigationController?.navigationBar.topItem?.title = ""
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        bindTextFieldsToViewModel()
        subscribeToApplyButton()
    }
        
    func bindTextFieldsToViewModel() {
        firstTextField.rx.text.orEmpty.bind(to: SearchViewModel.firstTextFieldBehavior).disposed(by: disposeBag)
        secondTextField.rx.text.orEmpty.bind(to: SearchViewModel.secondTextFieldBehavior).disposed(by: disposeBag)
    }
    
    func getDataFiltered() {
        searchViewModel.getDataFiltered()
    }
    
    func subscribeToApplyButton() {
        applyButton.rx.tap.subscribe { _ in
            self.getDataFiltered()
            SearchViewController.isFiltered = true
            self.navigationController?.popViewController(animated: true)
            }.disposed(by: disposeBag)
        }
    
}
