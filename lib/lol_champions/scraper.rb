class LolChampions::Scraper

end

#website https://www.leagueofgraphs.com/champions/overview

page.css("#mainContentContainer .data_table tr") #champions
champion.css(".name").text.strip #champion
champion.css("i").text.strip #role
champion.css("td")[2].css(".percentage")[0].text.strip #popularity
champion.css("td")[3].css(".percentage")[0].text.strip #win ratio
champion.css("td")[4].css(".percentage")[0].text.strip #ban rate
champion.css(".kills").text.strip #kills
champion.css(".deaths").text.strip #deaths
champion.css(".assists").text.strip #assists
