class Customer
 
  attr_reader :name

  @@customers = []

  def initialize(options={})
    @name = options[:name]
    add_to_customers
  end
 
  def self.all
    return @@customers
  end 

  def self.find_by_name(name_in)
    index = 0
    while(index < @@customers.length)
      if(@@customers[index].name == name_in)
        return @@customers[index]
      else
        index += 1
      end
    end
  end

  private

  def add_to_customers
   index = 0
    it_is = true
    while(index < @@customers.length)
      if(@@customers[index].name == @name)
        begin
          raise DuplicateCustomerError.new(@name), " already exists (DuplicateCustomerError)."
        rescue DuplicateCustomerError => p
          puts p.object + p.message
        end
        index = @@customers.length
        it_is = false
      else
        index += 1
      end
    end
   if it_is
      @@customers << self
    end
  end

end

