class DuplicateProductError < StandardError
  
  attr_reader :object

  def initialize(object) 
    @object = object
  end

end

class DuplicateCustomerError < StandardError

  attr_reader :object

  def initialize(object)
    @object = object
  end

end
