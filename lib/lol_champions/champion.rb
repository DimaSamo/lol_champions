class LolChampions::Champion
    attr_accessor :name, :popularity, :win_rate, :ban_rate, :kills, :deaths, :assists
    attr_reader :roles
    @@all = []

    def self.all
      @@all
    end

    def self.all_by_winrate
      @@all.sort_by do |champion|
        champion.win_rate
      end.reverse
    end

    def self.find_by_name(name)
      @@all.find {|role| name.downcase == role.name.downcase}
    end

    def initialize(champion_hash)
      champion_hash.each do |attribute, value|
        self.send("#{attribute}=", value)
      end
      @@all.push(self)
    end

    def roles=(roles)
      @roles = roles.split(", ").map do |role|
        LolChampions::Role.find_by_name(role).add_champion(self)
        LolChampions::Role.find_by_name(role)
      end
    end

    def display_kda
      ratio = (self.kills.to_f + self.assists.to_f)/self.deaths.to_f
      "#{ratio.round(2)} - Average: #{self.kills}/#{self.deaths}/#{self.assists}"
    end

    def self.create_from_collection(champions_array)
      champions_array.each do |champion_hash|
        LolChampions::Champion.new(champion_hash)
      end
    end
  end
