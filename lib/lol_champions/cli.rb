class LolChampions::CLI
    def call
        @input = ""
        self.welcome
        @role_names = ["Top", "Jungler", "Mid", "AD Carry", "Support"]
        @role_names.each.with_index(0) {|role, index| LolChampions::Role.new(@role_names[index]) }
        newscraper = LolChampions::Scraper.new
        LolChampions::Champion.create_from_collection(newscraper.scrape_champions)
        while @input != "exit"
          self.menu
        end
    end

    def welcome
      puts "Welcome to League of Legends Chapmion Statistics."
    end

    def menu
      puts "---------------------------------"
      puts "Please select an option (use the numbers)"
      puts "1. List all champions."
      puts "2. List all champions by win rate."
      puts "3. List all champions by role."
      puts "4. Display information about a champion."
      puts "5. Exit"
      @input = gets.strip
      index = input_to_index(@input)

      case @input
      when "1"
        self.list_champions
      when "2"
        self.list_champions_by_winrate
      when "3"
        self.list_champions_by_role
      when "4"
        self.additional_info_options
      when "5"
        @input = "exit"
      end
    end

    def list_champions
      puts "---------------------------------"
      LolChampions::Champion.all.each.with_index(1) do |champion, i|
        puts "#{i}. #{champion.name}"
        self.list_twenty_five if i%25 == 0
      end
    end

    def list_champions_by_role
      puts "---------------------------------"
      puts "Please choose a role."
      self.list_all_roles
      input = gets.chomp
      puts "---------------------------------"
      puts "All available #{@role_names[input.to_i-1]} champions:"
      LolChampions::Role.all[input.to_i-1].display_champions
    end

    def list_champions_by_winrate
      puts "---------------------------------"
      LolChampions::Champion.all_by_winrate.each.with_index(1) do |champion, i|
        puts "#{i}. #{champion.name} - #{champion.win_rate}"
        self.list_twenty_five if i%25 == 0
      end
    end

    def list_all_roles
      LolChampions::Role.all.each.with_index(1) do |role, index|
        puts "#{index}. #{role.name}"
      end
    end


    def additional_info_options
      puts "---------------------------------"
      puts "Please enter a champion name"
      champ_name = gets.chomp
      champion = LolChampions::Champion.find_by_name(champ_name)
      if champion
        puts "---------------------------------"
        puts "What information would you like to display?"
        puts "1. Popularity, 2. Win Rate, 3. Ban Rate, 4. KDA, 5. All of it"
        info_input = gets.chomp
        while info_input
          case info_input
          when "1"
            puts "---------------------------------"
            puts "#{champion.name}'s popularity is: #{champion.popularity}"
            info_input = nil
          when "2"
            puts "---------------------------------"
            puts "#{champion.name}'s win rate is: #{champion.win_rate}"
            info_input = nil
          when "3"
            puts "---------------------------------"
            puts "#{champion.name}'s ban rate is: #{champion.ban_rate}"
            info_input = nil
          when "4"
            puts "---------------------------------"
            puts "#{champion.name}'s KDA is: #{champion.display_kda}"
            info_input = nil
          when "5"
            puts "---------------------------------"
            puts "Champion Name: #{champion.name}"
            puts "Popularity: #{champion.popularity}"
            puts "Win Rate: #{champion.win_rate}"
            puts "Ban Rate: #{champion.ban_rate}"
            puts "KDA: #{champion.display_kda}"
            info_input = nil
          else
            puts "Please enter correct input (1-5)"
            info_input = gets.chomp
          end
        end
      else
        puts "Champion doesn't exist, please enter a valid champion name or type menu to go back to the menu." unless champ_name == "menu"
        self.additional_info_options unless champ_name == "menu"
      end
    end

    def list_twenty_five
      puts "----------------------------"
      puts "Press any key to display the next 25 champions."
      gets.chomp
      puts "----------------------------"
    end

    def input_to_index(input)
      input.to_i-1
    end

end
