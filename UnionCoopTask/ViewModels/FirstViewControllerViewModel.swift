
import Foundation
import RxSwift
import RxCocoa
import Alamofire

class FirstViewModel {
    
    var dataSource = BehaviorRelay(value: [Item]())

    func getData() {
        Hud.show()
        TestAPI.shared.getAllData { result in
            Hud.dismiss()
            switch result {
            case .success(let response):
                self.dataSource.accept(response?.items ?? [])
            case .failure(let error):
                print(error.rawValue)
            }
            
        }
    }
}

extension FirstViewModel: TransferDelegete {
    func transferData(array: [Item]) {
        print("array is : \(array)")
        dataSource.accept(array)
    }
}
