# socket example code -- client
require 'socket'

hostname = '127.0.0.1'
port = 2001

puts "connect to #{hostname}:#{port} ..."
socket = TCPSocket.open( hostname, port )
if nil != socket
	puts "connect successfully"
else
	puts "connect fail"
end

while true
	line = socket.readline.chop!
	if nil == line
		"connection stop"
		break
	end
	puts line

	cmd = STDIN.readline.chop!
	socket.puts cmd
	line = socket.readline.chop!
	if nil == line
		"connection stop"
		break
	end
	puts line
end
socket.close()
