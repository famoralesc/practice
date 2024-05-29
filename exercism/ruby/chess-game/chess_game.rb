module Chess
  RANKS = (1..8)
  FILES = ('A'..'H')
  def self.valid_square?(rank, file)
    RANKS.include?(rank) && FILES.include?(file)
  end

  def self.nick_name(first_name, last_name)
    "#{first_name[0,2]}#{last_name[-2..-1]}".upcase
  end

  def self.move_message(first_name, last_name, square)
    file, rank = square[0], square[1].to_i
    nick_name = self.nick_name(first_name, last_name)
    valid = self.valid_square?(rank, file)
    unless valid
      return "#{nick_name} attempted to move to #{square}, but that is not a valid square"
    end
    "#{nick_name} moved to #{square}"  
  end
end
