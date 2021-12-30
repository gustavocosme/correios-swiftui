//
//  BackendError.swift
//  Buscador
//
//  Created by Gustavo Cosme on 30/12/21.
//

import Foundation
import Alamofire

struct BackendErrorEntity: Codable, Error {
    var status: String
    var message: String
}
