# Class of simple node of binary search tree
class Node
  attr_accessor :data, :left, :right

  def initialize(data = nil)
    @data = data
    @left = nil
    @right = nil
  end
end
# Binary search tree
class BSTree
  attr_accessor :root_node

  def initialize(root_value = nil)
    @root_node = Node.new(root_value)
  end

  def find(search_data, current_node = @root_node)
    return puts('Tree is empty') if @root_node.data.nil?

    if search_data == current_node.data
      current_node
    elsif  current_node.left && search_data < current_node.data
      find(search_data, current_node.left)
    elsif  current_node.right && search_data > current_node.data
      find(search_data, current_node.right)
    else
      p 'Sorry, but that node not exist!'
      nil
    end
  end

  def insert(data, current_node = nil)
    @root_node.data = data if @root_node.data.nil?
    current_node = @root_node if current_node.nil?
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

  # Remove children with removing node
  def remove_forced(data, _current_node = nil)
    current_node = find(data)
    parent = parent_node(data)
    parent.left = nil if parent.left && parent.left == ObjectSpace._id2ref(current_node.object_id)
    parent.right = nil if parent.right && parent.right == ObjectSpace._id2ref(current_node.object_id)
  end

  # Save children from remove node
  def remove_save_children(data, _current_node = nil)
    current_node = find(data)
    parent = parent_node(data)
    if current_node.left.nil? && current_node.right.nil?
      parent.left = nil if parent.left && parent.left.data == data
      parent.right = nil if parent.right && parent.right.data == data
      current_node.data = nil
    elsif current_node.left.nil? && current_node.right
      parent.left = current_node.right if  parent.left && parent.left.data == data
      parent.right = current_node.right if parent.right && parent.right.data == data
      current_node.data = nil
    elsif current_node.left && current_node.right.nil?
      parent.left = current_node.left if parent.left && parent.left.data == data
      parent.right = current_node.left if parent.right && parent.right.data == data
      current_node.data = nil
    elsif current_node.left && current_node.right
      if current_node.right.left.nil?
        current_node.right.left = current_node.left
        current_node.left = nil
        remove_save_children(data)
      else
        tmp = current_node.right.left
        tmp = tmp.left while tmp.left
        tmp.left = current_node.left
        current_node.left = nil
        remove_save_children(data)
      end
    end
  end

  def parent_node(data, current_node = nil)
    return puts('Tree is empty') if @root_node.data.nil?

    current_node = @root_node if current_node.nil?
    return current_node if current_node.left && current_node.left.data == data
    return current_node if current_node.right && current_node.right.data == data

    if data < current_node.data
      parent_node(data, current_node.left)
    elsif data > current_node.data
      parent_node(data, current_node.right)
    end
  end
end
# Tests
test_array = [100, 200, 50, 150, 10, 80, 180, 160, 70, 65, 75, 90, 95, 5, 250, 185]
n = BSTree.new
test_array.each { |item| n.insert(item) }
pp n
p n.find(150)
obj = n.find(180).object_id
n.remove_forced(150)
p n.find(200)
p n.find(100).object_id
p ObjectSpace._id2ref obj
p n.find(200)
p n.find(180).object_id
p nil.object_id
pp n.parent_node(180)
