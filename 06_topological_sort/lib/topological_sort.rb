require_relative 'graph'

# Implementing topological sort using both Khan's and Tarian's algorithms

def topological_sort(vertices)
  sorted = []
  top = []
  
  vertices.each do |vertex|
    if vertex.in_edges.empty?
      top.push(vertex)
    end
  end 
  
  until top.empty?
    current = top.pop 
    sorted << current
    current.out_edges.each do |edge|
      edge.to_vertex.in_edges.delete(edge)
      if edge.to_vertex.in_edges.empty?
        top.push(edge.to_vertex)
      end
    end
  end 
  
  return [] if sorted.length < vertices.length
  sorted

end
