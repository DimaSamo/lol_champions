class LolChampions::Champion
  attr_accessor :name, :role, :popularity, :win_rate, :ban_rate, :kills, :deaths, :assists
  @@all = []

  def self.all
    @@all
  end

  def initialize
    @@all.push(self)
  end
end
