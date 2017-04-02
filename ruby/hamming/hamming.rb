module BookKeeping
  VERSION = 3
end

class Hamming
  def self.compute a, b
    raise ArgumentError if a.length != b.length
    diff = 0
    a.split("").each_index {|x| diff += a[x] == b[x] ? 0 : 1}
    diff
  end
end