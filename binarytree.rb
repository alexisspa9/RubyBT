class Node
	attr_accessor :parent, :value, :left, :right	
	def initialize(value, parent=nil)
		@value = value
		@left = nil
		@right = nil
		@parent = parent
	end
end

class BinaryTree
	def initialize
		@root = nil		
	end
	def show_root
		@root
	end

	def build_tree(data)
		data.each do |item|
			if @root.nil?
				@root = Node.new(item)
			else
				place_node(@root, item)
			end
		end
	end

	def place_node(node, item)
		if item >= node.value
			if node.right
				place_node(node.right, item)
			else
				node.right = Node.new(item, node)
			end
		else
			if node.left
				place_node(node.left, item)
			else
				node.left = Node.new(item, node)
			end
		end	
	end

	def breadth_first_search(value)
		@root = Node.new(0) if @root.nil?
		queue = [@root]
		until queue.empty?
			current_node = queue.shift
			return current_node if current_node.value == value
			queue << current_node.left unless current_node.left.nil?
			queue << current_node.right unless current_node.right.nil?
		end
		puts "nothing found"
		return nil
	end

	def depth_first_search(value)
		@root = Node.new(0) if @root.nil?
	    stack = [@root]
	    until stack.empty?
	      current_node = stack.shift
	      return puts "located #{current_node.value}" if current_node.value == value
	        stack.unshift(current_node.left) unless current_node.left.nil?
	        stack.unshift(current_node.right) unless current_node.right.nil?
	    end
	    nil
		
	end
	  
	def dfs_rec(target, current_node = @root)
	    return if @root.nil?
	    return puts "located #{current_node.value}" if current_node.value == target
	    dfs_rec(target, current_node.left) unless current_node.left.nil?
	    dfs_rec(target, current_node.right) unless current_node.right.nil?
	end
end

tree = BinaryTree.new
tree.build_tree([1, 7, 4, 23, 8, 9, 4, 3, 5, 7, 9, 67, 6345, 324])
puts tree.show_root.value
puts tree.show_root.right.value
puts tree.show_root.right.right.parent.value
puts tree.breadth_first_search(9).value



