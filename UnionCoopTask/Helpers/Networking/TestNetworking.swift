
import Foundation
import Alamofire

enum TestNetworking {
    case getData
    case getDataFiltered
}

extension TestNetworking: TargetType {
    var baseURL: String {
        switch self {
        default:
            return "https://api.stackexchange.com/2.2/questions/no-answers?"
        }
    }
    
    var path: String {
        switch self {
        case .getData:
            return "min=3&tagged=swift&fromdate=1601617341&todate=1604209341&order=asc&sort=votes&site=stackoverflow"
        case .getDataFiltered:
            return "min=\(SearchViewModel.firstTextFieldBehavior.value )&tagged=\(SearchViewModel.secondTextFieldBehavior.value )&fromdate=1601617341&todate=1604209341&order=asc&sort=votes&site=stackoverflow"
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .getData, .getDataFiltered:
            return .get
        }
    }
    
    var task: Task {
        switch self {
        case .getData, .getDataFiltered:
            return .requestPlain
        }
    }
    
    var headers: [String : String]? {
        switch self {
        default:
            return ["Username": "stackexchange", "Password": "admin@123456", "Content-Type": "application/json", "Lang": "en", "DeviceType" : "IOS"]
        }
    }
}




//Now you able to get the response?
// of the task you mean ?
//API response.... aha yes i have finished fetching data now don't know if there's time to filter it
