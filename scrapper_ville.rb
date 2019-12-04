require 'rubygems'
require 'nokogiri'
require 'open-uri'
=begin
def first_scrapper
	cities_array = []
	page = Nokogiri::HTML(open('https://simple.wikipedia.org/wiki/List_of_cities_in_France'))	436.times do |i|
		cities_array << page.xpath("//table/tbody/tr[#{i}]/td[1]").text
	end
	return cities_array
endcities_array = first_scrapper
print cities_arraydef second
	cities = []
	700.times do |x|
		page = Nokogiri::HTML(open("http://www.journaldunet.com/management/ville/index/villes?page=#{x}"))
		25.times do |i|
			cities << page.xpath("//body/div[2]/div/div[1]/div[2]/div[1]/div/div/div[1]/div/div[5]/div[1]/ul[1]/li[#{i}]/a").text.tr('()', '').split(' ')
		end
		25.times do |i|
			cities << page.xpath("//body/div[2]/div/div[1]/div[2]/div[1]/div/div/div[1]/div/div[5]/div[1]/ul[2]/li[#{i}]/a").text.tr('()', '').split(' ')
		end
	end
	return cities
enddepartement_arr = "
01 - Ain
02 - Aisne
03 - Allier
04 - Alpes-de-Haute-Provence
05 - Hautes-alpes
06 - Alpes-maritimes
07 - Ardèche - Privas
08 - Ardennes
09 - Ariège
10 - Aube
11 - Aude
12 - Aveyron 
13 - Bouches-du-Rhône
14 - Calvados
15 - Cantal
16 - Charente
17 - Charente-maritime
18 - Cher
19 - Corrèze
2a - Corse-du-sud
2b - Haute-Corse
21 - Côte-d'Or
22 - Côtes-d'Armor
23 - Creuse
24 - Dordogne
25 - Doubs
26 - Drôme
27 - Eure
28 - Eure-et-loir
29 - Finistère
30 - Gard - Nîmes
31 - Haute-garonne
32 - Gers
33 - Gironde
34 - Hérault
35 - Ille-et-vilaine
36 - Indre
37 - Indre-et-loire
38 - Isère
39 - Jura
40 - Landes
41 - Loir-et-cher
42 - Loire
43 - Haute-loire
44 - Loire-atlantique
45 - Loiret
46 - Lot
47 - Lot-et-garonne
48 - Lozère
49 - Maine-et-loire
50 - Manche
51 - Marne
52 - Haute-marne
53 - Mayenne
54 - Meurthe-et-moselle
55 - Meuse
56 - Morbihan
57 - Moselle
58 - Nièvre
59 - Nord
60 - Oise
61 - Orne
62 - Pas-de-calais
63 - Puy-de-dôme
64 - Pyrénées-atlantiques
65 - Hautes-Pyrénées
66 - Pyrénées-orientales
67 - Bas-rhin
68 - Haut-rhin
69 - Rhône
70 - Haute-saône
71 - Saône-et-loire
72 - Sarthe
73 - Haute-savoie
74 - Haute-savoie
75 - Paris
76 - Seine-maritime
77 - Seine-et-marne
78 - Yvelines
79 - Deux-sèvres
80 - Somme
81 - Tarn
82 - Tarn-et-garonne
83 - Var
84 - Vaucluse
85 - Vendée
86 - Vienne
87 - Haute-vienne
88 - Vosges
89 - Yonne
90 - Territoire de belfort 
91 - Essonne
92 - Hauts-de-seine
93 - Seine-Saint-Denis
94 - Val-de-marne
95 - Val-d'oise
971 - Guadeloupe
972 - Martinique
973 - Guyane
974 - La réunion
976 - Mayotte".tr('- ', '')departement_arr = departement_arr.map { |n| n.split(/(\d+)/) }
departement_arr = departement_arr.map { |n| n.reject { |c| c.empty? } }
cities = second
cities =cities.drop(0)#Programme pour construire ça {:city => "Ville", :code_postal => "Code Postal" :departement => "Departement"}newa = []
cities.size.times do |i|
newa << {:city => cities[i][0].to_s, :code_postal => cities[i][1].to_s }
end

=end
a = "
Allée
Avenue
Boulevard
Carrefour
Chemin
Chaussée
Cité
Corniche
Cours
Domaine
Descente
Ecart
Esplanade
Faubourg
Grande Rue
Hameau
Halle
Impasse
Lieu-dit
Lotissement
Marché
Montée
Passage
Place
Plaine
Plateau
Promenade
Parvis
Quartier
Quai
Résidence
Ruelle
Rocade
Rond-point
Route
Rue
Sente-Sentier
Square
Terre-plein
Traverse
".split("\n")print a