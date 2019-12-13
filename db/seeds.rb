# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


cities_array = ["Paris", "Marseille", "Lyon", "Toulouse", "Nice", "Nantes", "Strasbourg", "Montpellier", "Bordeaux", "Lille", "Rennes", "Reims", "Le Havre", "Saint-Étienne", "Toulon", "Grenoble", "Dijon", "Nîmes", "Angers", "Villeurbanne", "Le Mans", "Saint-Denis", "Aix-en-Provence", "Clermont-Ferrand", "Brest", "Limoges", "Tours", "Amiens", "Perpignan", "Metz", "Besançon", "Boulogne-Billancourt", "Orléans", "Mulhouse", "Rouen", "Saint-Denis", "Caen", "Argenteuil", "Saint-Paul", "Montreuil", "Nancy", "Roubaix", "Tourcoing", "Nanterre", "Avignon", "Vitry-sur-Seine", "Créteil", "Dunkirk", "Poitiers", "Asnières-sur-Seine", "Courbevoie", "Versailles", "Colombes", "Fort-de-France", "Aulnay-sous-Bois", "Saint-Pierre", "Rueil-Malmaison", "Pau", "Aubervilliers", "Le Tampon", "Champigny-sur-Marne", "Antibes", "Béziers", "La Rochelle", "Saint-Maur-des-Fossés", "Cannes", "Calais", "Saint-Nazaire", "Mérignac", "Drancy", "Colmar", "Ajaccio", "Bourges", "Issy-les-Moulineaux", "Levallois-Perret", "La Seyne-sur-Mer", "Quimper", "Noisy-le-Grand", "Villeneuve-d'Ascq", "Neuilly-sur-Seine", "Valence", "Antony", "Cergy", "Vénissieux", "Pessac", "Troyes", "Clichy", "Ivry-sur-Seine", "Chambéry", "Lorient", "Les Abymes", "Montauban", "Sarcelles", "Niort", "Villejuif", "Saint-André", "Hyères", "Saint-Quentin", "Beauvais", "Épinay-sur-Seine", "Cayenne", "Maisons-Alfort", "Cholet", "Meaux", "Chelles", "Pantin", "Évry", "Fontenay-sous-Bois", "Fréjus", "Vannes", "Bondy", "Le Blanc-Mesnil", "La Roche-sur-Yon", "Saint-Louis", "Arles", "Clamart", "Narbonne", "Annecy", "Sartrouville", "Grasse", "Laval", "Belfort", "Bobigny", "Évreux", "Vincennes", "Montrouge", "Sevran", "Albi", "Charleville-Mézières", "Suresnes", "Martigues", "Corbeil-Essonnes", "Saint-Ouen", "Bayonne", "Cagnes-sur-Mer", "Brive-la-Gaillarde", "Carcassonne", "Massy", "Blois", "Aubagne", "Saint-Brieuc", "Châteauroux", "Chalon-sur-Saône", "Mantes-la-Jolie", "Meudon", "Saint-Malo", "Châlons-en-Champagne", "Alfortville", "Sète", "Salon-de-Provence", "Vaulx-en-Velin", "Puteaux", "Rosny-sous-Bois", "Saint-Herblain", "Gennevilliers", "Le Cannet", "Livry-Gargan", "Saint-Priest", "Istres", "Valenciennes", "Choisy-le-Roi", "Caluire-et-Cuire", "Boulogne-sur-Mer", "Bastia", "Angoulême", "Garges-lès-Gonesse", "Castres", "Thionville", "Wattrelos", "Talence", "Saint-Laurent-du-Maroni", "Douai", "Noisy-le-Sec", "Tarbes", "Arras", "Alès", "La Courneuve", "Bourg-en-Bresse", "Compiègne", "Gap", "Melun", "Le Lamentin", "Rezé", "Saint-Germain-en-Laye", "Marcq-en-Barœul", "Gagny", "Anglet", "Draguignan", "Chartres", "Bron", "Bagneux", "Colomiers", "Saint-Martin-d'Hères", "Pontault-Combault", "Montluçon", "Joué-lès-Tours", "Saint-Joseph", "Poissy", "Savigny-sur-Orge", "Cherbourg-Octeville", "Montélimar", "Villefranche-sur-Saône", "Stains", "Saint-Benoît", "Bagnolet", "Châtillon", "Le Port", "Sainte-Geneviève-des-Bois", "Échirolles", "Roanne", "Villepinte", "Saint-Chamond", "Conflans-Sainte-Honorine", "Auxerre", "Nevers", "Neuilly-sur-Marne", "La Ciotat", "Tremblay-en-France", "Thonon-les-Bains", "Vitrolles", "Haguenau", "Six-Fours-les-Plages", "Agen", "Creil", "Annemasse", "Saint-Raphaël", "Marignane", "Romans-sur-Isère", "Montigny-le-Bretonneux", "Le Perreux-sur-Marne", "Franconville", "Mâcon", "Saint-Leu", "Cambrai", "Châtenay-Malabry", "Sainte-Marie", "Villeneuve-Saint-Georges", "Houilles", "Épinal", "Lens", "Liévin", "Les Mureaux", "Schiltigheim", "La Possession", "Meyzieu", "Dreux", "Nogent-sur-Marne", "Plaisir", "Mont-de-Marsan", "Palaiseau", "Châtellerault", "Goussainville", "L'Haÿ-les-Roses", "Viry-Châtillon", "Vigneux-sur-Seine", "Chatou", "Trappes", "Clichy-sous-Bois", "Rillieux-la-Pape", "Villenave-d'Ornon", "Maubeuge", "Charenton-le-Pont", "Malakoff", "Matoury", "Dieppe", "Athis-Mons", "Savigny-le-Temple", "Périgueux", "Baie-Mahault", "Vandoeuvre-lès-Nancy", "Pontoise", "Aix-les-Bains", "Cachan", "Vienne", "Thiais", "Orange", "Saint-Médard-en-Jalles", "Villemomble", "Saint-Cloud", "Saint-Laurent-du-Var", "Yerres", "Saint-Étienne-du-Rouvray", "Sotteville-lès-Rouen", "Draveil", "Le Chesnay", "Bois-Colombes", "Le Plessis-Robinson", "La Garenne-Colombes", "Lambersart", "Soissons", "Pierrefitte-sur-Seine", "Carpentras", "Villiers-sur-Marne", "Vanves", "Menton", "Bergerac", "Ermont", "Bezons", "Grigny", "Guyancourt", "Saumur", "Herblay", "Ris-Orangis", "Villiers-le-Bel", "Bourgoin-Jallieu", "Vierzon", "Le Gosier", "Décines-Charpieu", "Hénin-Beaumont", "Fresnes", "Aurillac", "Sannois", "Vallauris", "Illkirch-Graffenstaden", "Alençon", "Élancourt", "Tournefeuille", "Bègles", "Gonesse", "Oullins", "Brunoy", "Taverny", "Armentières", "Montfermeil", "Rambouillet", "Villeparisis", "Le Kremlin-Bicêtre", "Sucy-en-Brie", "Kourou", "Montbéliard", "Romainville", "Cavaillon", "Saint-Dizier", "Brétigny-sur-Orge", "Saint-Sébastien-sur-Loire", "Saintes", "La Teste-de-Buch", "Villeneuve-la-Garenne", "Béthune", "Bussy-Saint-Georges", "Vichy", "La Garde", "Agde", "Laon", "Sens", "Lunel", "Miramas", "Biarritz", "Le Grand-Quevilly", "Orvault", "Les Ulis", "Champs-sur-Marne", "Rochefort", "Muret", "Sainte-Anne", "Eaubonne", "Étampes", "Gradignan", "Vernon", "Petit-Bourg", "Libourne", "Abbeville", "Rodez", "Saint-Ouen-l'Aumône", "Torcy", "Maisons-Laffitte", "Montgeron", "Villeneuve-sur-Lot", "Cormeilles-en-Parisis", "Épernay", "Sèvres", "Dole", "Le Robert", "Le Bouscat", "Blagnac", "Frontignan", "Cenon", "Mandelieu-la-Napoule", "Vertou", "Les Lilas", "Bruay-la-Buissière", "Les Pavillons-sous-Bois", "Chaumont", "Roissy-en-Brie", "Le Moule", "Le Petit-Quevilly", "Manosque", "Saint-Mandé", "Fontenay-aux-Roses", "Orly", "Le Creusot", "Oyonnax", "La Madeleine", "Sainte-Suzanne", "Millau", "Combs-la-Ville", "Fontaine", "Deuil-la-Barre", "Coudekerque-Branche", "Auch", "Lanester", "Beaune", "Montigny-lès-Metz", "Hazebrouck", "Longjumeau", "Sainte-Foy-lès-Lyon", "Forbach", "Sarreguemines", "Mons-en-Barœul", "La Valette-du-Var", "Hérouville-Saint-Clair", "Morsang-sur-Orge", "Grande-Synthe", "La Celle-Saint-Cloud", "Lisieux", "Croix", "Dammarie-les-Lys", "Vélizy-Villacoublay", "Wasquehal", "Saint-Gratien", "Halluin", "Neuilly-Plaisance", "Montmorency", "Dax", "Lagny-sur-Marne", "Le Mée-sur-Seine", "Saint-Genis-Laval", "Fleury-les-Aubrais", "Loos", "Gif-sur-Yvette", "Denain", "Saint-Dié-des-Vosges", "Sainte-Rose", "Saint-Michel-sur-Orge"]
type_of_property_array = ["Bureaux", "Entrepôts / Locaux d'activités / Logistique", "Commerces", "Maison", "Appartement", "Residence" "Villa", "Studio", "Loft", "Hôtels"]
offer_array = ["Basique", "Medium", "Premium"]
offer_description_array = ["1 annonce gratuite ", "5 annonces maximum", "100 annonces maximum"]
offer_hash = [{:name => "Basique", :description => "1 annonce gratuite", :end_date => "", :price => "0"},{:name => "Medium", :description => "5 annonces maximum", :end_date => "#{Time.now + 1.month}",:price => "5"},{:name => "Premium", :description => "100 annonces maximum", :end_date => "#{Time.now + 1.month}",:price => "50"}]
road_type_array = ["Rue piétonne", "Allée", "Avenue", "Boulevard", "Carrefour", "Chemin", "Chaussée", "Cité", "Corniche", "Cours", "Domaine", "Descente", "Ecart", "Esplanade", "Faubourg", "Grande Rue", "Hameau", "Halle", "Impasse", "Lieu-dit", "Lotissement", "Marché", "Montée", "Passage", "Place", "Plaine", "Plateau", "Promenade", "Parvis", "Quartier", "Quai", "Résidence", "Ruelle", "Rocade", "Rond-point", "Route", "Rue", "Sente-Sentier", "Square", "Terre-plein", "Traverse"]
operation_type_array = ["Vente", "Location"]
heatings_array = ["Chauffage à bois", "Électrique", "Gaz", "Fioul", "Plancher chauffant"]
secondary_criteria_array = ["Ensoleillement", "Pollution", "Calme", "Connectivité", "Sécurité", "Fiscalité", "Commerces", "Services"]
tertiary_criteria_array = ["Piscine", "Ascenseur", "Sous-sol", "Balcon", "Concierge", "Parking", "Dernier étage", "Acces handicapé", "Jardin", "Meublé"]

#require 'Faker'
Faker::Config.locale = 'fr'

type_of_property_array.each do |type_of_property|
	TypeOfProperty.create(:name => type_of_property)
	#puts "#{type_of_property} add to type of property table"
end
puts "The type of property table has been initialized"

offer_hash.each do |offer|
	Offer.create(offer)
	#puts "#{offer} add to offer table"
end

puts "The offer table has been initialized"

road_type_array.each do |road_type|
	RoadType.create(:name => road_type)
	#puts "#{road_type} add to road type table"
end
puts "The road type table has been initialized"

operation_type_array.each do |operation_type|
	OperationType.create(:name => operation_type)
	#puts "#{operation_type} add to operation type table"
end
puts "The operation type table has been initialized"

heatings_array.each do |heating|
	Heating.create(:name => heating)
	#puts "#{heating} add to operation type table"
end
puts "The heating type table has been initialized"

secondary_criteria_array.each do |secondary_criteria|
	SecondaryCriteria.create(:name => secondary_criteria)
	#puts "#{secondary_criterias} add to operation type table"
end
puts "The secondary criteria type table has been initialized"

tertiary_criteria_array.each do |tertiary_criteria|
	TertiaryCriteria.create(:name => tertiary_criteria)
	#puts "#{tertiary_criterias} add to operation type table"
end
puts "The tertiary criteria type table has been initialized"

1.times do
	Country.create(:name => "France")
end
puts "The operation type table has been initialized"

1.times do
	User.create(email: "theperfecthouseia@gmail.com", password:"12345678", is_admin: true)
end
puts "A user has been created"

newcityarray = []
cities_array.each do |city|
	newcityarray << city.downcase.tr(" -", "").tr("é", "e")
end
#require "google_drive"
session = GoogleDrive::Session.from_service_account_key("config.json")
ws = session.spreadsheet_by_key("1NxO5lRZIhqkrq2cG3N3pRaGXUHKOT8VjQO-dHMNM82E").worksheets[1]
init_first_case = ws.rows.size + 1
init_first_case.times do |i|
	if ws[i+1, 1] != nil && newcityarray.include?(ws[i+1, 1].downcase.tr(" -", "").tr("é", "e"))
		City.create(:name => ws[i+1, 1], :zipcode => ws[i+1, 2])
		puts i
	end

end
puts "The city table has been initialized"

12.times do |k|

	a = Accomodation.create(road_number: rand(1..99), road_name: Faker::Address.street_name,road_type: RoadType.all.sample, living_space: rand(25..75), price: rand(30..100)*10, floor: rand(1..5), floors_inside: rand(1..3), rooms: rand(1..5), orientation:'est', ges:'A', longitude: 2.300, latitude: 45.800, title: 'appartement à louer', type_of_property: TypeOfProperty.all.sample, operation_type: OperationType.all.sample, city: City.all.sample, country: Country.all.sample, owner: User.all.sample, description: Faker::Lorem.paragraph(sentence_count: 8))
end

puts "accomodations created"

Accomodation.all.each do |a|
	rand(0..5).times do
		JoinTableTertiary.create(accomodation: a, tertiary_criteria: TertiaryCriteria.all.sample)
	end
end

puts "criteria created"
