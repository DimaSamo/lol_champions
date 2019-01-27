class LolChampions::CLI
    def call
        puts "Welcome to League of Legends Chapmion Statistics. Please select and option."
        puts "1. List all champions"
        puts "2. List all champions by role"
        newcham = LolChampions::Champion.new
        newcham.name = "azir"
        puts "#{newcham.name}"
    end
end
