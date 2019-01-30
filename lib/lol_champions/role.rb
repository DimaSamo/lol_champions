class LolChampions::Role
  attr_accessor :name, :champions
  @@all = []

  def self.all
    @@all
  end

  def initialize(name)
    @name = name
    @champions = []
  end

end
