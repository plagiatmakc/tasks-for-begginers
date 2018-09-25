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

  def remove(data, current_node = nil)
    return puts("Tree is empty") if @root_node.data.nil?
     current_node.nil? ? current_node = @root_node : current_node = current_node
    if data > current_node.data
      remove(data, current_node.right)
    elsif data < current_node.data
      remove(data, current_node.left)
    elsif data == current_node.data
     parent = parent_node(data)
     parent.left = nil if parent.left && parent.left == ObjectSpace._id2ref(current_node.object_id)
     parent.right = nil if parent.right && parent.right == ObjectSpace._id2ref(current_node.object_id)
     current_node.data = nil

      # THIS IS A TRULY ALGORITM FOR REMOVE BSTree NODES (https://ru.wikipedia.org/wiki/Двоичное_дерево_поиска)
      # parent = parent_node(data)
      # if current_node.left.nil? && current_node.right.nil?
      #   parent.left = nil if parent.left &&  parent.left.data == data
      #   parent.right = nil if parent.right &&  parent.right.data == data
      #   current_node.data = nil
      # elsif current_node.left.nil? && !current_node.right.nil?
      #   parent.left = current_node.right if  parent.left &&  parent.left.data == data
      #   parent.right = current_node.right if parent.right &&  parent.right.data == data
      #   current_node.data = nil
      # elsif !current_node.left.nil? && current_node.right.nil?
      #   parent.left = current_node.left if parent.left && parent.left.data == data
      #   parent.right = current_node.left if parent.right && parent.right.data == data
      #   current_node.data = nil
      # elsif !current_node.left.nil? && !current_node.right.nil?
      #   if current_node.right.left.nil?
      #     current_node.right.left = current_node.left
      #     current_node.left = nil
      #     remove(data)
      #   else
      #     tmp = current_node.right.left
      #     while tmp.left
      #       tmp = tmp.left
      #     end
      #     tmp.left = current_node.left
      #     current_node.left = nil
      #     remove(data)
      #   end
      # end

    end
  end

  def parent_node(data, current_node = nil)
    return puts("Tree is empty") if @root_node.data.nil?
    current_node.nil? ? current_node = @root_node : current_node = current_node
        if current_node.left && current_node.left.data == data
          return current_node
        elsif  current_node.right && current_node.right.data == data
          return current_node
        elsif data < current_node.data
          parent_node(data, current_node.left)
        elsif data > current_node.data
          parent_node(data, current_node.right)
        end
  end
end
test_array = [100, 200, 50, 150, 10, 80, 180, 160, 70, 65, 75, 90, 95, 5, 250, 185]
n = BSTree.new()
test_array.each { |item| n.insert(item)}
p n
p n.find(50)
obj = n.find(70).object_id
n.remove(80)
p n.find(50)
# p n.find(100).object_id
p ObjectSpace._id2ref obj


