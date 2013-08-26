require "socket"
require "./hangman"


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


#HOW ARE YOU GOING TO GET THIS CLASS TO PRINT TO THE CHAT????
   if msg.include?("$hangman")
    response = Hangman.new irc_server
    response.play_the_game
    irc_server.puts "PRIVMSG #{channel} :#{response}"
  end
end


   