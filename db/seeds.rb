# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# THEATERS

t1 = Theater.create(name: "Sala 1")
t2 = Theater.create(name: "Sala 2")
t3 = Theater.create(name: "Sala 3")
t4 = Theater.create(name: "Sala 4")
t5 = Theater.create(name: "Sala 5")

["A", "B", "C", "D", "E", "F", "G", "J", "K", "L", "M", "N"].each do |row|
	i = 1
	while i <= 24
		Seat.create(row: row, number: i, theater_id: t1.id)
		i = i + 1
	end
end

["A", "B", "C", "D", "E", "F", "G", "J", "K", "L"].each do |row|
	i = 1
	while i <= 18
		Seat.create(row: row, number: i, theater_id: t2.id)
		Seat.create(row: row, number: i, theater_id: t3.id)
		i = i + 1
	end
end

["A", "B", "C", "D", "E", "F", "G", "J", "K"].each do |row|
	i = 1
	while i <= 14
		Seat.create(row: row, number: i, theater_id: t4.id)
		Seat.create(row: row, number: i, theater_id: t5.id)
		i = i + 1
	end
end

# MOVIES

m1 = Movie.create(title: "Capitan America: Civil War", plot: "Il nuovo film Marvel Captain America 3 Civil War vede Steve Rogers al comando della nuova squadra degli Avengers, intenti a proseguire la loro lotta per salvaguardare l'umanità. Ma, quando un altro incidente internazionale in cui sono coinvolti gli Avengers provoca dei danni collaterali, le pressioni politiche chiedono a gran voce l’installazione di un sistema di responsabilità, presieduto da un consiglio d'amministrazione che sorvegli e diriga il team. Questa nuova dinamica divide gli Avengers in due fazioni: una è capeggiata da Steve Rogers, il quale desidera che gli Avengers rimangano liberi dalle interferenze governative, mentre l'altra è guidata da Tony Stark, che ha sorprendentemente deciso di sostenere il sistema di vigilanza istituito dal governo.", duration: 146, director: "Anthony Russo, Joe Russo", genere: "Azione, Fantascienza, Fantasy", trailer_url: "60rieTQs1RM")
a11 = Actor.create(name:"Chris Evans")
a12 = Actor.create(name:"Robert Downey Jr.")
a13 = Actor.create(name:"Scarlett Johansson")
a14 = Actor.create(name:"Sebastian Stan")
a15 = Actor.create(name:"Jeremy Renner")
m1.actors << [a11, a12, a13, a14, a15]
i = 0
while i < 7
	Show.create(datetime: (DateTime.now + (i * 24).hours).beginning_of_day() + 16.hours + 00.minutes, movie_id: m1.id, theater_id: t1.id, price: 5)
	Show.create(datetime: (DateTime.now + (i * 24).hours).beginning_of_day() + 18.hours + 40.minutes, movie_id: m1.id, theater_id: t1.id, price: 5)
	Show.create(datetime: (DateTime.now + (i * 24).hours).beginning_of_day() + 21.hours + 10.minutes, movie_id: m1.id, theater_id: t1.id, price: 5)
	i = i + 1
end
while i < 14
	Show.create(datetime: (DateTime.now + (i * 24).hours).beginning_of_day() + 16.hours + 00.minutes, movie_id: m1.id, theater_id: t2.id, price: 5)
	Show.create(datetime: (DateTime.now + (i * 24).hours).beginning_of_day() + 18.hours + 40.minutes, movie_id: m1.id, theater_id: t2.id, price: 5)
	Show.create(datetime: (DateTime.now + (i * 24).hours).beginning_of_day() + 21.hours + 10.minutes, movie_id: m1.id, theater_id: t2.id, price: 5)
	i = i + 1
end
while i < 21
	Show.create(datetime: (DateTime.now + (i * 24).hours).beginning_of_day() + 16.hours + 00.minutes, movie_id: m1.id, theater_id: t4.id, price: 5)
	Show.create(datetime: (DateTime.now + (i * 24).hours).beginning_of_day() + 18.hours + 40.minutes, movie_id: m1.id, theater_id: t4.id, price: 5)
	Show.create(datetime: (DateTime.now + (i * 24).hours).beginning_of_day() + 21.hours + 10.minutes, movie_id: m1.id, theater_id: t4.id, price: 5)
	i = i + 1
end



m2 = Movie.create(title: "Appena apro gli occhi", plot: "La storia è ambientata a Tunisi, nell'estate 2010, pochi mesi prima della Rivoluzione. La diciottenne Farah si è appena diplomata e la sua famiglia vorrebbe iscriverla alla facoltà di Medicina. Lei non la pensa allo stesso modo. Canta in un gruppo politico rock. Vuole essere una cittadina attiva e impegnata in difesa delle libertà civili, ma vuole anche divertirsi, scoprire l'amore e vivere la città di notte.", duration: 102, director: "Leyla Bouzid", genere: "Drammatico", trailer_url: "BThInkmIX9Y")
a21 = Actor.create(name:"Baya Medhaffer")
a22 = Actor.create(name:"Ghalia Benali")
a23 = Actor.create(name:"Montassar Ayari")
a24 = Actor.create(name:"Aymen Omrani")
m2.actors << [a21, a22, a23, a24]
i = 0
while i < 7
	Show.create(datetime: (DateTime.now + (i * 24).hours).beginning_of_day() + 16.hours + 00.minutes, movie_id: m2.id, theater_id: t2.id, price: 5)
	Show.create(datetime: (DateTime.now + (i * 24).hours).beginning_of_day() + 18.hours + 40.minutes, movie_id: m2.id, theater_id: t2.id, price: 5)
	Show.create(datetime: (DateTime.now + (i * 24).hours).beginning_of_day() + 21.hours + 10.minutes, movie_id: m2.id, theater_id: t2.id, price: 5)
	i = i + 1
end
while i < 14
	Show.create(datetime: (DateTime.now + (i * 24).hours).beginning_of_day() + 16.hours + 00.minutes, movie_id: m2.id, theater_id: t4.id, price: 5)
	Show.create(datetime: (DateTime.now + (i * 24).hours).beginning_of_day() + 18.hours + 40.minutes, movie_id: m2.id, theater_id: t4.id, price: 5)
	Show.create(datetime: (DateTime.now + (i * 24).hours).beginning_of_day() + 21.hours + 10.minutes, movie_id: m2.id, theater_id: t4.id, price: 5)
	i = i + 1
end



m3 = Movie.create(title: "Zona d’ombra", plot: "Will Smith nei panni del medico che con la sua scoperta fece tremare una delle organizzazioni più potenti del mondo. Un battaglia indimenticabile tratta da una storia vera. Il film racconta la storia di Bennet Omalu, il neuropatologo che cercò in ogni modo di portare all'attenzione pubblica una sua importante scoperta: una malattia degenerativa del cervello che colpiva i giocatori di football vittime di ripetuti colpi subiti alla testa. Durante la sua ostinata ricerca, il medico tentò di smantellare lo status quo dell'ambiente sportivo che, per interessi politici ed economici, metteva consapevolmente a repentaglio la salute degli atleti.", duration: 123, director: "Peter Landesman", genere: "Drammatico", trailer_url: "WK6NoUU7-XI")
a31 = Actor.create(name:"Will Smith")
a32 = Actor.create(name:"Alec Baldwin")
a33 = Actor.create(name:"Luke Wilson")
m2.actors << [a31, a32, a33]
i = 0
while i < 7
	Show.create(datetime: (DateTime.now + (i * 24).hours).beginning_of_day() + 16.hours + 00.minutes, movie_id: m3.id, theater_id: t3.id, price: 5)
	Show.create(datetime: (DateTime.now + (i * 24).hours).beginning_of_day() + 18.hours + 40.minutes, movie_id: m3.id, theater_id: t3.id, price: 5)
	Show.create(datetime: (DateTime.now + (i * 24).hours).beginning_of_day() + 21.hours + 10.minutes, movie_id: m3.id, theater_id: t3.id, price: 5)
	i = i + 1
end
while i < 14
	Show.create(datetime: (DateTime.now + (i * 24).hours).beginning_of_day() + 16.hours + 00.minutes, movie_id: m3.id, theater_id: t5.id, price: 5)
	Show.create(datetime: (DateTime.now + (i * 24).hours).beginning_of_day() + 18.hours + 40.minutes, movie_id: m3.id, theater_id: t5.id, price: 5)
	Show.create(datetime: (DateTime.now + (i * 24).hours).beginning_of_day() + 21.hours + 10.minutes, movie_id: m3.id, theater_id: t5.id, price: 5)
	i = i + 1
end

m4 = Movie.create(title: "Il libro della Giungla", plot: "Basato sui racconti senza tempo di Rudyard Kipling e ispirato al classico d'animazione Disney, Il Libro della Giungla è un'epica avventura live action, che vede protagonista Mowgli, un cucciolo d'uomo cresciuto da una famiglia di lupi. Mowgli è costretto a lasciare la giungla quando la temibile tigre Shere Khan, segnata dalle cicatrici dell'uomo, giura di eliminarlo per evitare che diventi una minaccia. Costretto ad abbandonare la sua unica casa, Mowgli s'imbarca in un avvincente viaggio alla scoperta di se stesso, guidato dal suo severo mentore, la pantera Bagheera e dallo spensierato orso Baloo. Lungo il cammino, Mowgli s'imbatte in creature selvatiche non proprio amichevoli, tra cui il pitone Kaa, che ipnotizza il cucciolo d'uomo con il suo sguardo e la sua voce seducente, e King Louie, il sovrano adulatore che tenta di costringere Mowgli a rivelargli il segreto del mortale e sfuggente fiore rosso: il fuoco.", duration: 105, director: "Jon Favreau", genere: "Avventura", trailer_url: "0AfgyMwDyN0")
a41 = Actor.create(name:"Neel Seth")
m2.actors << [a41]
i = 0
while i < 7
	Show.create(datetime: (DateTime.now + (i * 24).hours).beginning_of_day() + 16.hours + 00.minutes, movie_id: m4.id, theater_id: t4.id, price: 5)
	Show.create(datetime: (DateTime.now + (i * 24).hours).beginning_of_day() + 18.hours + 40.minutes, movie_id: m4.id, theater_id: t4.id, price: 5)
	Show.create(datetime: (DateTime.now + (i * 24).hours).beginning_of_day() + 21.hours + 10.minutes, movie_id: m4.id, theater_id: t4.id, price: 5)
	i = i + 1
end

m5 = Movie.create(title: "Criminal", plot: "L'agente della CIA Bill Pope viene ucciso e porta con sé nella tomba dei segreti fondamentali per salvare il mondo da unpotenziale attacco terroristico. Per risvegliare la coscienza di Bill e quindi i suoi ricordi, la CIA chiede l'aiuto del Dottor Franks, il quale ha sviluppato una nuovissima tecnica scienteifica per trasferire il pattern cerebrale di una persona nella mente di un'altra.", duration: 117, director: "Ariel Vromen", genere: "Azione, Drammatico, Thriller", trailer_url: "HV6YNWJLMvQ")
a51 = Actor.create(name:"Kevin Costner")
a52 = Actor.create(name:"Gary Oldman")
a53 = Actor.create(name:"Tommy Lee Jones")
m2.actors << [a51, a52, a53]
i = 0
while i < 7
	Show.create(datetime: (DateTime.now + (i * 24).hours).beginning_of_day() + 16.hours + 00.minutes, movie_id: m5.id, theater_id: t5.id, price: 5)
	Show.create(datetime: (DateTime.now + (i * 24).hours).beginning_of_day() + 18.hours + 40.minutes, movie_id: m5.id, theater_id: t5.id, price: 5)
	Show.create(datetime: (DateTime.now + (i * 24).hours).beginning_of_day() + 21.hours + 10.minutes, movie_id: m5.id, theater_id: t5.id, price: 5)
	i = i + 1
end



m6 = Movie.create(title: "X-Men: Apocalisse", plot: "Fin dall'alba della civiltà, è stato venerato come un Dio. Apocalisse, il primo e più potente mutante degli X-Men dell'universo Marvel, ha accumulato i poteri di molti altri mutanti, diventando immortale e invincibile. Risvegliandosi dopo migliaia di anni, resta deluso dal mondo e recluta un gruppo di potenti mutanti, fra cui un amareggiato Magneto, affidando loro il compito di purificare l'umanità e di creare un nuovo ordine su cui regnare. Mentre il destino della Terra è in bilico, Raven, con l'aiuto del Professor X, deve mettersi alla guida di un gruppo di giovani X-Men nel tentativo di fermare il loro più grande nemico e di salvare l’umanità dalla completa distruzione.", duration: 117, director: "Bryan Singer", genere: "Azione, Avventura", trailer_url: "")
a61 = Actor.create(name:"Jennifer Lawrence")
a62 = Actor.create(name:"James McAvoy")
a63 = Actor.create(name:"Hugh Jackman")
m2.actors << [a61, a62, a63]
i = 7
while i < 14
	Show.create(datetime: (DateTime.now + (i * 24).hours).beginning_of_day() + 16.hours + 00.minutes, movie_id: m6.id, theater_id: t1.id, price: 5)
	Show.create(datetime: (DateTime.now + (i * 24).hours).beginning_of_day() + 18.hours + 40.minutes, movie_id: m6.id, theater_id: t1.id, price: 5)
	Show.create(datetime: (DateTime.now + (i * 24).hours).beginning_of_day() + 21.hours + 10.minutes, movie_id: m6.id, theater_id: t1.id, price: 5)
	i = i + 1
end
while i < 21
	Show.create(datetime: (DateTime.now + (i * 24).hours).beginning_of_day() + 16.hours + 00.minutes, movie_id: m6.id, theater_id: t2.id, price: 5)
	Show.create(datetime: (DateTime.now + (i * 24).hours).beginning_of_day() + 18.hours + 40.minutes, movie_id: m6.id, theater_id: t2.id, price: 5)
	Show.create(datetime: (DateTime.now + (i * 24).hours).beginning_of_day() + 21.hours + 10.minutes, movie_id: m6.id, theater_id: t2.id, price: 5)
	i = i + 1
end



m7 = Movie.create(title: "Alice attraverso lo specchio", plot: "Fin dall'alba della civiltà, è stato venerato come un Dio. Apocalisse, il primo e più potente mutante degli X-Men dell'universo Marvel, ha accumulato i poteri di molti altri mutanti, diventando immortale e invincibile. Risvegliandosi dopo migliaia di anni, resta deluso dal mondo e recluta un gruppo di potenti mutanti, fra cui un amareggiato Magneto, affidando loro il compito di purificare l'umanità e di creare un nuovo ordine su cui regnare. Mentre il destino della Terra è in bilico, Raven, con l'aiuto del Professor X, deve mettersi alla guida di un gruppo di giovani X-Men nel tentativo di fermare il loro più grande nemico e di salvare l’umanità dalla completa distruzione.", duration: 117, director: " James Bobin", genere: "Avventura, Fantasy", trailer_url: "k2oDnZPf8-8")
a71 = Actor.create(name:"Mia Wasikowska")
a72 = Actor.create(name:"Johnny Depp")
a73 = Actor.create(name:"Anne Hathaway")
m2.actors << [a71, a72, a73]
i = 14
while i < 21
	Show.create(datetime: (DateTime.now + (i * 24).hours).beginning_of_day() + 16.hours + 00.minutes, movie_id: m7.id, theater_id: t1.id, price: 5)
	Show.create(datetime: (DateTime.now + (i * 24).hours).beginning_of_day() + 18.hours + 40.minutes, movie_id: m7.id, theater_id: t1.id, price: 5)
	Show.create(datetime: (DateTime.now + (i * 24).hours).beginning_of_day() + 21.hours + 10.minutes, movie_id: m7.id, theater_id: t1.id, price: 5)
	i = i + 1
end

# USERS

User.create!([
  {email: "admin@mail.com", password: "password", password_confirmation: "password", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 1, current_sign_in_at: "2015-02-06 14:02:10", last_sign_in_at: "2015-02-06 14:02:10", current_sign_in_ip: "127.0.0.1", last_sign_in_ip: "127.0.0.1", admin: true},
  {email: "user@mail.com", password: "password", password_confirmation: "password", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 1, current_sign_in_at: "2015-02-06 14:03:01", last_sign_in_at: "2015-02-06 14:03:01", current_sign_in_ip: "127.0.0.1", last_sign_in_ip: "127.0.0.1", admin: false}
])