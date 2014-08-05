class Term
  @@all_terms = []

  def initialize(word, definition)
    @word = word
    @definition = definition
  end

  def word
    @word
  end

  def definition
    @definition
  end

  def Term.all
    @@all_terms
  end

  def save
    @@all_terms << self
  end

  def Term.clear
    @@all_terms = []
  end
end
