//
//  File.swift
//
//
//  Created by Robinson Cartagena on 3/02/23.
//

import Fluent
import Vapor
import PostgresNIO

final class Customer: Model, Content {
    static let schema = Customer.v20230203.schemaName
    
    @ID
    var id: UUID?
    
    @Field(key: Customer.v20230203.idcrm)
    var idcrm: UUID
  
    @Field(key: Customer.v20230203.ltipocliente)
    var ltipocliente: String
    
    @Field(key: Customer.v20230203.lmoneda)
    var lmoneda: String
    
    @Field(key: Customer.v20230203.lemailfacturar)
    var lemailfacturar: String
    
    @Field(key: Customer.v20230203.lsector)
    var lsector: String
  
  @Children(for: \.$customer)
  var notes: [Note]
    
    init() {}
    
    init(id: UUID? = nil,
         idcrm: UUID,
         ltipocliente: String,
         lmoneda: String,
         lemailfacturar: String,
         lsector: String) {
        self.idcrm = idcrm
        self.ltipocliente = ltipocliente
        self.lmoneda = lmoneda
        self.lemailfacturar = lemailfacturar
        self.lsector = lsector
    }
}

enum tipoCliente: String, Codable, CaseIterable {
    case Platino = "Platino"
    case Bronce = "Bronce"
    case Gold = "Gold"
}

enum moneda: String, Codable, CaseIterable {
  case COP = "COP"
  case USD = "USD"
  case EUR = "EUR"
}

enum sector: String, Codable, CaseIterable {
  case Agricultura = "Agricultura"
  case Ganadería  = "Ganaderia"
  case Pesca = "Pesca"
  case Explotación = "Explotación de los recursos forestales"
  case Minería = "Minería"
  case Producción = "Producción de automóviles"
  case ProducciónT = "Producción textil"
  case Industria = "Industria química"
  case Fabricación = "Fabricación"
  case Energía = "Energía"
  case Ingeniería = "Ingeniería"
  case Transporte = "Transporte"
  case Distribución = "Distribución"
  case Turismo = "Turismo"
  case Entretenimiento = "Entretenimiento"
  case Finanzas = "Finanzas"
  case Administraciones = "Administraciones Públicas"
  case Tecnología = "Tecnología de la información"
  case Investigación =  "Investigación científica"
  case Cultura = "Cultura"
  case Educación = "Educación"
  case Consultoría = "Consultoría"
}
  
    
