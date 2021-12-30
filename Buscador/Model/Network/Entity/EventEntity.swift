//
//  EventEntity.swift
//  Buscador
//
//  Created by Gustavo Cosme on 30/12/21.
//

import Foundation

struct EventEntity: Identifiable, Codable {
    var id: Int
    var objetos: [EventItemEntity]?
    var quantidade: Int?
    var resultado: String?
    var versao: String?
    var mensagem: String?
}

struct EventItemEntity: Identifiable, Codable {
    var id: Int
    var codObjeto: String?
    var dtPrevista: String?
    var modalidade: String?
    var habilitaAutoDeclaracao: Bool?
    var permiteEncargoImportacao: Bool?
    var habilitaPercorridaCarteiro: Bool?
    var bloqueioObjeto: Bool?
    var possuiLocker: Bool?
    var habilitaLocker: Bool?
    var habilitaCrowdshipping: Bool?
    var eventos: [EventEventsEntity]?
    var tipoPostal: EventTypePostalEntity?
    var unidade: EventUnitEntity?
}


struct EventUnitEntity: Codable {
    var endereco: EventUnitAdressEntity?
    var tipo: String?
}

struct EventUnitAdressEntity: Codable {
    var cidade: String?
    var uf: String?
}

struct EventTypePostalEntity: Codable {
    var categoria: String?
    var descricao: String?
    var sigla: String?
}

struct EventEventsEntity: Identifiable, Codable {
    var id: Int
    var codigo: String?
    var descricao: String?
    var dtHrCriado: String?
    var tipo: String?
    var urlIcone: String?
}