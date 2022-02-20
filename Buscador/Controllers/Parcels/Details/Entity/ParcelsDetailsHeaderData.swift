//
//  ParcelsDetailsData.swift
//  Buscador
//
//  Created by Gustavo Cosme on 19/02/22.
//

struct ParcelsDetailsHeaderData {
    
    var title: String
    var data: String
    var type: String
}

extension ParcelsDetailsHeaderData {
    
    static func make(eventEntity: EventEntity?) -> ParcelsDetailsHeaderData {
        let objeto = eventEntity?.objetoUniq
    
        return .init(title: objeto?.codObjeto ?? "-",
                     data: objeto?.dtPrevista ?? "-",
                     type: objeto?.tipo ?? "-")
    }
}
