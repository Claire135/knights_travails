# frozen_string_literal: true

# defines a search algorhythm to find the quickest route
# saves the path used.

module BreadthFirstSearch
  def bfs(start_node, end_node)
    return [] if start_node.nil? || end_node.nil?

    parent = perform_bfs(start_node, end_node)
    return nil unless parent

    reconstruct_path(parent, end_node)
  end

  private

  def perform_bfs(start_node, end_node)
    discovered_nodes = [start_node]
    visited_nodes = Set.new([start_node])
    parent = { start_node => nil }

    until discovered_nodes.empty?
      current_node = discovered_nodes.shift
      return parent if current_node == end_node

      process_neighbors(current_node, discovered_nodes, visited_nodes, parent)
    end
    nil
  end

  def process_neighbors(current_node, discovered_nodes, visited_nodes, parent)
    current_node.connections.each do |neighbor|
      next if visited_nodes.include?(neighbor)

      visited_nodes.add(neighbor)
      parent[neighbor] = current_node
      discovered_nodes << neighbor
    end
  end

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
