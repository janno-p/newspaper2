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


### *Routing*

Kasutades Rails-i poolt pakutavaid suunamisi, tekitasin vastava suunamise eelnevalt loodud
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
