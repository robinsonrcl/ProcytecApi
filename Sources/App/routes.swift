import Fluent
import Vapor

func routes(_ app: Application) throws {
    
  let customerController = CustomerController()
  let noteController = NoteController()
    
  try app.register(collection: customerController)
  try app.register(collection: noteController)
    
}
