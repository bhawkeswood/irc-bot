class Hangman
	

	def play_the_game
		introduce_the_game
		get_user_input
		hide_the_word
		while @word != @guessed_word
			guess_the_word
			pair_the_letters
		end
	end

	def introduce_the_game
		puts "Welcome to hangman!"
		puts "To get started, enter a word to be guessed"
	end

	def get_user_input
		@word = gets.chomp.downcase
		50.times {puts " "}
		puts "Okay, cool!"
		puts " * * * * * * * * * * * * * * * * * * * * * * * * * *"
		puts "The spaces below represent a letter waiting to be guessed so..."
	end

	def hide_the_word
		@guessed_word = @word.gsub(/\w/, '-')
		puts @guessed_word
	end

	def guess_the_word
		puts "Time to guess a letter!"
		@user_input = gets.chomp.downcase
	end

	def pair_the_letters
		index = 0
		@word.each_char do |x|
			if x == @user_input
				@guessed_word[index] = @user_input
			end
			index += 1
		end

	puts @guessed_word

	end

end

game = Hangman.new
game.play_the_game
60.times {print "*"}
puts "\n"
puts "Congratulations!  You got it!"
puts "\n"
60.times {print "*"}
puts " "