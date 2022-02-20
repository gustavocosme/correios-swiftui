//
//  ParcelCellData.swift
//  Buscador
//
//  Created by Gustavo Cosme on 20/02/22.
//

struct ParcelCellData {
    var title: String
    var code: String
}

extension ParcelCellData {
    
    static func make(parcelEntity: ParcelEntity) -> ParcelCellData {
        return .init(title: parcelEntity.title ?? "",
                     code: parcelEntity.code ?? "")
    }
    
    static func make() -> ParcelCellData {
        return .init(title: "Test",
                     code: "Test")
    }
}
