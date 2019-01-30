class LolChampions::CLI
    def call
        self.welcome
        self.menu
        newscraper = LolChampions::Scraper.new
        LolChampions::Champion.create_from_collection(newscraper.scrape_champions)
        self.list_champions
    end

    def welcome
      puts "Welcome to League of Legends Chapmion Statistics."
    end

    def menu
      puts "1. List all champions"
      puts "2. List all champions by role"
      puts "3. Exit"
    end

    def list_champions
      LolChampions::Champion.all.each.with_index(1) do |champion, i|
        puts "#{i}. #{champion.name}"
      end
    end

end
