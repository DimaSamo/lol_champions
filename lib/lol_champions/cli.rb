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


      #  self.list_champions
      #  LolChampions::Role.find_by_name("Mid").display_champions
    end

    def welcome
      puts "Welcome to League of Legends Chapmion Statistics."
    end

    def menu
      puts "1. List all champions."
      puts "2. List all champions by role."
      puts "3. Display information about a champion."
      puts "3. Exit"
      @input = gets.strip
      index = input_to_index(@input)
      puts "#{@input}"

      case @input
      when "1"
        self.list_champions
      when "2"
        self.list_champions_by_role
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

    def input_to_index(input)
      input.to_i-1
    end

end
