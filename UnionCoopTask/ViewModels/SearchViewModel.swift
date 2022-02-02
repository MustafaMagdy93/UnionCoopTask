//
//  SearchViewModel.swift
//  UnionCoopTask
//
//  Created by Mustafa Magdy on 1/3/22.
//

import Foundation
import RxSwift
import RxCocoa
import Alamofire

protocol TransferDelegete: AnyObject {
    func transferData(array: [Item])
}

class SearchViewModel {
    static var firstTextFieldBehavior = BehaviorRelay<String>(value: "")
    static var secondTextFieldBehavior = BehaviorRelay<String>(value: "")
    var dataSource = BehaviorRelay(value: [Item]())
    var delegate: TransferDelegete?

    
    func getDataFiltered() {
        Hud.show()
        TestAPI.shared.getDataFiltered { result in
            Hud.dismiss()
            
            switch result {
            case .success(let response):
                self.dataSource.accept(response?.items ?? [])
                self.delegate?.transferData(array: response?.items ?? [])

            case .failure(let error):
                print(error.rawValue)

            }
            
        }
    }
}
