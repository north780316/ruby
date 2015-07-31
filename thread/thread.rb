require 'thread'

mutex = Mutex.new

sum = 0
threads = []
threads << Thread.new {
	i = 2
	while i <= 1000000
		mutex.lock
		sum += i
		mutex.unlock
		i += 2
	end
}

threads << Thread.new {
	j = 1
	while j <= 1000000
		mutex.lock
		sum += j
		mutex.unlock
		j += 2
	end
}

threads.each { |th|
	th.join
}

puts "sum = #{sum}"
