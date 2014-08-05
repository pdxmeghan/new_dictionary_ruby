require 'rspec'
require 'term'
require 'definition'
require 'word'

describe Term do
  before do
    Term.clear
  end

  describe '.clear' do
    it 'empties out all of the terms' do
      Term.new.save
      Term.clear
      expect(Term.all).to eq []
    end
  end

  describe '.all' do
    it 'will start with an empty class array' do
      expect(Term.all).to eq []
    end
  end

  it 'will initialize it with a word and definition' do
    test_term = Term.new
    expect(test_term).to be_an_instance_of Term
  end

  it "will add a word to a term" do
    test_term = Term.new
    test_word = Word.new('epicodus')
    test_term.add_word(test_word)
    expect(test_term.words).to eq [test_word]
  end

  it 'will add a definition to a term' do
    test_term = Term.new
    test_definition = Definition.new('a place for learning')
    test_term.add_def(test_definition)
    expect(test_term.definitions).to eq [test_definition]
  end

  it 'will add another definition to an existing term' do
    test_term = Term.new
    test_definition = Definition.new('a twisty doughy treat')
    test_term.add_def(test_definition)
    expect(test_term.definitions).to eq [test_definition]
  end
#   it 'will save all terms to the term array' do
#     test_term = Term.new('epicodus', 'a place for learning')
#     test_term.save
#     expect(Term.all).to eq [test_term]
#   end

#   it 'will change the definition of a term' do
#     test_term = Term.new('epicodus', 'a place for learning')
#     test_term.save
#     test_term.edit_def('a place to meet people')
#     expect(test_term.definition).to eq 'a place to meet people'
#   end

  describe '.search' do
    it 'will search for a word in the dictionary' do
      test_term = Term.new
      test_word = Word.new("pretzels")
      test_term.save
      test_word2 = Word.new("peanuts")
      test_term.add_word(test_word)
      test_term.add_word(test_word2)
      expect(Term.search('pretzels')).to eq test_term
    end
  end
end

describe Definition do
  it "should initialize a definition class" do
    test_definition = Definition.new("a great place to swim")
    expect(test_definition).to be_an_instance_of Definition
  end
end

describe Word do
  it "should initialize a word class" do
    test_word = Word.new("swimming pool")
    expect(test_word).to be_an_instance_of Word
  end
end



