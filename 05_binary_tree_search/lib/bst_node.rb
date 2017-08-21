class BSTNode
  attr_accessor :root, :left, :right, :parent, :value

  def initialize(value)
    @value = value 
    @left = nil 
    @right = nil 
    @parent = nil
  end
end
