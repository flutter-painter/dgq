class Musician {
  final String firstName;
  final String lastName;
  final String instrument;
  final String bio;
  final String photoPath;
  final bool isQuartet;
  Musician(
      this.firstName, this.lastName, this.instrument, this.bio, this.photoPath,
      {required this.isQuartet});
}

List<Musician> musicians = [
  Musician(
    "Denis",
    "Gancel",
    "compo & piano",
    """aime jouer et rire avec ses amis du grand large.
Il est né à Fécamp à deux pas des falaises d’Étretat. Il a étudié le piano dans la classe de Jeannine Bonjean à l’École normale de musique de Paris.
Il a étudié la direction d’orchestre avec Jean-Pierre Loré et Pierre Dervaux et directeur artistique de plusieurs festivals : Les Boffilies à Paris, Magnificat à Paray-le-Monial, Musique en Pays de Caux… Il rencontre Jacques Loussier dans les années 90 qui lui donnent le goût de la musique sans frontières et sans œillères. Après avoir créé Bonsoir Paris Jazz en 2010 il travaille le jazz et la composition. Il crée le Denis Gancel Quartet en 2015 se produit dans les festivals et sort son premier album «Miscellanées» début 2017 suivi de «Bric à Brac» en 2019 et de Puzzle en 2021
    """,
    'assets/musicians/denis.png',
    isQuartet: true,
  ),
  Musician(
    "Nicolas",
    "Chelly",
    "basse",
    """est un enfant de l’océan. À Biarritz, il a une vue à 360° sur la plage des Basques et toute l’Espagne.
C’est là qu’il apprend la basse et la contrebasse, au conservatoire de Bayonne. Après avoir joué dans le Sud-Ouest, il s'installe à Paris en 2001. Nicolas joue de toutes les musiques sans modération : du jazz à la pop,
de la chanson au Funk. Il participe à de nombreux enregistrements avec Tom Novembre, François Staal, Yasmin Shah, Oswaldo Nieto, Hidéhiko Kan… Il a sorti un premier album Old school bass en 2013 chez Ours Music.
    """,
    'assets/musicians/nicolas.png',
    isQuartet: true,
  ),
  Musician(
    "Philippe",
    "Nadeau",
    "clarinette & saxo",
    """est originaire de Charente, le long d’un fleuve paisible.
Mais ne vous y fiez pas ! Après des études aussi disparates que passionnantes, et des essais de vie normale et conformiste, l'appel de l'aventure musicale se fait pressant: Philippe croise au gré du temps des musiciens de tous pays et tous horizons. Il est fier d'avoir partagé des moments avec Francis Lai, Gérard Daguerre, Harry Connick Jr., Eddie Louiss, Bibi Louison, Rido Bayonne, Ray Lema, Laurent Garnier, Aqua Bassino, Philippe Poussard, Carmino d'Angelo, Halliday, Christelle Pereira, Joe Makholm, Baselli, Patrick Vincent, Leon Milo… 
Il fréquente aussi régulièrement que possible (comme ses trois amis du Quartet: Bach, Mozart, Haydn, Beethoven, Wagner, Holst, Schoenberg, Berg, Debussy, Ravel, Stravinsky, Varèse, Armstrong, Monk, Miles Davis, … et quelques peintres ou photographes.""",
    'assets/musicians/philippe.png',
    isQuartet: true,
  ),
  Musician(
    "Idehiko",
    "Kan",
    "batterie",
    """Né à Tokyo et arrivé très tôt en France, Hidé pratique la batterie depuis ses 14 ans. Il développe son approche personnelle au contact de musiques et de feelings différents: punk, free, blues, rock polymorphe, jazz roots… Dans les années 90, il commence à jouer dans les clubs de Paris et d’ailleurs. À partir de septembre 2004, il donne plusieurs concerts remarqués à la tête d'unquartetcomprenant Jean-Paul Adam, Max Mastella, et Clément Landais,quartetqui remporte les « Trophées du Sunside 2005» au titre des meilleures compositions.
Hidé s’investit ensuite dans l’association Jazz France Japon qui favorise les échanges artistiques entre musiciens de jazz Français et Japonais. Les choix esthétiques éclectiques de ce musicien-percutant curieux et ouvert se reflètent dans ses collaborations: Anne Ducros & Charito, jazz vocal international; Makoto Kuriya, jazz moderne; Jeff Fierling, free jazz; Emiko & KiriSute Gomen, minyo surf-pop psychédélique; Taramonium Project, medieval folk-jazz, LighthouseShore, pop celtique, Midnight Malt, folk-pop écossais...
Ses centres d'intérêt multiples et son amour de la liberté sont également perceptibles dans ses projets personnels: Koto to Evans, répertoire Bill Evans joué au koto, ou bien Tokaido Acoustic, avec la kotoïste Mieko Miyazaki qui mêle tradition japonaise et sons contemporains, ou encore Tokyo Paris Express avec le saxophoniste Hirokazu Ishida, qui propose un jazz-pop sophistiqué teinté d'accents soul seventies.
    Discographie:
    * «Soul Searching» Louis Beaudoin Quintet, 2019 (Jazz moderne)
    * «Bric à Brac» Denis Gancelquartet, 2019 (Cross-over jazz & classique)
    * «Departure» Tokyo Paris Express, 2017 (Jazz-pop)
    * «Cap 21: Vingtième Anniversaire Live» Michel Barbe Trio, 2016 (Jazz)
    * «The Rogue Mist Book» Lighthouse Shore, 2014 (Pop-rock celtique, taiko sur un titre)
    * «From the Inside» Louis BeaudoinQuartet, 2014 (Jazz moderne)
    * «Mulligan Vocal» Christophe Dunglas, 2014 (Jazz vocal)
    * «Crazy Stuff» Jeff Fierling, 2013 (Free jazz)
    * «Shyohatto» Emiko & KiriSute Gomen, 2013 (Minyo surf-pop psychédélique)
    * «De bleu sombre et d’or» Mojo Panique, 2009 (chanson blues)
    * «Universaire» Michel Barbe Trio, 2006 (Jazz)
    * «Etincelle» Pauline Lucas, 2003 (Jazz vocal)
    * «Le Songe de l’Athanor» Alexis Tcholakian Trio, 1999 (Jazz moderne)
    * «Trio Point de Vue» Alexis Tcholakian Trio, 1997 (Jazz moderne)
""",
    'assets/musicians/idehiko.png',
    isQuartet: true,
  ),
  Musician(
    "Frank",
    "Delpeuh",
    "trompette",
    "",
    'assets/musicians/frank.png',
    isQuartet: false,
  ),
  Musician(
    "Luis",
    "Camino",
    "percussions",
    """Compositeur, producteur, parolier, arrangeur et percussionniste, né à Donostia / San Sebastián, Gipuzkoa, Espagne.
Co-créateur en 1988 du groupe fusion afro-latino-pop "21 Japonesas". Musicien, parolier et producteur des quatre albums de la formation entre 1988/1995.
Quatre albums solos comme Luis Camino et Abya Yala… Abya Yala, InDiosincrasia, Musikisthan et Dancing Mantras (sorti uniquement en Inde).
Plus de 250 CD enregistrés avec percussions dans différents groupes et collaborations live telles que:
Celtas Cortos, Mecano, Alex Y Cristina (Rosenvinge), Alboka & Marta Sebestyen, Diego Vasallo, Mikel Laboa, Xabier Lete, Benito Lertxundi, Parafúnk, Iñaki Salvador, Pascal Gaigne, Denis Gancel Group, Javi P3z Orquesta, Mikel Urdangarín, Angela Cruces (Flamenco) et un long etcetera ...
Il signe et nomme son œuvre musicale comme "Luis Camino & Abya Yala"
""",
    'assets/musicians/luis.png',
    isQuartet: false,
  ),
  Musician(
    "Iñaki",
    "Diéguez",
    "accordéon",
    """Né à Irun en 1973, il débute ses études d’accordéoniste dès l’âge de 9 ans. Inaki
termine sa formation supérieure au Conservatoire de Saint Sébastien qui lui
décernera une mention exceptionnelle d’Honneur. Accordéoniste professionnel,
Auteur/Compositeur.
Inaki obtient de nombreux prix nationaux et internationaux. Il sera lauréat du
concours Gipuzkoa, puis classé premier des jeunes interprètes d’Espagne. Par la
suite il sera aussi consacré lauréat du Grand prix International de France, du
Concours International Arrasate puis de la Coupe du Monde (Munster, France).
L’ensemble de ces prix ont été obtenus dans la spécialité Accordéon Classique. Par
la suite Inaki délaissera la musique classique pour se concentrer à un répertoire
moderne.
Il a produit six CD en nom propre C’est ainsi qu’il a assuré la production musicale
du disque référence en Pays Basque « Lurra eta Maitasuna » de Pantxoa et Peio,
Gontzal Mendibil, Amaia Zubiria…
En octobre 2008 Inaki débute une collaboration musicale (direction,
arrangements…) avec le célèbre Cirque du Soleil. A ce titre, il prendra une part
prépondérante dans la création du célèbre show « OVO » (l’oeuf en Portugais) qui
contribue à l’immense succès de cette compagnie qui parcourt tous les continents.
""",
    'assets/musicians/inaki.png',
    isQuartet: false,
  ),
];
