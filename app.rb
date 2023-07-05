class App
  def initialize(main)
    @main = main
  end

  def list_books
    puts 'Listing all the books'
    @main.display_menu
  end
end
