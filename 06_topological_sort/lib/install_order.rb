# Given an Array of tuples, where tuple[0] represents a package id,
# and tuple[1] represents its dependency, determine the order in which
# the packages should be installed. Only packages that have dependencies
# will be listed, but all packages from 1..max_id exist.

# N.B. this is how `npm` works.

# Import any files you need to

=begin
Kahn's Algorithm
1. Queue up all vertices with nil in edges
2. Pop off vertices from queue. 
  a- remove vertex + out_edges from graph
  b- push vertex into sorted 
  c- examine destination vertices, push onto queue if into more in_edges
=end 

require_relative 'graph'
require_relative 'topological_sort'

def install_order(arr)
  vertices = []
  out_edges = []
  max = 0 
  arr.each { |el| max = el[0] > max ? el[0] : max }
  [*1..max].each { |vertex| vertices << Vertex.new(vertex) }
  arr.each {|el| Edge.new(vertices[el[1]- 1], vertices[el[0] - 1]) }
  topological_sort(vertices).each { |vert| out_edges << vert.value }
  
  out_edges
end
