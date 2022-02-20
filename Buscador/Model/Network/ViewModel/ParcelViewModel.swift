//
//  ParcelViewModel.swift
//  Buscador
//
//  Created by Gustavo Cosme on 31/12/21.
//

import Foundation
import Combine

protocol ParcelViewModelDelegate {
    func didCompletion(_ parcel: EventEntity?)
}

class ParcelViewModel: ObservableObject {
    
    @Published var parcel: EventEntity?
    @Published var error: String = ""

    private var cancellableSet: Set<AnyCancellable> = []
    private var dataManager: ParcelServiceProtocol
    
    init(dataManager: ParcelServiceProtocol = ParcelService.shared) {
        self.dataManager = dataManager
    }
    
    func getParcel(code: String, delegate: ParcelViewModelDelegate?) {
        self.dataManager.fetch(code: code)
            .sink { (dataResponse) in
                if let error = dataResponse.error {
                    let message = error.backendError?.message ?? "Ops, Houve uma falha tente novamente."
                    self.error = message
                    delegate?.didCompletion(nil)
                } else {
                    if let parcel = dataResponse.value {
                        if let error = self.getError(parcel: parcel) {
                            self.error = error
                            delegate?.didCompletion(nil)
                        } else{
                            self.parcel = parcel
                            delegate?.didCompletion(self.parcel)
                        }
                    } else {
                        delegate?.didCompletion(nil)
                    }
                }
            }.store(in: &cancellableSet)
    }
    
    private func getError(parcel: EventEntity) -> String? {
        guard let mensagem = parcel.objetoUniq?.mensagem else {
            return nil
        }
        return mensagem
    }
    
    func reset() {
        self.parcel = nil
        self.error = ""
    }
}


