gem 'minitest'
require_relative '../lib/scrabble'
require 'minitest/autorun'
require 'minitest/pride'
require 'pry'

class ScrabbleTest < Minitest::Test

  def test_it_can_split_words

     assert_equal ["W","O","R","D"], Scrabble.new.split_word("word")
   end

   def test_it_can_still_split_one_letter

     assert_equal ["A"], Scrabble.new.split_word("a")
   end

   def test_it_can_find_point_values

     assert_equal 1, Scrabble.new.point_values["A"]
   end

  def test_it_can_score_a_single_letter
    assert_equal 1, Scrabble.new.score("a")
    assert_equal 4, Scrabble.new.score("f")
  end

  def test_it_can_score_an_entire_word
    assert_equal 8, Scrabble.new.score("dance")
  end

  def test_it_does_not_care_about_case
    assert_equal 8, Scrabble.new.score("DaNcE")
  end

  def test_it_can_score_empty_words
    assert_equal 0, Scrabble.new.score("")
    assert_equal 0, Scrabble.new.score(nil)
  end

  def test_it_can_multiply_score_for_a_single_letter
    test_word = Scrabble.new.score_with_multipliers("d", [2])

    assert_equal 4, test_word
  end

  def test_it_can_multiply_score_for_a_word
    test_word = Scrabble.new.score_with_multipliers("down", [1,2,1,2])

    assert_equal 10, test_word
  end

  def test_it_can_score_with_word_multipliers_and_single_letter
    test_word = Scrabble.new.score_with_multipliers("d", [2], 2)

    assert_equal 8, test_word
  end

  def test_it_can_score_words_with_a_letter_and_word_mulitplier
    test_word = Scrabble.new.score_with_multipliers("down", [1,2,1,2], 3)

    assert_equal 30, test_word
  end

  def test_it_can_add_a_seven_letter_bonus
    test_word = Scrabble.new.score_with_multipliers("downtown", [1,1,1,2,1,1,1,2], 3)

    assert_equal 81, test_word
  end

  def test_it_can_find_the_highest_scoring_word
    test_words = Scrabble.new.highest_scoring_word(['home', 'word', 'hello', 'sound'])

    assert_equal 'home', test_words
  end
end
