require "csv" 
class Computer
    attr_accessor :dictionary, :random_word, :player_guess, :wrong_count
    def initialize
       # @dictionary = CSV.open("dictionary.csv")
        @dictionary = CSV.open("/home/nicolas/Bureau/dev_courses/top/ruby/hangman/dictionary.csv")
        @player_guess = player_guess
        @wrong_count = 0
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


    def game

     
        puts "--- choose a letter ---"
        won = false
        letter_used = []
        chosen_word = random_words.split(//).map(&:downcase)
        @player_guess = []
        player_input = player_guess 
        chosen_word.each { |i|  player_guess << " - "}
        puts chosen_word.join
        puts @player_guess.join
        puts "\n"
        loop do
            guess = gets.chomp
            if chosen_word.include?(guess)
                index = 0
                chosen_word.each { |i| 
                    if i == guess
                        @player_guess[index] = guess
                    end
                        index = index + 1
                    }     
                    puts @player_guess.join 
    
            
             if @player_guess == chosen_word
                puts "you win"
                break
            end
            else letter_used << guess
                puts letter_used.inspect
                wrong_letter
                puts "you have #{6 - wrong_count} left"
        
            end
            if wrong_count == 6
                puts "you loose"
            break
            end
        end
        
    end

def wrong_letter
        @wrong_count += 1
    end
end

c = Computer.new
c.game