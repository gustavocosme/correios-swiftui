//
//  ParcelService.swift
//  Buscador
//
//  Created by Gustavo Cosme on 30/12/21.
//

import Foundation
import Combine
import Alamofire


protocol ParcelServiceProtocol {
    func fetch(code: String) -> AnyPublisher<DataResponse<EventEntity, NetworkErrorEntity>, Never>
}

class ParcelService {
    static let shared: ParcelServiceProtocol = ParcelService()
    private let server = "https://proxyapp.correios.com.br/v1/sro-rastro/"
    private init() { }
}

extension ParcelService: ParcelServiceProtocol {
    
    func fetch(code: String) -> AnyPublisher<DataResponse<EventEntity, NetworkErrorEntity>, Never> {
        let url = URL(string: "\(server)\(code)")!
        return AF.request(url, method: .get)
                 .publishDecodable(type: EventEntity.self)
                 .map { response in
                    response.mapError { error in
                        let backendError = response.data.flatMap { try? JSONDecoder().decode(BackendErrorEntity.self, from: $0)}
                        return NetworkErrorEntity(initialError: error, backendError: backendError)
                    }
                 }
                 .receive(on: DispatchQueue.main)
                 .eraseToAnyPublisher()
    }
}
