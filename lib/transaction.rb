class Transaction

  attr_reader :product, :customer, :id

  @@transactions = []

  def initialize(customer, product)
    
    @product = product
    @customer = customer
    add_to_transactions

  end

  def self.all
    return @@transactions
  end

  def self.find(number_in)
    index = 0
    found = true
    while(index < @@transactions.length)
      if(@@transactions[index].id == number_in)
        return @@transactions[index]
      else
        index += 1
      end
    end
  end

  private

  def add_to_transactions
    id = @@transactions.length
    how_many = @product.stock
    if(how_many < 1)
      begin
        raise OutOfStockError.new(@product.title), " is out of stock."
      rescue OutOfStockError => p
        puts "OutOfStockError: " + p.object + p.message
      end
    else
      @id = id += 1
      @product.stock -= 1
      @@transactions << self
    end
  end

end
