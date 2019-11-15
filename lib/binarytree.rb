class Node
  attr_accessor :payload, :left, :right

  def initialize(payload, left=nil, right=nil)
    @payload = payload
    @left = left
    @right = right
  end
end

class BTreeSort
  def sort(array)
    root = Node.new(array.shift)

    array.each do |value|
      push_node(root, value)
    end
    
    return traverse_tree(root)
  end

  def push_node(node, value)
    if value > node.payload
      if node.right
        push_node(node.right, value)
      else
        node.right = Node.new(value)
      end
    elsif value < node.payload
      if node.left
        push_node(node.left, value)
      else
        node.left = Node.new(value)
      end
    end
  end

  def traverse_tree(node, sorted_array=[])
    return sorted_array unless node

    traverse_tree(node.left, sorted_array) if node.left
    sorted_array.push(node.payload)
    traverse_tree(node.right, sorted_array) if node.right

    return sorted_array
  end
end