require 'books_repository'

RSpec.describe BooksRepository do

  def reset_books_table
    seed_sql = File.read('spec/seeds_book_store.sql')
    connection = PG.connect({ host: '127.0.0.1', dbname: 'books_store_test' })
    connection.exec(seed_sql)
  end
  
  describe BooksRepository do
    before(:each) do 
      reset_books_table
    end

  end

  it "returns books from test book store" do

    repo = BooksRepository.new

    books = repo.all

    expect(books.length).to eq 2

    expect(books[0].id).to eq "1"
    expect(books[0].title).to eq 'A Song of Ice and Fire'
    expect(books[0].author_name).to eq 'George RR Martin'

    expect(books[1].id).to eq "2"
    expect(books[1].title).to eq 'Dance of Dragons'
    expect(books[1].author_name).to eq 'George RR Martin'
  end

end