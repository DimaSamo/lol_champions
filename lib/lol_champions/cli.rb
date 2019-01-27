class LolChampions::CLI
    def call
        puts "Welcome to League of Legends Chapmion Statistics. Please select and option."
        puts "1. List all champions"
        puts "2. List all champions by role"
        newscraper = LolChampions::Scraper.new
        LolChampions::Champion.create_from_collection(newscraper.scrape_champions)
        LolChampions::Champion.all.each.with_index(1) do |champion, i|
          puts "#{i}.#{champion.name}"
        end
    end
end
