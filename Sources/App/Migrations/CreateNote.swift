//
//  File.swift
//  
//
//  Created by Robinson Cartagena on 6/03/23.
//

import Fluent

struct CreateNote: AsyncMigration {
    func prepare(on database: Database) async throws -> Void {
      
        try await database.schema(Note.v20230306.schemaName)
            .id()
            .field(Note.v20230306.note, .string, .required)
            .field(Note.v20230306.date, .date, .required)
            .field(Note.v20230306.userid, .uuid, .required)
            .field(Note.v20230306.customerID, .uuid, .references("customers","id"))
            .create()
    }
    
    func revert(on database: Database) async throws -> Void {
      try await database.schema(Note.v20230306.schemaName).delete()
    }
}

extension Note {
    enum v20230306 {
      static let schemaName = "notes"
        
      static let id = FieldKey(stringLiteral: "id")
      static let note = FieldKey(stringLiteral: "note")
      static let date = FieldKey(stringLiteral: "date")
      static let userid = FieldKey(stringLiteral: "userid")
      static let customerID = FieldKey(stringLiteral: "customerID")
    }
}
