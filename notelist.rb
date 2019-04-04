require 'socket'

class NoteList

  def initialize
    @notes = []
  end

  def take_note(note)
    @notes << note
  end

  def show_notes
    return @notes.join("\n")
  end
end

server = TCPServer.new(2345)

socket = server.accept

notes = nil
notebook = NoteList.new

until notes == "quit" do

  socket.puts "Enter Notes. Enter Quit When Done."

  notes = socket.gets.chomp

  unless notes =="quit"
    notebook.take_note(notes)
    socket.puts "You added: #{notes}."
  end

end

  socket.puts "Your notes:\n--------------------\n#{notebook.show_notes}\n--------------------\n"

  socket.close
