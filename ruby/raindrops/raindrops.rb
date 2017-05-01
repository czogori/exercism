class Raindrops
  def self.convert(n)
      rd = (n % 3 == 0 ? "Pling" : "") + (n % 5 == 0 ? "Plang" : "") + (n % 7 == 0 ? "Plong" : "")
      rd.empty? ? n.to_s : rd
  end
end

module BookKeeping
  VERSION = 3
end