# To change this template, choose Tools | Templates
# and open the template in the editor.

def generate_combinations(r,array)
  n = array.length
  indices = (0...r).to_a
  final = (n - r...n).to_a
  results = []
  while indices != final
    if block_given?
      yield indices.map {|k| array[k]}
    else
      results << indices.map {|k| array[k]}
    end
    i = r - 1
    while indices[i] == n - r + i
      i -= 1
    end
    indices[i] += 1
    (i + 1...r).each do |j|
      indices[j] = indices[i] + j - i
    end
  end
  if block_given?
    yield indices.map {|k| array[k]}
  else
    results << indices.map {|k| array[k]}
    results
  end
end
