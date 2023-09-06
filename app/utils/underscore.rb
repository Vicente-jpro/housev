class Underscore
    attr_accessor :sentence
    def initialize(sentence)
      @sentence = sentence
    end

    def to_space 
      position = 0

      @sentence.size.times do
        @sentence = @sentence.gsub("_", " ") if @sentence[position] == "_"
        position += 1
      end
      @sentence
    end

end
