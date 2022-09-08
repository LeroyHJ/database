require_relative 'lib/database_connection'
require_relative 'lib/book_store_repository'

DatabaseConnection.connect('')

result = DatabaseConnection.exec_params('SELECT * FROM book_store;', [])

result.each do |book|
  p book
end