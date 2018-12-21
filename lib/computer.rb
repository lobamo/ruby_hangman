require "csv" 
class Computer
    attr_accessor :dictionary, :random_word
    def initialize
        @dictionary = CSV.open("/home/nicolasad/Documents/top/ruby/hangman/dictionary.csv")
    end
    
    def random_words
        @random_word = []
        for i in @dictionary
            if i[0].length >= 5 && i[0].length <= 12
                 random_word.push(i[0])
            end
            
        end
         @random_word =  random_word[rand(random_word.length)]

    end

def board
        random_words
       puts "_ " * @random_word.length
end

def guess_word
    puts "--- choose a letter ---"
    board = []
    chosen_word = random_words.split(//)
    player_guess = []
    player_input = player_guess 
    chosen_word.each { |i|  player_guess << " - "}
    puts chosen_word.join
    puts player_guess.join
    puts "\n"
    
    guess = gets.chomp
    for letter in chosen_word
        if chosen_word.include?(guess)
            puts "gg"
           puts letter
           index = 0
        else  letter != player_input
            puts "try again" 
            player_guess           
        end
    end 
end

end

c = Computer.new
c.guess_word