
import Foundation

protocol TestAPIProtocol {
    func getAllData(completion: @escaping (Result<Response?, GFError>) -> Void)
    func getDataFiltered(completion: @escaping (Result<Response?, GFError>) -> Void)
    

}


class TestAPI: BaseAPI<TestNetworking>, TestAPIProtocol {
    
    static let shared: TestAPIProtocol = TestAPI()
    
    //MARK:- Requests
    
    func getAllData(completion: @escaping (Result<Response?, GFError>) -> Void) {
        self.fetchData(target: .getData, responseClass: Response.self) { (result) in
            completion(result)
        }
    }
    
    func getDataFiltered(completion: @escaping (Result<Response?, GFError>) -> Void) {
        self.fetchData(target: .getDataFiltered, responseClass: Response.self) { (result) in
            completion(result)
        }
    }
    


}
