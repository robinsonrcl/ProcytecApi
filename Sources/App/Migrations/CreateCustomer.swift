//
//  File.swift
//
//
//  Created by Robinson Cartagena on 3/02/23.
//

import Fluent

struct CreateCustomer: AsyncMigration {
    func prepare(on database: Database) async throws -> Void {
      
        try await database.schema(Customer.v20230203.schemaName)
            .id()
            .field(Customer.v20230203.idcrm, .uuid, .required)
            .field(Customer.v20230203.ltipocliente, .string, .required)
            .field(Customer.v20230203.lmoneda, .string, .required)
            .field(Customer.v20230203.lemailfacturar, .string)
            .field(Customer.v20230203.lsector, .string)
            .create()
    }
    
    func revert(on database: Database) async throws -> Void {
      try await database.schema(Customer.v20230203.schemaName).delete()
    }
}

extension Customer {
    enum v20230203 {
      static let schemaName = "customers"
        
      static let id = FieldKey(stringLiteral: "id")
      static let idcrm = FieldKey(stringLiteral: "idcrm")
      static let ltipocliente = FieldKey(stringLiteral: "ltipocliente")
      static let lmoneda = FieldKey(stringLiteral: "lmoneda")
      static let lemailfacturar = FieldKey(stringLiteral: "lemailfacturar")
      static let lsector = FieldKey(stringLiteral: "lsector")
      static let lplagopago = FieldKey(stringLiteral: "lplazopago")

    }
}
