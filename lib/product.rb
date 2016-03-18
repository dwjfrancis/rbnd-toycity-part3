class Product

  attr_reader :title, :price
  attr_accessor :stock

  @@products = []

  def initialize(options={})
    @title = options[:title]
    @price = options[:price]
    @stock = options[:stock]
    add_to_products    
  end

  def self.all
    @@products
  end

  def self.find_by_title(title_in)
    index = 0
    stop = @@products.length
    while(index < stop)
      if(@@products[index].title == title_in)
        return @@products[index]
      else
        index += 1
      end
    end
  end

  def in_stock?
    if(@stock > 0)
      return true
    else
      return false
    end
  end

  def self.in_stock
    is_there = []
    index = 0
    while(index < @@products.length)
      if(@@products[index].in_stock?)
        is_there << @@products[index]
      end
      index += 1
    end
    return is_there
  end

  private

  def add_to_products
    index = 0
    it_is = true
    stop = @@products.length
    while(index < stop)
      test = @@products[index]
      if(test.title == @title)
        begin
          raise DuplicateProductError.new(@title), " already exists."
        rescue DuplicateProductError => p
          puts "DuplicateProductError: " + p.object + p.message
        end
        index = stop
        it_is = false
      else
        index += 1
      end
    end
   if it_is
      @@products << self
    end
  end


end
