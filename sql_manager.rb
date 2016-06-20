require 'pry'
require 'sqlite3'


class Book
  attr_accessor :title, :page_count, :genre, :price
  attr_reader :id

  def self.create_table
    sql = <<-SQL
      CREATE TABLE IF NOT EXISTS books (
        id INTEGER PRIMARY KEY,
        title TEXT,
        page_count INTEGER,
        genre TEXT,
        price INTEGER
      )
    SQL

    db.execute(sql)
  end

  def initialize(attributes = {})
    @id = attributes[:id]
    @title = attributes[:title]
    @page_count = attributes[:page_count]
    @genre = attributes[:genre]
    @price = attributes[:price]
    @@db ||= SQLite3::Database.new "literature.db"
  end

  def self.db
    @@db
  end

  def self.all
    sql = <<-SQL
    SELECT * FROM books;
    SQL

    rows = db.execute(sql)
    rows.map do |row|
      self.book_from_row(row)
    end
  end

  def save
    # Your code here
    sql = <<-SQL
    INSERT INTO books(title, page_count, genre, price)
    VALUES(?,?,?,?);
    SQL
    db.execute(sql, self.title, self.page_count, self.genre, self.price)
  end

  def ==(other_object)
    self.id == other_object.id
  end


  def destroy
    #  Your code here
    sql = <<-SQL
    DELETE FROM books
    WHERE id = ?;
    SQL

    sql.execute(sql, self.id)
  end


  def self.find(id)
    # Your code here
    sql = <<-SQL
    SELECT * FROM books
    WHERE id = ?;
    SQL

    sql.execute(sql, id)
  end


  def self.book_from_row(row)
      Book.new(id: row[0], title: row[1], page_count: row[2], genre: row[3], price: row[4])
  end

  private

  def insert
    # Your code here
  end

  def update
    # Your code here
    sql = <<-SQL
    UPDATE TABLE books
    SET title = ?, page_count = ?, genre = ?, price = ?
    WHERE id = ?
    SQL

    db.execute(sql, self.title, self.page_count, self.genre, self.price, self.id)
  end
end


Pry.start
