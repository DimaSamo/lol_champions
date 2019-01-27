class LolChampions::CLI
    def call
        puts "Welcome to League of Legends Chapmion Statistics. Please select and option."
        puts "1. List all champions"
        puts "2. List all champions by role"
        newscraper = LolChampions::Scraper.new
        newscraper.create_champions
        puts "#{LolChampions::Champion.all.count}"
    end
end
