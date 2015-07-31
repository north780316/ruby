# socket example code -- server
require 'socket'
require 'thread'

mutex = Mutex.new

hostname = '127.0.0.1'
port = 2001

puts "connect to #{hostname}:#{port} ..."
server = TCPServer.open( 2001 )
if nil != server
	puts "build server successfully"
else
	puts "build server fail"
end

userNum = 0
while true
	socket = server.accept # listen
	mutex.lock
	userNum += 1
	mutex.unlock
	Thread.new { 
		while true
			socket.puts "* enter request: time | user | quit"
			cmd = socket.readline.chop!
			puts "get command: #{cmd}"
			case cmd
			when "time"
				socket.puts "#{Time.now.ctime}"
			when "user"
				socket.puts "user number is #{userNum}"
			when "quit"
				socket.puts "bye"
				mutex.lock
				userNum -= 1
				mutex.unlock
				socket.close()
				break
			else
				socket.puts "unknwon command #{cmd}"
			end
		end
	}
end
