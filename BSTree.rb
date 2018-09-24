class Node
  attr_accessor :data, :left, :right

  def initialize(data = nil)
    @data = data
    @left = nil
    @right = nil
  end
end

class BSTree
  attr_accessor :root_node

  def initialize(root_value=nil)
    @root_node = Node.new(root_value)
  end

  def find(search_data, current_node = @root_node)
    if @root_node.data.nil?
      puts("Tree is empty")
    elsif search_data == current_node.data
      return current_node
    elsif search_data < current_node.data
      find(search_data, current_node.left)
    elsif search_data > current_node.data
      find(search_data, current_node.right)
    end

  end

  def insert(data, current_node=nil)
    @root_node.data = data if @root_node.data.nil?
    current_node.nil? ? current_node = @root_node : current_node = current_node
    if data < current_node.data && current_node.left.nil?
      current_node.left = Node.new(data)
    elsif data > current_node.data && current_node.right.nil?
      current_node.right = Node.new(data)
    elsif data < current_node.data
      insert(data, current_node.left)
    elsif data > current_node.data
      insert(data, current_node.right)
    end


  end

  def remove(data)

  end
end

n = BSTree.new()
n.insert(100)
n.insert(200)
n.insert(50)
n.insert(150)
n.insert(10)
n.insert(80)
n.insert(180)
p n
p n.find(50).left
n.remove(10)
p n