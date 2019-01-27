class LolChampions::Scraper
  attr_accessor :scrape_url

  def initialize
    @scrape_url = "https://www.leagueofgraphs.com/champions/overview"
  end

  def create_champions
    page = Nokogiri::HTML(open(@scrape_url))
    champions = page.css("#mainContentContainer .data_table tr")
    champions.each do |champion|
      if champion.css(".name").text.strip != ""
        new_champ = LolChampions::Champion.new
        new_champ.name = champion.css(".name").text.strip
        new_champ.role = champion.css("i").text.strip
        new_champ.popularity = champion.css("td")[2].css(".percentage")[0].text.strip
        new_champ.win_rate = champion.css("td")[3].css(".percentage")[0].text.strip
        new_champ.ban_rate = champion.css("td")[4].css(".percentage")[0].text.strip
        new_champ.kills = champion.css(".kills").text.strip
        new_champ.deaths = champion.css(".deaths").text.strip
        new_champ.assists = champion.css(".assists").text.strip
      end
    end
  end
end

#website https://www.leagueofgraphs.com/champions/overview

# page.css("#mainContentContainer .data_table tr") #champions
# champion.css(".name").text.strip #champion
# champion.css("i").text.strip #role
# champion.css("td")[2].css(".percentage")[0].text.strip #popularity
# champion.css("td")[3].css(".percentage")[0].text.strip #win ratio
# champion.css("td")[4].css(".percentage")[0].text.strip #ban rate
# champion.css(".kills").text.strip #kills
# champion.css(".deaths").text.strip #deaths
# champion.css(".assists").text.strip #assists
