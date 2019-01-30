class LolChampions::CLI
    def call
        @input = ""
        self.welcome
        LolChampions::Role.new("AD Carry")
        LolChampions::Role.new("Support")
        LolChampions::Role.new("Jungler")
        LolChampions::Role.new("Top")
        LolChampions::Role.new("Mid")
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
        puts "Please enter a champion name"
        self.additional_info_options
      when "5"
        @input = "exit"
      end
    end

    def list_champions
      LolChampions::Champion.all.each.with_index(1) do |champion, i|
        puts "#{i}. #{champion.name}"
      end
    end

    def list_champions_by_role
      LolChampions::Role.find_by_name("Mid").display_champions
    end

    def list_champions_by_winrate
      LolChampions::Champion.all_by_winrate.each.with_index(1) do |champion, i|
        puts "#{i}. #{champion.name} - #{champion.win_rate}"
      end
    end

    def additional_info_options
      champ_name = gets.chomp
      champion = LolChampions::Champion.find_by_name(champ_name)
      if champion
        puts "What information would you like to display?"
        puts "1. Popularity, 2. Win Rate, 3. Ban Rate, 4. KDA, 5. All of it"
        champion_input = gets.chomp
        case champion_input
        when "1"
          puts "#{champion.popularity}"
        when "2"
          puts "#{champion.win_rate}"
        when "3"
          puts "#{champion.ban_rate}"
        when "4"
          puts "KDA: #{champion.display_kda}"
        when "5"
          puts "Champion Name: #{champion.name}"
          puts "Popularity: #{champion.popularity}"
          puts "Win Rate: #{champion.win_rate}"
          puts "Ban Rate: #{champion.ban_rate}"
          puts "KDA: #{champion.display_kda}"
        end

      else
        puts "Champion doesn't exist, please enter a valid champion name or type menu to go back to the menu." unless champ_name == "menu"
        self.additional_info_options unless champ_name == "menu"
      end
    end

    def input_to_index(input)
      input.to_i-1
    end

end
