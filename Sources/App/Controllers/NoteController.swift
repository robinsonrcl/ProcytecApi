//
//  File.swift
//  
//
//  Created by Robinson Cartagena on 7/03/23.
//

import Vapor
import Fluent
import FluentPostgresDriver
import Foundation

struct NoteController: RouteCollection {
  func boot(routes: RoutesBuilder) throws {
    
    let notesGroup = routes.grouped("notes")
    
    notesGroup.get("get", "customer",":customerID", use: getAllNotesCustomer)
    notesGroup.get(":id", use: getNote)
    notesGroup.post(use: createNote)
    notesGroup.post("update", use: updateNote)
    
  }
  
  func updateNote(_ req: Request) async throws -> HTTPStatus {
    let noteNew = try req.content.decode(NoteEspejo.self)
    
    let note = try await Note.find(UUID(noteNew.id)!, on: req.db)!
    
    note.note = noteNew.note
    
    try await note.save(on: req.db)
    
    return HTTPStatus.ok
  }
  
  func getAllNotesCustomer(_ req: Request) async throws -> [Note] {
    let customerID = req.parameters.get("customerID", as: UUID.self)!
    let result = try await Note.query(on: req.db).with(\.$customer).filter(\.$customer.$id == customerID).all()
    
    return result
  }
  
  func getNote(_ req: Request) async throws -> Note {
    let noteID = req.parameters.get("id", as: UUID.self)!
    let note = try await Note.find(noteID, on: req.db)!
    return note
  }
  
  func createNote(_ req: Request) async throws -> Note {
    let newNote = try req.content.decode(NoteEspejo.self)
    
    let note = Note(
                  note: newNote.note,
                  userid: UUID(newNote.userid)!,
                  customerID: UUID(newNote.customer)!
                )
    
    _ = try await note.save(on: req.db)
    
    return note
  }
}

struct NoteEspejo: Content {
  var id: String
  var note: String
  var userid: String
  var customer: String
}
