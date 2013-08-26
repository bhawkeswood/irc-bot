require "socket"


server = "chat.freenode.net"
port = "6667"
nick = "NooseBot"
channel = "#chuck"
greeting_prefix = "privmsg #{channel} :"
greetings = ["hi", "hola", "wazup", "guten tag", "howdy", "salutations", "who the hell are you?"]

irc_server = TCPSocket.open(server, port)

irc_server.puts "USER bhellobot 0 * BHelloBot"
irc_server.puts "NICK #{nick}"
irc_server.puts "JOIN #{channel}"
#irc_server.puts "PRIVMSG #{channel} :Hello from IRB Bot"

# Hello, Bot!
until irc_server.eof? do
  msg = irc_server.gets.downcase
  puts msg

  wasGreeted = false
  greetings.each do |g|
  wasGreeted = true if msg.include? g
  end

  if msg.include? greeting_prefix and wasGreeted
    response = "Let's play some hangman! Type $Hangman to begin!"
    irc_server.puts "PRIVMSG #{channel} :#{response}"
  end

class Hangman

  def play_the_game
    establish_irc
    introduce_the_game
    get_user_input
    hide_the_word
    while @word != @guessed_word
      guess_the_word
      pair_the_letters
    end
  end

  def establish_irc
    irc_server = TCPSocket.open("chat.freenode.net", "6667")
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
#HOW ARE YOU GOING TO GET THIS CLASS TO PRINT TO THE CHAT????
   if msg.include?("$hangman")
    response = Hangman.new
    response.play_the_game
    puts "PRIVMSG #{channel} :#{response}"
  end
end


   