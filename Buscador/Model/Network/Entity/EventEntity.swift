//
//  EventEntity.swift
//  Buscador
//
//  Created by Gustavo Cosme on 30/12/21.
//

import Foundation

struct EventEntity: Identifiable, Codable {
    let id = UUID()
    var objetos: [EventItemEntity]?
    var objetoUniq: EventItemEntity? {
        return objetos?.first
    }
    var quantidade: Int?
    var resultado: String?
    var versao: String?
    var mensagem: String?
}

struct EventItemEntity: Identifiable, Codable {
    let id = UUID()
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
    var mensagem: String?
    var eventos: [EventEventsEntity]?
    var tipo: String? {
        return tipoPostal?.categoria
    }
    var tipoPostal: EventTypePostalEntity?
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
    let id = UUID()
    var codigo: String?
    var descricao: String?
    var dtHrCriado: String?
    var tipo: String?
    var urlIcone: String?
    var comentario: String?
    var unidade: EventUnitEntity?
    var unidadeDestino: EventUnitEntity?
    var destinatario: EventDestinationEntity?
}

struct EventDestinationEntity: Codable {
    var cep: String?
}
