class Hangman

    def initialize irc_server
    @irc_server = irc_server
    end


  def play_the_game
    # establish_irc
    introduce_the_game
    get_user_input
    hide_the_word
    while @word != @guessed_word
      guess_the_word
      pair_the_letters
    end
  end

  # def establish_irc
  #   irc_server = TCPSocket.open("chat.freenode.net", "6667")
  # end


  def introduce_the_game
    @irc_server.puts "Welcome to hangman!"
    @irc_server.puts "To get started, enter a word to be guessed"
  end

  def get_user_input
    @word = gets.chomp.downcase
    50.times {@irc_server.puts " "}
    @irc_server.puts "Okay, cool!"
    @irc_server.puts " * * * * * * * * * * * * * * * * * * * * * * * * * *"
    @irc_server.puts "The spaces below represent a letter waiting to be guessed so..."
  end

  def hide_the_word
    @guessed_word = @word.gsub(/\w/, '-')
    @irc_server.puts @guessed_word
  end

  def guess_the_word
    @irc_server.puts "Time to guess a letter!"
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

  @irc_server.puts @guessed_word

  end

end