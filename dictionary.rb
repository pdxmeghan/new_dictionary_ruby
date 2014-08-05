require './lib/term.rb'

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
  Term.new(user_word, user_def).save
  @current_term = Term.all[-1]
  puts "\nThe term you created is: #{@current_term.word}"
  puts "The definition is: #{@current_term.definition}\n\n"
  term_menu
end

def list_terms
  puts "\nThese are all of the words in your dictionary:"
  Term.all.each_with_index do |term, index|
    puts "[#{index+1}] #{term.word} - #{term.definition}"
  end
  puts "\nEnter the number of the term you would like to edit.\n"
  term_choice = gets.chomp.to_i
  @current_term = Term.all[term_choice - 1]
  puts "Your current term is #{@current_term.word}\n"
  term_menu
end

def word_search
puts "\nWhat word would you like to search for: "
word_choice = gets.chomp
@current_term = Term.search(word_choice)
puts "#{@current_term.word} is found."
term_menu
end


def term_menu
  loop do
    puts "[-- Word Menu --]"
    puts "[s] show the definition"
    puts "[e] edit the definition"
    puts "[d] delete this word"
    puts "[x] exit to main menu"
    edit_choice = gets.chomp
    if edit_choice == 's'
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

def show_def
  puts "\nWord: #{@current_term.word}"
  puts "Definition: #{@current_term.definition}\n\n"
end

def edit_def
  puts "What would you like the definition to say?"
  def_edit = gets.chomp
  @current_term.edit_def(def_edit)
  puts "\nGood job! Your new definition for #{@current_term.word} is:"
  puts "#{@current_term.definition}\n\n"
end

def delete_word
  delete_word = @current_term.word
  Term.all.delete(@current_term)
  puts "#{delete_word} has been deleted from the dictionary.\n"
end

main_menu
















