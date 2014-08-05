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

  def edit_def(new_def)
    @definition = new_def
  end

  def Term.search(term)
    @@all_terms.detect {|item| item.word == term}
  end
end
