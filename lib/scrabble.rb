require "pry"

class Scrabble

  def point_values
    {
      "A"=>1, "B"=>3, "C"=>3, "D"=>2,
      "E"=>1, "F"=>4, "G"=>2, "H"=>4,
      "I"=>1, "J"=>8, "K"=>5, "L"=>1,
      "M"=>3, "N"=>1, "O"=>1, "P"=>3,
      "Q"=>10, "R"=>1, "S"=>1, "T"=>1,
      "U"=>1, "V"=>4, "W"=>4, "X"=>8,
      "Y"=>4, "Z"=>10
    }
  end

  def split_word(word)
    if word != nil; word.upcase.chars
    end
  end

  def score(word)
    scored = 0
    if word != nil; split_word(word).map do |letter|
      scored += point_values[letter]
      end
    end
    return scored
  end

  def seven_letter_bonus(word)
    if word.length >= 7
      true
    else
     false
   end
  end

  def multiply_points(point_map, letter_multiplier)
    index = 0
    total_point_map = []
    (point_map.length).times do
      total_point_map << (point_map[index] * letter_multiplier[index])
      index += 1
    end
    total_point_map.sum
    end

  def add_up_points(scored, letter_multiplier, word_mulitplier)
    if word_mulitplier != nil && seven_letter_bonus(scored) == true
      score = (multiply_points(scored, letter_multiplier) + 10) * word_mulitplier
    elsif word_mulitplier != nil && seven_letter_bonus(scored) == false
      score = multiply_points(scored, letter_multiplier) * word_mulitplier
    elsif word_mulitplier == nil && seven_letter_bonus(scored) == true
      score = multiply_points(scored, letter_multiplier) + 10
    else
      score = multiply_points(scored, letter_multiplier)
    end
    return score
  end

  def score_with_multipliers(word, letter_multiplier, word_mulitplier = nil)
    scored = []
    if word != nil; split_word(word).map do |letter|
      scored << point_values[letter]
      end
    end
    add_up_points(scored, letter_multiplier, word_mulitplier)
  end

  def highest_scoring_word(word_list)
    word_scores = {}
    word_list.map do |word|
      word_scores[word] = score(word)
    end
    word_scores.max_by do |word, score|
      score
    end
  end


end
