class Prospector::CLI

	def list
		Prospector::Scraper.new.make_songs
		puts "Welcome to the Billboard Hot 100! The definitive listing of the top 100 songs in America!"
		puts ""
		puts "What segment of the rankings would you like to view?"
		puts "1-20, 21-40, 41-60, 61-80, 81-100"
		puts ""
		choose_segment
	end

	def choose_segment
		num = gets.to_i

		puts ""
		puts "-*-*-*-*-*| Songs #{num} - #{num+19} |*-*-*-*-*-"
		puts ""
		Prospector::Song.all[num-1, 20].each do |song|
    	puts "#{song.position}. #{song.name} - #{song.artist}"
    end
	end

	def choose_song
		puts "\n" + "-------------------------------------------------------"
		puts "Is there a particular song you would like more info on?" + "\n" + "If so please enter it's corresponding ranking."
		puts "-------------------------------------------------------" + "\n" + "\n"
		indx = gets.to_i
		song = Prospector::Song.find_by_index(indx-1)
		if !song
			choose_song
		else
			puts ""
      		puts "#{song.position}. #{song.name} - #{song.artist}"
      		puts "[ * ] Last Week's Rank: #{song.last_week}"
      		puts "[ * ] Peak Rank: #{song.peak}"
      		puts "[ * ] Weeks on Chart: #{song.weeks_on}"
      	end
	end

	def call
		list
		input = nil
		while input != "exit"

			choose_song

			puts "\n" + "---------------------------------------------"
			puts "Enter 'list' to view the list of songs again." + "\n" + "Or 'exit' to end the program."
			puts "---------------------------------------------"

			input = gets.strip

			if input == "list"
				call
			end

			puts ""
			puts "Thank you for visiting!"
			exit
		end
	end
end
