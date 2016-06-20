# Connecting SQL to Ruby

## Objective:
+ Understand how Ruby can use SQL to access data.

So far, we've written Ruby methods that can create, edit, update and destroy classes and instances. We've also seen how we can persist data in a SQLite database and write SQL queries to access that data. But, how would we give a Ruby program access to this data? We need to understand how we can give Ruby access to the

## Instructions:

Please work with a partner to fill in the methods outlined in sql_manager.rb. Our goal is to write methods that will query our database so that our program can use the following methods to return our data:

+ Book.all (written for you)
+ Book.find(1)
+ book = Book.new
+ book.title = 'huck finn'
+ book.page_count = 300
+ book.insert
+ book.destroy
+ book.update
