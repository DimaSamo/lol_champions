class LolChampions::Role
    attr_accessor :name, :champions
    @@all = []

    def self.all
      @@all
    end

    def self.find_by_name(name)
      @@all.find {|role| name == role.name}
    end

    def initialize(name)
      @name = name
      @champions = []
      @@all.push(self)
    end

    def add_champion(champion)
      @champions.push(champion)
    end

  end
  
