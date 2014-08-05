require './lib/term.rb'
require './lib/definition.rb'
require './lib/word.rb'

def main_menu
  system("clear")
  loop do
    puts "[-- Dictionary Menu --]"
    puts "[c] create a term"
    puts "[l] list all terms and modify them"
    puts "[s] search for a word in your dictionary"
    puts "[x] exit program"
    menu_choice = gets.chomp
    if menu_choice == "c"
      create_term
    elsif menu_choice == "l"
      list_terms
    elsif menu_choice == 's'
      word_search
    elsif menu_choice == "x"
      puts "thanks for looking stuff up!\n"
      exit
    else
      puts "Invalid Choice"
    end
  end
end

def create_term
  puts "\nEnter a word for your dictionary: "
  user_word = gets.chomp
  puts "Enter the definition for #{user_word}: "
  user_def = gets.chomp
  Term.new.save
  new_definition = Definition.new(user_def)
  new_word = Word.new(user_word)
  @current_term = Term.all[-1]
  @current_term.add_word(new_word)
  @current_term.add_def(new_definition)
  puts "\nThe term you created is: #{@current_term.words[-1].word}"
  puts "The definition is: #{@current_term.definitions[-1].definition}\n\n"
  term_menu
end

def list_terms
  puts "\nThese are all of the terms in your dictionary:"
  Term.all.each_with_index do |term, index|
    print "[#{(index+1)}] Word Group: "
      term.words.each do |item|
      puts "#{item.word}"
    end
  end
  puts "\nEnter the number of the term you would like to edit.\n"
  term_choice = gets.chomp.to_i
  @current_term = Term.all[term_choice - 1]
  @current_word = @current_term.words[0].word
  puts "Your current term is #{@current_term.words[0].word}\n"
  term_menu
end

def word_search
  puts "\nWhat word would you like to search for:"
  word_choice = gets.chomp
  @current_term= Term.search(word_choice)
  puts "word is found - your word group contains the following: "
  @current_term.words.each do |item|
    puts "#{item.word}"
  end
term_menu
end


def term_menu
  loop do
    puts "[-- Word Menu --]"
    puts "[a] add another definition"
    puts "[s] show the definitions"
    puts "[e] edit the definition"
    puts "[d] delete this word"
    puts "[x] exit to main menu"
    edit_choice = gets.chomp
    if edit_choice == 'a'
      add_def
    elsif edit_choice == 's'
      show_def
    elsif edit_choice == 'e'
      edit_def
    elsif edit_choice == 'd'
      delete_word
    elsif edit_choice == 'x'
      main_menu
    else
      puts "Please enter a valid option"
    end
  end
end

def add_def
  puts "Enter another definition or get a pie to the face: "
  def_input = gets.chomp
  new_def = Definition.new(def_input)
  @current_term.add_def(new_def)
  puts "\nThanks! Your new definition has been added.\n\n"
end

def show_def
  print "\nWords: "
  @current_term.words.each do |item|
    print "#{item.word}"
    end
  @current_term.definitions.each_with_index do |item, index|
    puts "\n[#{index + 1}] - #{item.definition}"
  end
  puts "\n"
end

def edit_def
  show_def
  puts "What would you like the definition to say?"
  def_edit = gets.chomp
  @current_term.edit_def(def_edit)
  puts "\nGood job! Your new definition for #{@current_term.word} is:"
  puts "#{@current_term.definition}\n\n"
  show_def
end

def delete_word
  delete_word = @current_term.word
  Term.all.delete(@current_term)
  puts "#{delete_word} has been deleted from the dictionary.\n"
end

main_menu
















