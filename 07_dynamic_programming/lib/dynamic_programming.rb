class DynamicProgramming

  def initialize
    # @blairs = [nil, 1, 2]
    @blair_cache = {1=> 1, 2 => 2}
    @frog_cache = [[[]], [[1]], [[1, 1], [2]]]
  end

  def blair_nums(n)
    # return @blairs[n] unless @blairs[n].nil?

    # odds = (n-1)*2 -1 
    # blair = blair_nums(n - 1) + blair_nums(n - 2) + odds
    # @blairs[n] = blair
    # @blairs[n]

    return @blair_cache[n] if @blair_cache[n]
    odd_num = 1 
    [1..n-1].each do |i|
      odd_num += 2
    end 

    @blair_cache[n] = blair[n-1] + blair[n -2] + odd_num 
    return @blair_cache[n]
  end

  def frog_hops_bottom_up(n)
    frog_cache_builder(n)[n]
  end

  def frog_cache_builder(n)
    ways_collection = [[[]], [[1]], [[1, 1], [2]]]
    return ways_collection if n < 3 

    (3..n).each do |i| 
      new_way_set = []
      (1..3).each do |first_step|
        ways_collection[i - first_step].each do |way|
          new_way = [first_step]
          way.each do |step|
            new_way << step 
          end
          new_way_set << new_way 
        end 
      end 
      ways_collection << new_way_set
    end

    ways_collection 
  end

  def frog_hops_top_down(n)
    @frog_cache = [[[]], [[1]], [[1, 1], [2]]]
    frog_hops_top_down_helper[n]
  end

  def frog_hops_top_down_helper(n)
    return @frog_cache[n] if @frog_cache[n]
    new_way_set = []
    (1..3).each do |first_step|
      frog_hops_top_down_helper[n - first_step].each do |way|
        new_way = [first_step]
        way.each do |step|
          new_way << step 
        end 
        new_way_set << new_way 
      end
    end
    @frog_cache[n] = new_way_set 
  end
 
  end

  def super_frog_hops(n, k)
    ways_collection = [[[], [[1]]]]

    return ways_collection[n] if n < 2 

    (2..n).each do |i|
      new_way_set = []
      (1..k).each do |first_step|
        next if i - first_step < 0 
        ways_collection[i - first_step].each do |way| 
          new_way = [first_step]
          way.each do |step|
            new_way << step 
          end 
        end
      end
  end

  def knapsack(weights, values, capacity)
    return 0 if capacity == 0 || weights.length == 0 
    solution_table = knapsack_table(weights, values, capacity)
    solution_table[capacity][-1]
  end

  # Helper method for bottom-up implementation
  def knapsack_table(weights, values, capacity)
    solution_table = []
    (0..capacity).each do |i|
      solution_table[i] = []
  end

  def maze_solver(maze, start_pos, end_pos)
  end
end
