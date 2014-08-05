require 'rspec'
require 'term'

describe Term do
  before do
    Term.clear
  end

  describe '.clear' do
    it 'empties out all of the terms' do
      Term.new('epicodus', 'a place for learning').save
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
    test_term = Term.new('epicodus', 'a place for learning')
    expect(test_term).to be_an_instance_of Term
  end

  it "will display a term's information" do
    test_term = Term.new('epicodus', 'a place for learning')
    expect(test_term.word).to eq 'epicodus'
    expect(test_term.definition).to eq 'a place for learning'
  end

  it 'will save all terms to the term array' do
    test_term = Term.new('epicodus', 'a place for learning')
    test_term.save
    expect(Term.all).to eq [test_term]
  end
end
