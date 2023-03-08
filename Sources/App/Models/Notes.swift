//
//  File.swift
//  
//
//  Created by Robinson Cartagena on 6/03/23.
//

import Fluent
import Vapor
import PostgresNIO

final class Note: Model, Content {
  static let schema = Note.v20230306.schemaName
  
  @ID
  var id: UUID?
  
  @Field(key: Note.v20230306.note)
  var note: String

  @Field(key: Note.v20230306.date)
  var date: Date
  
  @Field(key: Note.v20230306.userid)
  var userid: UUID?
  
  @OptionalParent(key: Note.v20230306.customerID)
  var customer: Customer?
    
    init() {}
    
    init(id: UUID? = nil,
         note: String,
         date: Date = Date(),
         userid: UUID?,
         customerID: Customer.IDValue) {
      self.id = id
      self.note = note
      self.date = date
      self.userid = userid
      self.$customer.id = customerID
    }
}

  
    

