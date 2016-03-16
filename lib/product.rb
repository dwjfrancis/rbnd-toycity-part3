class Product
  attr_reader :title

  @@products = []

  def initialize(options={})
    @title = options[:title]
    add_to_products    
  end

  def self.all
    @@products
  end

  private

  def add_to_products
    index = 0
    it_is = true
    stop = @@products.length
    while(index < stop)
      test = @@products[index]
      if(test.title == @title)
        DuplicateProductError.display
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
