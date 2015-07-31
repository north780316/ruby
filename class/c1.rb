class Person
	def initialize ( name = "no name", height = 170, weight = 60, phone = "no phone" )
		@name = name
		@height = height
		@weight = weight
		@phone = phone
	end

	def showName
		puts "my name is #{@name}"
	end
	attr_reader :name, :height, :weight, :phone
end

class Man < Person
	def initialize ( name = "no name", height = 170, weight = 60, phone = "no phone" )
		super
		@gender = "MAN"
	end

	def showGender
		puts "my gender is #{@gender}"
	end

	def to_s 
		return "#{gender} #{name}"
	end

	attr_reader :gender
end


man1 = Man.new( "Tom" )
puts man1

