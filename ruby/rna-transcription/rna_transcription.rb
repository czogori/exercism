class Complement

  DNA_MAP = {
        "A" => "U",
        "C" => "G",
        "G" => "C",
        "T" => "A" 
  }.freeze

  def self.of_dna(dna)
    return "" if dna.empty? 
    return "" unless dna.sub(/[ACGT]+/, '').empty?
    
    dna.each_char.map {|c| DNA_MAP[c]}.join
  end
end

module BookKeeping
  VERSION = 4
end