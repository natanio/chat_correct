module ChatCorrect
  class Capitalization
    attr_reader :token_a, :token_b
    def initialize(token_a:, token_b:)
      @token_a = token_a
      @token_b = token_b
    end

    def capitalization_error?
      word_a.downcase.eql?(word_b.downcase) && (word_a != word_b) && (cc.values[0] == word_b)
    end
  end
end
