class Term
  @@all_terms = []

  attr_reader(:words, :definitions)

  def initialize
    # @word = word
    # @definition = definition
    @words = []
    @definitions = []
  end

  def add_word(word)
    @words << word
  end

  def add_def(definition)
    @definitions << definition
  end

  # def word
  #   @word
  # end

  # def definition
  #   @definition
  # end

  def Term.all
    @@all_terms
  end

  def save
    @@all_terms << self
  end

  def Term.clear
    @@all_terms = []
  end

  # def edit_def(new_def)
  #   @definition = new_def
  # end

  def Term.search(search_word)
    @@all_terms.each do |term|
      term.words.each do |word|
        if word.word == search_word
          return term
        end
      end
    end
  end
end
