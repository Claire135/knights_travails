# defines a search algorhythm to find the quickest route
# saves the path used.  

module BreadthFirstSearch
  def bfs(start_node, end_node)
    return [] if start_node.nil? || end_node.nil?

    discovered_nodes = [start_node] 
    visited_nodes = Set.new([start_node])
    parent = { start_node => nil } # Hash to store parent nodes to trace the route the node took

    until discovered_nodes.empty?
      current_node = discovered_nodes.shift

      return reconstruct_path(parent, end_node) if current_node == end_node

      current_node.connections.each do |neighbor|
        unless visited_nodes.include?(neighbor)
          visited_nodes.add(neighbor)
          parent[neighbor] = current_node
          discovered_nodes << neighbor
        end
      end
    end
    nil  # Return nil if no path is found
  end


    private
    def reconstruct_path(parent, end_node)
        path = []
        current_node = end_node
        
        while current_node
            path.unshift(current_node)
            current_node = parent[current_node]
        end
        path
    end
end
    


