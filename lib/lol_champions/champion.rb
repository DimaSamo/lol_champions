class LolChampions::Champion
  attr_accessor :name, :popularity, :win_rate, :ban_rate, :kills, :deaths, :assists
  attr_reader :role
  @@all = []

  def self.all
    @@all
  end

  def initialize(champion_hash)
    champion_hash.each do |attribute, value|
      self.send("#{attribute}=", value)
    end
    @@all.push(self)
  end

  def role=(roles)
    @role = roles.split(",").map do |role|
      role
    end
  end

  def self.create_from_collection(champions_array)
    champions_array.each do |champion_hash|
      LolChampions::Champion.new(champion_hash)
    end
  end
end
