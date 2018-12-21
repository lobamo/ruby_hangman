require "csv" 
class Computer
    attr_accessor :dictionary, :random_word
    def initialize
       # @dictionary = CSV.open("dictionary.csv")
        @dictionary = CSV.open("/home/nicolas/Bureau/dev_courses/top/ruby/hangman/dictionary.csv")
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
        loop do
        guess = gets.chomp
            if chosen_word.include?(guess)
            index = 0
            chosen_word.each { |i| 
                if i == guess
                    player_guess[index] = guess
                end
                index = index + 1
            }     
            puts player_guess.join  
            end 
            break if player_guess == chosen_word
            end
    end
end
def game
    
end
end

c = Computer.new
c.guess_word