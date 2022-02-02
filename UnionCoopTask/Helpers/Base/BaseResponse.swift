
import Foundation


class BaseResponse<T: Codable>: Codable {
    var success: Bool?
    var message: String?
    var statusCode: Int?
    var data: T?
    
}
