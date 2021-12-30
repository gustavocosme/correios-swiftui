//
//  NetworkError.swift
//  Buscador
//
//  Created by Gustavo Cosme on 30/12/21.
//

import Alamofire

struct NetworkErrorEntity: Error {
  let initialError: AFError
  let backendError: BackendErrorEntity?
}
