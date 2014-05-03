# Newspaper2

IDU00200 (2014) Vaheülesanne 2: Veebirakenduste raamistike (web application frameworks) kasutamine.


## Kasutatud raamistiku omadused


### Generaatorid

Kasutades `rails generate ...` käsurea tööriista, genereerisin *model* ja *controller* klassid
`Newspaper` ja `NewspapersController`.


### Migratsioonid

Kasutades Rails-i poolt pakutavaid migratsioone, genereerisin käsurea tööriistaga `rake db:migrate`
PostgreSQL tabeli `newspaper` ja `rake db:seed` käsuga lisasin loodud tabelisse esialgsed väärtused,
mis olid eelnevalt lisatud `db/seeds.rb` faili.


### Suunamised

Kasutades Rails-i poolt pakutavaid suunamisi (*routing*), tekitasin vastava suunamise eelnevalt loodud
kontrollerile. Kontrolli poolt teenindatavateks meetoditeks valisin välja:

  * `(GET) newspapers/index` - kuvab kõiki andmebaasi tabelist võetud objekte.
  * `(GET) newspapers/1/edit` - kuvab id alusel andmebaasist võetud ühe andmeobjekti andmete
    muutmist võimaldava HTML vormi.
  * `(PATCH) newspapers/1` - salvestab HTML-vormist saadetud andmed andmebaasis.
  * `(GET) newspapers/1` - kuvab id alusel andmebaasist võetud ühe andmeobjekti andmed JSON kujul
    (teenindab ainult AJAX päringuid).

Määrasin rakenduse vaikimisi kontrolleriks `newspapers#index`.


### Vaated

Lehekülgede esitamiseks kasutasin HAML märgistuskeelt.


### Logimine

Kuna Rails väljastab piisavalt detailset logi, siis käsitsi logimist ei olnud vaja juurde lisada.
Rakenduse logi faili kuvatakse läbi `StaticController` klassi.


### Andmebaas

Andmebaasiga suhtlemiseks kasutasin Rails-i sisseehitatud vaikimisi kasutatavad *ORM* lahendust
nimega `ActiveRecord`. Täiendavaid andmebaasimeetodeid juurde luua ei olnud vaja, kuna kõik
vajadused olid kaetud raamistiku poolt pakutavate meetodite näol.


### Testimine

Kuna ise DAO meetodeid leiutama ei pidanud, siis ei ole ka vajadust seda testida. `ActiveRecord` ise
on tõenäoliselt juba testidega kaetud ning antud rakenduse testid ei pea testima kasutatavat
komponenti.


### Valideerimine

Kasutatud Rails-i poolt pakutavaid valideerimisi. Kuupäeva formaadi kontrollimine nõudis
loomingulisemat lähenemist, kuna raamistiku poolt teisendatakse etteantud tekstiline sisend
kuupäevaks enne valideerimisi. Lahenduseks sai lisatud eraldi väli tekstilise kuju hoidmiseks, mida
sai ka valideerida. Salvestamisel kasutati `before_save` *callback*-i, et kuupäeva väli väärtustada
juba valideeritud tekstiväljast.
