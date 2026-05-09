#import "commun.typ": *
#page-style("Introduction & Installation", "01")
#style-titres()
#style-code()

#titre-fascicule("01", "Introduction à Typst", "Qu'est-ce que Typst ? Installation sous Fedora 43. Premier document.")

= Qu'est-ce que Typst ?

Typst est un système de composition typographique moderne, créé pour remplacer LaTeX avec une syntaxe bien plus accessible. Il compile des fichiers texte (`.typ`) en PDF haute qualité avec une vitesse quasi-instantanée.

#grid(columns: (1fr, 1fr), gutter: 12pt,
  block(fill: vert.lighten(88%), stroke: 0.5pt + vert, inset: 10pt, radius: 6pt)[
    #text(fill: vert, weight: "bold")[Pourquoi Typst ?]
    #list(
      [Syntaxe simple et lisible],
      [Compilation en millisecondes],
      [Couleurs et styles natifs],
      [Variables et fonctions intégrées],
      [Maths sans packages externes],
      [100 % open source (Apache 2.0)],
      [Développement très actif],
    )
  ],
  block(fill: rouge.lighten(88%), stroke: 0.5pt + rouge, inset: 10pt, radius: 6pt)[
    #text(fill: rouge, weight: "bold")[Limites actuelles]
    #list(
      [Moins de packages que LaTeX],
      [Communauté plus petite],
      [Moins mature pour les très longs documents académiques],
      [Pas de support BibTeX natif (packages disponibles)],
    )
  ]
)

= Installation sous Fedora 43

== Via DNF — méthode recommandée

#ex("Installation via DNF")
```bash
sudo dnf install typst
typst --version       # vérification
```

== Via Cargo — version la plus récente

#ex("Installation via Cargo (Rust)")
```bash
# Nécessite Rust installé
cargo install typst-cli

# Ajouter au PATH si pas déjà fait
echo 'export PATH="$HOME/.cargo/bin:$PATH"' >> ~/.bashrc
source ~/.bashrc
typst --version
```

== Via pip — bindings Python

#ex("Bindings Python pour automatisation")
```bash
pip install typst --break-system-packages

# Utilisation en Python
python3 -c "
import typst
typst.compile('mon-doc.typ', output='mon-doc.pdf')
print('PDF généré !')
"
```

#tip[Les bindings Python sont utiles pour automatiser la génération de PDF depuis des scripts, comme ce guide lui-même a été généré !]

= Éditeurs recommandés sous Linux

#table(
  columns: (auto, 1fr, auto),
  fill: (col, row) => if row == 0 { bleu } else if calc.odd(row) { gris } else { white },
  stroke: 0.4pt + grisc,
  align: (col, row) => if row == 0 { center } else { left },
  text(fill: white, weight: "bold")[Éditeur],
  text(fill: white, weight: "bold")[Points forts],
  text(fill: white, weight: "bold")[Note],
  [*VSCodium + Tinymist*], [Autocomplétion, hover docs, prévisualisation live, LSP complet], [★★★★★],
  [*Typesetter*], [Natif GTK, disponible sur Flathub, minimal, click-to-jump dans le PDF], [★★★★☆],
  [*Neovim + Tinymist*], [Ultra léger, puissant, LSP intégré via plugin], [★★★★☆],
  [*Vim + plugin*], [Minimaliste, fonctionne en SSH, terminal pur], [★★★☆☆],
)

#v(0.5em)
#block(fill: bleu.lighten(90%), stroke: 0.5pt + bleu, inset: 10pt, radius: 6pt)[
  #text(fill: bleu, weight: "bold")[Installation de Typesetter (KDE/GTK)]
  #v(0.3em)
  ```bash
  flatpak install flathub net.trowell.typesetter
  ```
  Typesetter offre une prévisualisation PDF en temps réel et un clic dans le PDF pour aller à la ligne source correspondante.
]

= Ton premier document Typst

== Créer le fichier

#ex("hello.typ — Fichier de départ")
```typ
// Ceci est un commentaire (ignoré à la compilation)

= Mon premier titre

Bonjour, voici mon *premier* document Typst !

Du texte _en italique_, du texte *en gras*, et les deux *_combinés_*.

Une liste :
- Premier élément
- Deuxième élément
- Troisième élément
```

== Compiler le document

#ex("Commandes de compilation")
```bash
# Compilation simple — génère hello.pdf
typst compile hello.typ

# Mode watch — recompile automatiquement à chaque sauvegarde
typst watch hello.typ

# Compiler et ouvrir directement le PDF
typst compile hello.typ --open

# Exporter en SVG ou PNG
typst compile hello.typ --format svg
typst compile hello.typ --format png --ppi 150
```

== Structure d'un document complet

#ex("Document avec configuration globale")
```typ
// ── Configuration globale ──
#set page(paper: "a4", margin: 2.5cm, numbering: "1")
#set text(font: "Liberation Serif", size: 11pt, lang: "fr")
#set par(justify: true, leading: 0.8em)
#set heading(numbering: "1.1.")

// ── Contenu ──
= Introduction

Voici le contenu de mon document, avec la numérotation
automatique des sections et des pages.

== Première section

Du texte *en gras* et _en italique_.

=== Sous-section

Un paragraphe justifié automatiquement.
```

#memo("Commandes essentielles")[
  #table(
    columns: (auto, 1fr),
    fill: (col, row) => if row == 0 { bleu } else if calc.odd(row) { gris } else { white },
    stroke: 0.4pt + grisc,
    text(fill: white, weight: "bold")[Commande],
    text(fill: white, weight: "bold")[Action],
    [`typst compile f.typ`], [Compiler → PDF],
    [`typst watch f.typ`], [Recompiler à chaque sauvegarde],
    [`typst compile f.typ --open`], [Compiler et ouvrir le PDF],
    [`typst compile f.typ --format svg`], [Exporter en SVG],
    [`typst --help`], [Aide complète],
    [`typst fonts`], [Lister les polices disponibles],
  )
  #v(0.4em)
  Extension des fichiers Typst : *`.typ`* — Commentaires : `//` ou `/* ... */`
]

= Comparaison avec LaTeX et Markdown

#table(
  columns: (auto, 1fr, 1fr, 1fr),
  fill: (col, row) => if row == 0 { bleu } else if calc.odd(row) { gris } else { white },
  stroke: 0.4pt + grisc,
  align: (col, row) => if row == 0 { center } else { left },
  text(fill: white, weight: "bold")[Critère],
  text(fill: white, weight: "bold")[LaTeX],
  text(fill: white, weight: "bold")[Typst],
  text(fill: white, weight: "bold")[Markdown],
  [Syntaxe], [Verbeuse], [Concise], [Très simple],
  [Compilation], [Lente (secondes)], [Instantanée (ms)], [Instantanée],
  [Couleurs natives], [Packages requis], [Oui, natif], [Bricolage HTML],
  [Fonctions/Variables], [Oui (complexe)], [Oui (simple)], [Non],
  [Maths], [Excellent], [Très bon], [Limité],
  [Paquets disponibles], [Des milliers], [En croissance], [Peu],
  [Courbe apprentissage], [Raide], [Douce], [Nulle],
)

#import "commun.typ": *
#page-style("Syntaxe de base", "02")
#style-titres()
#style-code()

#titre-fascicule("02", "Syntaxe de base", "Texte, formatage inline, titres, paragraphes, listes.")

= Formatage du texte

Le texte ordinaire s'écrit directement, sans aucune balise. Le formatage inline utilise des caractères spéciaux simples.

== Gras, italique, code

#ex("Formatage inline de base")
```typ
Texte *en gras* avec des astérisques.
Texte _en italique_ avec des underscores.
Texte *_gras et italique_* combinés.

Code inline : `print("bonjour")` avec des backticks.

Texte barré : #strike[texte barré]
Texte souligné : #underline[texte souligné]
Texte en petites majuscules : #smallcaps[Petites Majuscules]
```

== Exposants, indices, espaces

#ex("Exposants, indices et espaces spéciaux")
```typ
Exposant : x#super[2] + y#super[2] = r#super[2]
Indice   : H#sub[2]O  —  CO#sub[2]  —  Fe#sub[3]O#sub[4]

// Espace insécable (empêche le retour à la ligne entre les mots)
M.~Dupont travaille à Paris.

// Retour à la ligne forcé (dans un paragraphe)
Ligne 1 \
Ligne 2 sur la même ligne logique
```

#memo("Formatage inline — Antisèche")[
  #table(
    columns: (auto, auto, 1fr),
    fill: (col, row) => if row == 0 { bleu } else if calc.odd(row) { gris } else { white },
    stroke: 0.4pt + grisc,
    text(fill: white, weight: "bold")[Syntaxe],
    text(fill: white, weight: "bold")[Résultat],
    text(fill: white, weight: "bold")[Description],
    [`*texte*`],          [*gras*],              [astérisques],
    [`_texte_`],          [_italique_],          [underscores],
    [`*_texte_*`],        [*_gras+ital._*],      [combinaison],
    [`#strike[texte]`],   [#strike[texte]],      [barré],
    [`#underline[texte]`],[#underline[texte]],   [souligné],
    [`#smallcaps[texte]`],[#smallcaps[Texte]],   [petites majuscules],
    [`#super[n]`],        [x#super[n]],          [exposant],
    [`#sub[n]`],          [x#sub[n]],            [indice],
    [`~`],                [espace],              [espace insécable],
    [`\` + espace],       [↵],                   [retour à la ligne forcé],
    [`---`],              [—],                   [tiret cadratin],
    [`--`],               [–],                   [tiret demi-cadratin],
  )
]

= Titres et structure

Les titres se créent avec des signes `=`. Chaque `=` supplémentaire descend d'un niveau hiérarchique.

#ex("Niveaux de titres — Typst supporte jusqu'à 6 niveaux")
```typ
= Titre de niveau 1        (Chapitre)
== Titre de niveau 2       (Section)
=== Titre de niveau 3      (Sous-section)
==== Titre de niveau 4     (Paragraphe)
===== Titre de niveau 5    (Sous-paragraphe)
====== Titre de niveau 6   (Micro-section)
```

== Numérotation automatique des titres

#ex("Activer la numérotation")
```typ
// En début de document
#set heading(numbering: "1.1.")

// Différents formats disponibles
#set heading(numbering: "1.")           // 1. / 2. / 3.
#set heading(numbering: "1.1.")         // 1.1. / 1.2. / 2.1.
#set heading(numbering: "I.A.1.")       // Romain + lettre + chiffre
#set heading(numbering: "(1)")          // (1) / (2)
```

#tip[Le format de numérotation suit la même syntaxe que `#counter(page).display("...")`. Les lettres `1`, `a`, `A`, `i`, `I` représentent respectivement les chiffres arabes, lettres minuscules, majuscules, romains minuscules et majuscules.]

= Paragraphes et espacement

Un paragraphe se crée naturellement par une ligne vide. Typst gère l'espacement via `#set par()`.

#ex("Contrôle des paragraphes")
```typ
#set par(
  justify: true,      // justification du texte
  leading: 0.8em,     // interligne (entre les lignes)
  spacing: 1.2em,     // espacement entre paragraphes
  first-line-indent: 1.5em,  // retrait de première ligne
)

Premier paragraphe. Le texte est justifié sur toute la largeur
de la colonne de texte, créant des bords droits à gauche et à droite.

Deuxième paragraphe avec retrait de première ligne. L'espacement
entre les deux paragraphes est contrôlé par le paramètre `spacing`.
```

== Espacement vertical et horizontal manuel

#ex("Espacement manuel")
```typ
Texte au-dessus.
#v(1cm)        // espace vertical de 1 cm
Texte en dessous après 1 cm d'espace.

// Espacement horizontal
Début du texte. #h(2cm) Suite après 2 cm.

// Espace négatif (rapprocher du contenu)
#v(-0.3em)

// Remplir l'espace disponible
Gauche #h(1fr) Droite     // h(1fr) = espace extensible
```

= Listes

== Liste à puces

#ex("Liste à puces non ordonnée")
```typ
- Premier élément
- Deuxième élément
  - Sous-élément (2 espaces d'indentation)
  - Autre sous-élément
    - Sous-sous-élément (4 espaces)
- Troisième élément

// Changer le marqueur globalement
#set list(marker: "→")
- Item avec flèche
- Item avec flèche

// Marqueurs différents par niveau
#set list(marker: ([•], [–], [◦]))
```

== Liste numérotée

#ex("Liste numérotée ordonnée")
```typ
+ Première étape
+ Deuxième étape
  + Sous-étape A
  + Sous-étape B
+ Troisième étape

// Différents formats de numérotation
#set enum(numbering: "1.")      // 1. 2. 3.
#set enum(numbering: "a)")      // a) b) c)
#set enum(numbering: "I.")      // I. II. III.
#set enum(numbering: "(1)")     // (1) (2) (3)

// Commencer à un numéro spécifique
#enum(start: 5,
  [Cinquième item],
  [Sixième item],
)
```

== Liste de termes (définitions)

#ex("Liste de définitions")
```typ
/ Typst : Système de composition typographique moderne écrit en Rust.
/ LaTeX : Système historique très puissant, populaire en milieu académique.
/ Markdown : Balisage léger, simple mais limité pour la mise en forme avancée.
/ PDF : Portable Document Format — format de sortie principal de Typst.
```

Résultat :

/ Typst : Système de composition typographique moderne écrit en Rust.
/ LaTeX : Système historique très puissant, populaire en milieu académique.
/ Markdown : Balisage léger, simple mais limité pour la mise en forme avancée.

#memo("Listes — Antisèche")[
  #table(
    columns: (auto, 1fr),
    fill: (col, row) => if row == 0 { bleu } else if calc.odd(row) { gris } else { white },
    stroke: 0.4pt + grisc,
    text(fill: white, weight: "bold")[Syntaxe],
    text(fill: white, weight: "bold")[Description],
    [`- élément`], [Puce — liste non ordonnée],
    [`+ élément`], [Numéro — liste ordonnée],
    [`/ terme : def`], [Définition],
    [2 espaces devant], [Sous-liste d'un niveau],
    [4 espaces devant], [Sous-liste de deux niveaux],
    [`#set list(marker: "→")`], [Changer le marqueur de puce],
    [`#set enum(numbering: "a)")`], [Changer le format de numérotation],
    [`#enum(start: 5, ...)`], [Commencer à un numéro précis],
  )
]

= Liens et références dans le texte

== Liens hypertexte

#ex("Liens URL et email")
```typ
// Lien simple (affiché tel quel)
Visitez #link("https://typst.app")[le site officiel de Typst].

// Lien avec texte personnalisé
#link("https://typst.app/docs")[Documentation Typst]

// Email
Contactez #link("mailto:contact@exemple.fr")[notre équipe].

// Rendre tous les liens bleus automatiquement
#show link: it => text(fill: blue, it)
```

== Labels et références croisées

#ex("Référencer des éléments du document")
```typ
// Créer un label sur un titre, figure ou équation
== Introduction <sec:intro>

// Référencer ce label ailleurs dans le document
Comme expliqué en @sec:intro, la syntaxe est simple.

// Avec un texte personnalisé
Voir #ref(<sec:intro>, supplement: "la section")
```

#import "commun.typ": *
#page-style("Couleurs & Styles visuels", "03")
#style-titres()
#style-code()

#titre-fascicule("03", "Couleurs & Styles visuels", "Couleurs du texte, surlignage, blocs colorés, palette personnalisée.")

= Couleurs du texte

#ex("Texte coloré — différentes syntaxes")
```typ
#text(fill: red)[Texte rouge natif]
#text(fill: blue)[Texte bleu natif]
#text(fill: rgb("#27AE60"))[Vert en hexadécimal]
#text(fill: rgb(200, 50, 100))[Couleur RGB (0–255)]
#text(fill: luma(128))[Gris 50% — luma = niveaux de gris]
#text(fill: cmyk(0%, 50%, 100%, 0%))[Orange CMYK]

// Combiner couleur et autres styles
#text(fill: red, weight: "bold", size: 14pt)[Rouge gras 14pt]
```

Exemples rendus :
#text(fill: red)[Rouge] — #text(fill: blue)[Bleu] — #text(fill: rgb("#27AE60"))[Vert hex] — #text(fill: rgb(200, 50, 100))[RGB] — #text(fill: luma(128))[Gris 50%]

= Palette de couleurs native

#grid(
  columns: (1fr, 1fr, 1fr, 1fr),
  gutter: 6pt,
  ..("red","blue","green","orange","purple","yellow","teal","aqua",
     "maroon","navy","olive","lime","eastern","fuchsia","silver","gray"
  ).map(n => block(fill: eval(n), inset: 7pt, radius: 4pt)[
    #align(center)[#text(fill: white, size: 7.5pt, weight: "bold")[#n]]
  ])
)

#v(0.5em)

== Modificateurs de couleurs

#ex("Modifier une couleur existante")
```typ
// Éclaircir / assombrir
#text(fill: blue.lighten(40%))[Bleu éclairci 40%]
#text(fill: blue.darken(30%))[Bleu assombri 30%]

// Saturation
#text(fill: red.saturate(20%))[Rouge plus saturé]
#text(fill: red.desaturate(50%))[Rouge désaturé (grisé)]

// Mélange de deux couleurs
#text(fill: red.mix(blue, 50%))[Rouge + Bleu à 50/50]
#text(fill: orange.mix(white, 70%))[Orange très clair]

// Transparence
#text(fill: blue.transparentize(50%))[Bleu semi-transparent]
```

Rendus : #text(fill: blue.lighten(40%))[éclairci] — #text(fill: blue.darken(30%))[assombri] — #text(fill: rgb("#800080"))[mélange rouge+bleu] — #text(fill: orange.lighten(70%))[orange très clair]

#memo("Formats de couleurs")[
  #table(
    columns: (auto, 1fr, auto),
    fill: (col, row) => if row == 0 { bleu } else if calc.odd(row) { gris } else { white },
    stroke: 0.4pt + grisc,
    text(fill: white, weight: "bold")[Format],
    text(fill: white, weight: "bold")[Description],
    text(fill: white, weight: "bold")[Exemple],
    [`red`, `blue`…], [Couleurs nommées prédéfinies], [`fill: red`],
    [`rgb("#RRGGBB")`], [Hexadécimal (le plus courant)], [`rgb("#FF5733")`],
    [`rgb(R, G, B)`], [Valeurs 0–255], [`rgb(255, 87, 51)`],
    [`luma(n)`], [Niveaux de gris 0–255], [`luma(128)`],
    [`cmyk(C%,M%,Y%,K%)`], [Impression quadrichromie], [`cmyk(0%,50%,100%,0%)`],
    [`.lighten(n%)`], [Éclaircir de n%], [`blue.lighten(40%)`],
    [`.darken(n%)`], [Assombrir de n%], [`red.darken(20%)`],
    [`.mix(col, n%)`], [Mélanger avec une autre couleur], [`red.mix(blue, 50%)`],
    [`.transparentize(n%)`], [Rendre transparent de n%], [`blue.transparentize(30%)`],
  )
]

= Définir sa palette personnalisée

#ex("Palette définie en début de fichier")
```typ
// En-tête du document — définir une fois, utiliser partout
#let primaire    = rgb("#1A6B9A")
#let secondaire  = rgb("#27AE60")
#let accent      = rgb("#CA6F1E")
#let danger      = rgb("#C0392B")
#let fond-clair  = rgb("#F2F3F4")
#let fond-bleu   = rgb("#EBF5FB")

// Utilisation dans le texte
#text(fill: primaire)[Titre en bleu primaire]
#text(fill: accent, weight: "bold")[Accent orange gras]

// Utilisation dans un bloc
#block(fill: fond-clair, inset: 10pt)[Contenu sur fond gris clair]
```

= Surlignage

#ex("Surlignage — syntaxes")
```typ
// Surlignage jaune par défaut
#highlight[Texte surligné en jaune]

// Couleur personnalisée
#highlight(fill: rgb("#ABEBC6"))[Surlignage vert]
#highlight(fill: orange.lighten(60%))[Surlignage orange clair]
#highlight(fill: blue.lighten(70%))[Surlignage bleu clair]
#highlight(fill: rgb("#F9E79F"))[Surlignage jaune doux]

// Fonction réutilisable — à définir en en-tête
#let hl(col, cont) = highlight(fill: col.lighten(60%), cont)

#hl(blue, [Concept important en bleu])
#hl(red, [Point critique en rouge])
#hl(green, [Élément validé en vert])
```

Exemples rendus :
#highlight[Jaune] — #highlight(fill: rgb("#ABEBC6"))[Vert] — #highlight(fill: orange.lighten(60%))[Orange] — #highlight(fill: blue.lighten(70%))[Bleu] — #hl(rouge, [Rouge]) — #hl(violet, [Violet])

= Blocs colorés

== Bloc simple avec fond et bordure

#ex("Bloc encadré")
```typ
#block(
  fill: rgb("#EBF5FB"),            // couleur de fond
  stroke: 1.5pt + rgb("#2E86AB"),  // épaisseur + couleur de bordure
  inset: 12pt,                     // marge intérieure
  radius: 8pt,                     // arrondi des coins
  width: 100%,                     // largeur (% ou valeur fixe)
)[
  Contenu avec fond bleu clair et bordure bleue.
]
```

== Bordures sélectives (style callout)

#ex("Bordure gauche uniquement")
```typ
// Bordure seulement à gauche — style citation/callout
#block(
  stroke: (left: 4pt + orange, rest: 0.4pt + orange.lighten(60%)),
  fill: orange.lighten(90%),
  inset: 12pt,
  radius: (right: 6pt),
)[
  ⚠ Avertissement : vérifiez vos sauvegardes avant toute modification.
]

// Aucune bordure, fond uniquement
#block(fill: vert.lighten(88%), inset: 10pt, radius: 5pt)[
  ✓ Opération réussie.
]
```

Exemples rendus :

#block(stroke: (left: 4pt + orange, rest: 0.4pt + orange.lighten(60%)), fill: orange.lighten(90%), inset: 12pt, radius: (right: 6pt))[⚠ Avertissement : vérifiez vos sauvegardes avant toute modification.]

#v(0.4em)

#block(fill: vert.lighten(88%), inset: 10pt, radius: 5pt, width: 100%)[✓ Opération réussie.]

== Blocs callout complets

#ex("Fonction callout réutilisable")
```typ
#let callout(icone, couleur, titre, corps) = block(
  width: 100%,
  fill: couleur.lighten(88%),
  stroke: (left: 3.5pt + couleur, rest: 0.5pt + couleur.lighten(60%)),
  inset: 12pt,
  radius: (right: 6pt),
)[
  #text(fill: couleur, weight: "bold")[#icone #titre]
  #v(0.3em)
  #corps
]

// Utilisation
#callout("ℹ", blue, "Information", [Voici une information utile.])
#callout("⚠", orange, "Attention", [Point important à ne pas oublier.])
#callout("✓", green, "Bonne pratique", [Méthode recommandée.])
#callout("✗", red, "Erreur courante", [À éviter absolument.])
```

Exemples rendus :

#let callout(icone, couleur, titre, corps) = block(
  width: 100%, fill: couleur.lighten(88%),
  stroke: (left: 3.5pt + couleur, rest: 0.5pt + couleur.lighten(60%)),
  inset: 12pt, radius: (right: 6pt),
)[
  #text(fill: couleur, weight: "bold")[#icone #titre]
  #v(0.3em)
  #corps
]

#callout("ℹ", bleu2, "Information", [Voici une information utile à retenir.])
#v(0.3em)
#callout("⚠", orange, "Attention", [Point important à ne pas oublier dans votre workflow.])
#v(0.3em)
#callout("✓", vert, "Bonne pratique", [Toujours définir sa palette de couleurs en début de fichier.])
#v(0.3em)
#callout("✗", rouge, "Erreur courante", [Ne pas passer de blocs raw en paramètre de fonction.])

= Texte sur fond coloré (box inline)

#ex("Box inline dans le texte")
```typ
// Box dans le flux du texte
Un #box(fill: yellow, inset: (x: 3pt), radius: 2pt)[mot surligné] dans une phrase.

// Badge coloré (ex: étiquette, tag)
#let badge(texte, couleur: blue) = box(
  fill: couleur,
  inset: (x: 7pt, y: 3pt),
  radius: 10pt,
)[#text(fill: white, size: 8.5pt, weight: "bold", texte)]

Statut : #badge("NOUVEAU")  #badge("IMPORTANT", couleur: red)  #badge("OK", couleur: green)
```

Résultat :

#let badge(texte, couleur: bleu) = box(fill: couleur, inset: (x: 7pt, y: 3pt), radius: 10pt)[#text(fill: white, size: 8.5pt, weight: "bold", texte)]

Statut : #badge("NOUVEAU") #badge("IMPORTANT", couleur: rouge) #badge("OK", couleur: vert) #badge("Fedora 43", couleur: violet)

#import "commun.typ": *
#page-style("Mise en page", "04")
#style-titres()
#style-code()

#titre-fascicule("04", "Mise en page", "Page, marges, colonnes, grilles, en-têtes, pieds de page.")

= Configuration de la page

#ex("Paramètres globaux de page")
```typ
#set page(
  paper: "a4",              // format papier
  margin: (                 // marges individuelles
    top: 2.5cm,
    bottom: 3cm,
    left: 3cm,
    right: 2.5cm,
  ),
  // margin: 2cm            // même marge partout
  numbering: "1",           // numérotation : "1", "i", "A", "I"...
  number-align: center,     // left, center, right
  flipped: false,           // true = paysage
  fill: white,              // couleur de fond de page
)
```

== Formats de papier disponibles

#table(
  columns: (auto, auto, 1fr),
  fill: (col, row) => if row == 0 { bleu } else if calc.odd(row) { gris } else { white },
  stroke: 0.4pt + grisc,
  align: (col, row) => if row == 0 { center } else { left },
  text(fill: white, weight: "bold")[Format],
  text(fill: white, weight: "bold")[Dimensions],
  text(fill: white, weight: "bold")[Usage typique],
  [`a4`], [210 × 297 mm], [Standard européen — le plus courant],
  [`a3`], [297 × 420 mm], [Affiches, plans],
  [`a5`], [148 × 210 mm], [Livrets, brochures],
  [`us-letter`], [216 × 279 mm], [Standard américain],
  [`us-legal`], [216 × 356 mm], [Documents juridiques US],
  [`presentation-16-9`], [297 × 167 mm], [Présentations widescreen],
  [`presentation-4-3`], [280 × 210 mm], [Présentations classiques],
)

= Alignement

#ex("Alignement du contenu")
```typ
#align(left)[Texte aligné à gauche]
#align(center)[Texte centré]
#align(right)[Texte à droite]

// Alignements combinés (horizontal + vertical)
#align(center + top)[En haut au centre]
#align(right + bottom)[En bas à droite]
#align(center + horizon)[Centré verticalement et horizontalement]

// Aligner dans un bloc de hauteur définie
#block(height: 3cm, width: 100%)[
  #align(center + horizon)[Centré dans un bloc de 3 cm de haut]
]
```

= Colonnes multiples

#ex("Texte en colonnes")
```typ
// Deux colonnes avec gouttière
#columns(2, gutter: 16pt)[
  === Première colonne
  Le texte s'écoule automatiquement de la
  première vers la deuxième colonne.

  #colbreak()  // forcer le passage à la colonne suivante

  === Deuxième colonne
  Contenu de la deuxième colonne, après le saut forcé.
]

// Trois colonnes avec ligne de séparation
#columns(3, gutter: 12pt, stroke: 0.4pt + gray)[
  Colonne 1 #colbreak() Colonne 2 #colbreak() Colonne 3
]
```

Exemple rendu (2 colonnes) :

#columns(2, gutter: 16pt)[
  *Colonne gauche* — Le texte s'écoule naturellement. On peut y mettre autant de contenu que nécessaire, Typst gère le flux automatiquement.
  #colbreak()
  *Colonne droite* — Après le `#colbreak()`, le contenu reprend ici. Les deux colonnes ont la même largeur.
]

= Grilles (grid)

La grille est l'outil central pour toute mise en page complexe.

#ex("Grilles flexibles")
```typ
// Deux colonnes égales
#grid(columns: (1fr, 1fr), gutter: 12pt,
  [Cellule gauche],
  [Cellule droite],
)

// Largeur fixe + flexible
#grid(columns: (130pt, 1fr), gutter: 10pt,
  [*Étiquette :*], [Valeur ou texte long ici...],
  [*Autre :*],     [Autre valeur],
)

// Trois colonnes proportionnelles
#grid(columns: (2fr, 1fr, 1fr), gutter: 8pt,
  block(fill: blue.lighten(80%), inset: 8pt)[Large],
  block(fill: green.lighten(80%), inset: 8pt)[Moyen],
  block(fill: red.lighten(80%), inset: 8pt)[Moyen],
)

// Grille avec nombre de colonnes fixe (répétition auto)
#grid(columns: 3, gutter: 6pt,
  [A], [B], [C],
  [D], [E], [F],
)
```

Exemple rendu — grille 3 colonnes :

#grid(columns: (2fr, 1fr, 1fr), gutter: 8pt,
  block(fill: bleu.lighten(80%), inset: 8pt, radius: 4pt, width: 100%)[*Colonne large (2fr)*],
  block(fill: vert.lighten(80%), inset: 8pt, radius: 4pt, width: 100%)[Moyenne (1fr)],
  block(fill: rouge.lighten(80%), inset: 8pt, radius: 4pt, width: 100%)[Moyenne (1fr)],
)

#memo("Unités de mesure")[
  #table(
    columns: (auto, 1fr, auto),
    fill: (col, row) => if row == 0 { bleu } else if calc.odd(row) { gris } else { white },
    stroke: 0.4pt + grisc,
    text(fill: white, weight: "bold")[Unité],
    text(fill: white, weight: "bold")[Signification],
    text(fill: white, weight: "bold")[Exemple],
    [`pt`],  [Point typographique (1/72 pouce)],          [`12pt`],
    [`mm`],  [Millimètre],                                 [`25mm`],
    [`cm`],  [Centimètre],                                 [`2.5cm`],
    [`in`],  [Pouce],                                      [`1in`],
    [`em`],  [Relatif à la taille de police courante],     [`1.5em`],
    [`1fr`], [Fraction de l'espace disponible],            [`2fr` = double],
    [`%`],   [Pourcentage du conteneur parent],            [`80%`],
  )
]

= En-têtes et pieds de page

#ex("Header et footer personnalisés")
```typ
#set page(
  header: [
    #set text(size: 8pt, fill: gray)
    Mon Document — #datetime.today().display("[day]/[month]/[year]")
    #line(length: 100%, stroke: 0.4pt + gray)
  ],
  footer: context [
    #set text(size: 8pt, fill: gray)
    #line(length: 100%, stroke: 0.4pt + gray)
    #v(2pt)
    #grid(columns: (1fr, auto, 1fr),
      align(left)[Mon Nom],
      align(center)[Page #counter(page).display("1 / 1", both: true)],
      align(right)[Section courante],
    )
  ],
)
```

#tip[`context` est obligatoire dès qu'on accède à `counter(page)` dans le footer. Sans `context`, le numéro reste figé. C'est une règle fondamentale de Typst.]

== Supprimer l'en-tête/pied sur certaines pages

#ex("En-tête conditionnel")
```typ
#set page(
  header: context {
    // N'afficher l'en-tête qu'à partir de la page 3
    if counter(page).get().first() >= 3 [
      #set text(size: 8pt, fill: gray)
      Mon Document
      #line(length: 100%, stroke: 0.4pt + gray)
    ]
  }
)
```

= Sauts de page et contrôle du flux

#ex("Gestion des sauts")
```typ
// Saut de page inconditionnel
#pagebreak()

// Saut de page "faible" — seulement si nécessaire
#pagebreak(weak: true)

// Empêcher un élément d'être coupé entre deux pages
#block(breakable: false)[
  Titre de section et son premier paragraphe ensemble.
  Ce bloc ne sera jamais coupé par un saut de page automatique.
]

// Sauter au début de la prochaine page paire ou impaire
#pagebreak(to: "even")   // prochaine page paire
#pagebreak(to: "odd")    // prochaine page impaire
```

= Boîtes et blocs avancés

#ex("Box inline et block display")
```typ
// box = inline (dans le flux du texte)
Un #box(fill: yellow.lighten(30%), inset: (x:3pt), radius:2pt)[mot encadré] dans une phrase.

// block = display (occupe sa propre ligne)
#block(
  fill: blue.lighten(90%),
  stroke: 1pt + blue,
  inset: 12pt,
  radius: 6pt,
  width: 100%,
  height: 3cm,        // hauteur fixe (optionnel)
  clip: true,         // couper le contenu dépassant
)[
  Contenu du bloc avec hauteur fixe à 3 cm.
]
```

= Numérotation des pages

#ex("Contrôle de la numérotation")
```typ
// Formats de numérotation
#set page(numbering: "1")         // 1, 2, 3...
#set page(numbering: "i")         // i, ii, iii...
#set page(numbering: "I")         // I, II, III...
#set page(numbering: "a")         // a, b, c...
#set page(numbering: "1 / 1")     // 3 / 12 (page / total)

// Réinitialiser le compteur (ex: après pages liminaires)
#counter(page).update(1)

// Supprimer la numérotation sur une page
#set page(numbering: none)

// Aligner le numéro
#set page(number-align: center)   // left, center, right
```

#import "commun.typ": *
#page-style("Tableaux & Images", "05")
#style-titres()
#style-code()

#titre-fascicule("05", "Tableaux & Images", "Créer des tableaux avancés, insérer des images, figures avec légendes.")

= Tableaux

== Tableau de base

#ex("Tableau minimal")
```typ
#table(
  columns: (auto, auto, auto),
  [*Nom*],   [*Âge*],  [*Ville*],
  [Alice],   [28],     [Paris],
  [Bruno],   [35],     [Lyon],
  [Carole],  [22],     [Bordeaux],
)
```

Résultat :

#table(
  columns: (auto, auto, auto),
  fill: (col, row) => if row == 0 { gris } else { white },
  stroke: 0.4pt + grisc,
  [*Nom*],   [*Âge*],  [*Ville*],
  [Alice],   [28],     [Paris],
  [Bruno],   [35],     [Lyon],
  [Carole],  [22],     [Bordeaux],
)

== Tableau stylisé avec couleurs alternées

#ex("Tableau avec en-tête colorée et lignes alternées")
```typ
#table(
  columns: (1fr, 2fr, auto),
  fill: (col, row) => {
    if row == 0               { rgb("#1A6B9A") }   // en-tête bleue
    else if calc.odd(row)     { rgb("#F2F3F4") }   // lignes impaires grises
    else                      { white }             // lignes paires blanches
  },
  stroke: 0.4pt + rgb("#BDC3C7"),
  align: (col, row) => if row == 0 { center } else { left },
  // En-têtes (ligne 0)
  text(fill: white, weight: "bold")[Produit],
  text(fill: white, weight: "bold")[Description],
  text(fill: white, weight: "bold")[Prix],
  // Données
  [Typst],  [Compositeur typographique moderne],  [Gratuit],
  [LaTeX],  [Système de composition académique],  [Gratuit],
  [Word],   [Traitement de texte Microsoft],      [Payant],
)
```

Résultat :

#table(
  columns: (1fr, 2fr, auto),
  fill: (col, row) => {
    if row == 0 { bleu }
    else if calc.odd(row) { gris }
    else { white }
  },
  stroke: 0.4pt + grisc,
  align: (col, row) => if row == 0 { center } else { left },
  text(fill: white, weight: "bold")[Produit],
  text(fill: white, weight: "bold")[Description],
  text(fill: white, weight: "bold")[Prix],
  [Typst],  [Compositeur typographique moderne],  [Gratuit],
  [LaTeX],  [Système de composition académique],  [Gratuit],
  [Writer], [LibreOffice — traitement de texte],  [Gratuit],
)

== Fusion de cellules

#ex("Fusion horizontale (colspan) et verticale (rowspan)")
```typ
#table(
  columns: 3,
  // Fusion sur 3 colonnes
  table.cell(colspan: 3)[*Titre centré sur toute la largeur*],
  // Ligne normale
  [A], [B], [C],
  // Fusion verticale sur 2 lignes
  table.cell(rowspan: 2)[Fusionné\ verticalement],
  [D], [E],
  [F], [G],
)
```

Résultat :

#table(
  columns: 3,
  fill: (col, row) => if row == 0 { bleu } else if calc.odd(row) { gris } else { white },
  stroke: 0.4pt + grisc,
  table.cell(colspan: 3, fill: violet)[#text(fill: white, weight: "bold")[Titre sur toute la largeur]],
  [*A*], [*B*], [*C*],
  table.cell(rowspan: 2, fill: bleu.lighten(80%))[Fusionné\ verticalement], [D], [E],
  [F], [G],
)

== Lignes et colonnes manuelles

#ex("Lignes horizontales et verticales manuelles")
```typ
#table(
  columns: 3,
  stroke: none,                           // supprimer toutes les bordures
  table.hline(stroke: 1.5pt + black),     // ligne épaisse en haut
  [*Col 1*], [*Col 2*], [*Col 3*],
  table.hline(stroke: 0.5pt + gray),      // ligne fine après l'en-tête
  [A], [B], [C],
  [D], [E], [F],
  table.hline(stroke: 1.5pt + black),     // ligne épaisse en bas
)
```

== Tableaux avec contenu riche

#ex("Cellules avec blocs et listes")
```typ
#table(
  columns: (1fr, 1fr),
  stroke: 0.5pt + gray,
  align: top,
  [
    *Avantages*
    #list(
      [Syntaxe simple],
      [Compilation rapide],
      [Couleurs natives],
    )
  ],
  [
    *Inconvénients*
    #list(
      [Moins de packages],
      [Communauté plus petite],
    )
  ],
)
```

#memo("Tableaux — Antisèche complète")[
  #table(
    columns: (auto, 1fr),
    fill: (col, row) => if row == 0 { bleu } else if calc.odd(row) { gris } else { white },
    stroke: 0.4pt + grisc,
    text(fill: white, weight: "bold")[Paramètre],
    text(fill: white, weight: "bold")[Description],
    [`columns: 3`], [3 colonnes de largeur égale],
    [`columns: (auto, 1fr, 2fr)`], [Largeurs mixtes : auto, flexible, double],
    [`fill: (col, row) => ...`], [Couleur par cellule avec fonction],
    [`stroke: none`], [Supprimer toutes les bordures],
    [`stroke: 1pt + gray`], [Toutes les bordures en gris 1pt],
    [`align: center`], [Alignement global],
    [`align: (col, row) => ...`], [Alignement par cellule],
    [`align: top`], [Aligner le contenu en haut (utile pour cellules hautes)],
    [`table.cell(colspan: 2)`], [Fusion horizontale sur 2 colonnes],
    [`table.cell(rowspan: 2)`], [Fusion verticale sur 2 lignes],
    [`table.hline()`], [Ligne horizontale manuelle],
    [`table.vline()`], [Ligne verticale manuelle],
  )
]

= Images

== Insertion de base

#ex("Images — tailles et ajustements")
```typ
#image("photo.jpg")                     // largeur naturelle
#image("photo.png", width: 80%)         // 80% de la largeur disponible
#image("schema.svg", height: 5cm)       // hauteur fixe
#image("logo.png", width: 3cm, height: 2cm)  // taille fixe (peut déformer)

// Modes d'ajustement (fit)
#image("photo.jpg", width: 100%, fit: "contain")  // contenir sans déformer (défaut)
#image("photo.jpg", width: 100%, fit: "cover")    // recadrer pour remplir
#image("photo.jpg", width: 100%, fit: "stretch")  // étirer pour remplir
```

== Figure avec légende et référence

#ex("Figure numérotée avec label")
```typ
#figure(
  image("graphe.png", width: 70%),
  caption: [Évolution des performances sur 6 mois.],
  supplement: [Fig.],     // préfixe dans les références
) <fig:performances>

// Référencer dans le texte
Comme montré en @fig:performances, les résultats sont...
```

== Images côte à côte

#ex("Deux ou trois images en grille")
```typ
// Deux images côte à côte
#grid(columns: (1fr, 1fr), gutter: 12pt,
  figure(image("avant.jpg"), caption: [Avant], supplement: none, numbering: none),
  figure(image("apres.jpg"), caption: [Après], supplement: none, numbering: none),
)

// Trois images côte à côte
#grid(columns: (1fr, 1fr, 1fr), gutter: 8pt,
  image("img1.png"),
  image("img2.png"),
  image("img3.png"),
)
```

== Image dans du texte (figure flottante)

#ex("Image alignée avec wrapping de texte")
```typ
// Typst ne supporte pas le wrapping natif, mais on peut simuler avec grid
#grid(columns: (1fr, 2fr), gutter: 14pt,
  image("illustration.png"),
  [
    === Titre de la section

    Texte qui apparaît à côté de l'image, dans la colonne de droite.
    Le contenu s'étend autant que nécessaire.
  ]
)
```

#memo("Images — Antisèche")[
  #table(
    columns: (auto, 1fr),
    fill: (col, row) => if row == 0 { bleu } else if calc.odd(row) { gris } else { white },
    stroke: 0.4pt + grisc,
    text(fill: white, weight: "bold")[Paramètre / syntaxe],
    text(fill: white, weight: "bold")[Description],
    [Formats supportés], [PNG, JPEG, GIF, SVG, WebP],
    [`width: 100%`], [Pleine largeur du conteneur],
    [`height: 5cm`], [Hauteur fixe (largeur proportionnelle)],
    [`fit: "contain"`], [Contenir sans recadrer (défaut)],
    [`fit: "cover"`], [Recadrer pour remplir la zone],
    [`fit: "stretch"`], [Étirer sans respecter les proportions],
    [SVG], [Vectoriel — toujours net quelle que soit la taille],
    [Chemin], [Relatif depuis le fichier `.typ`],
    [`#figure(img, caption: [...])`], [Avec légende numérotée],
    [`<label>`], [Ajouter un label pour référence croisée],
  )
]

= Tableaux de figures (liste des figures)

#ex("Table des figures automatique")
```typ
// En fin de document, après toutes les figures
#outline(
  title: "Table des figures",
  target: figure.where(kind: image),
)
```

#import "commun.typ": *
#page-style("Variables, Fonctions & Logique", "06")
#style-titres()
#style-code()

#titre-fascicule("06", "Variables, Fonctions & Logique", "let, fonctions personnalisées, conditions, boucles, imports.")

= Variables

#ex("Définir et utiliser des variables")
```typ
// Variable texte simple
#let auteur = "Alice Dupont"
#let version = "2.1"
#let annee = 2025

Document de #auteur — Version #version (#annee)

// Variable contenant du contenu Typst
#let titre-doc = [*Guide Typst* — _édition avancée_]
En-tête : #titre-doc

// Variable couleur (réutilisée partout)
#let mon-bleu = rgb("#1A6B9A")
#text(fill: mon-bleu)[Texte dans ma couleur personnalisée]

// Variable numérique utilisée dans le calcul
#let tva = 20
Prix HT : 100 € — TVA : #tva % — Prix TTC : #(100 * (1 + tva / 100)) €
```

== Portée des variables

#ex("Portée — scope")
```typ
// Variable globale (déclarée en dehors de tout bloc)
#let couleur-globale = blue

// Variable locale à un bloc
{
  let couleur-locale = red
  #text(fill: couleur-locale)[Rouge — visible ici seulement]
}
// couleur-locale n'existe plus ici

// Les variables sont immuables — on ne peut pas les modifier
// Pour des valeurs dynamiques, utiliser #state()
```

= Fonctions personnalisées

== Fonctions simples

#ex("Fonctions retournant du contenu")
```typ
// Fonction sans argument
#let trait-separation = {
  v(0.5em)
  line(length: 100%, stroke: 0.5pt + gray)
  v(0.5em)
}

#trait-separation

// Fonction avec un argument
#let bonjour(nom) = [Bonjour, *#nom* !]
#bonjour("Alain")
#bonjour("Fedora")

// Fonction avec plusieurs arguments
#let lien-style(url, texte) = link(url)[#text(fill: blue, style: "italic", texte)]
#lien-style("https://typst.app", "Site officiel Typst")
```

== Fonctions avec contenu (content)

#ex("Fonctions acceptant du contenu Typst")
```typ
// Le paramètre reçoit du contenu Typst (pas une chaîne)
#let encadre(couleur, contenu) = block(
  fill: couleur.lighten(85%),
  stroke: 1pt + couleur,
  inset: 10pt,
  radius: 5pt,
  width: 100%,
  contenu
)

#encadre(blue)[Information importante à retenir.]
#encadre(red)[Attention : point critique !]
#encadre(green)[Bonne pratique recommandée.]
```

Résultat :

#let encadre(couleur, contenu) = block(fill: couleur.lighten(85%), stroke: 1pt + couleur, inset: 10pt, radius: 5pt, width: 100%, contenu)
#encadre(bleu)[Information importante à retenir.]
#v(0.3em)
#encadre(rouge)[Attention : point critique !]
#v(0.3em)
#encadre(vert)[Bonne pratique recommandée.]

== Paramètres nommés et valeurs par défaut

#ex("Paramètres optionnels avec valeur par défaut")
```typ
#let badge(texte, couleur: blue, taille: 9pt) = box(
  fill: couleur,
  inset: (x: 8pt, y: 3pt),
  radius: 12pt,
)[#text(fill: white, size: taille, weight: "bold", texte)]

// Utilisation
#badge("NOUVEAU")                         // valeurs par défaut
#badge("URGENT", couleur: red)            // couleur personnalisée
#badge("v2.1", couleur: green, taille: 8pt)  // tout personnalisé
```

Résultat :

#let badge(texte, couleur: bleu, taille: 9pt) = box(fill: couleur, inset: (x: 8pt, y: 3pt), radius: 12pt)[#text(fill: white, size: taille, weight: "bold", texte)]
#badge("NOUVEAU") #h(4pt) #badge("URGENT", couleur: rouge) #h(4pt) #badge("v2.1", couleur: vert, taille: 8pt)

= Conditions (if / else)

#ex("Conditions if / else if / else")
```typ
#let score = 85

// Structure if / else if / else
#if score >= 90 [
  *Excellent* — Mention très bien ✓
] else if score >= 70 [
  *Bien* — Mention bien ✓
] else if score >= 50 [
  Mention passable
] else [
  Insuffisant ✗
]

// Condition inline dans le texte
Score : #score/100 — #if score >= 60 [Admis] else [Refusé]

// Condition avec bloc de code
#let afficher-note = if score >= 50 {
  text(fill: green, weight: "bold")[✓ Reçu]
} else {
  text(fill: red, weight: "bold")[✗ Refusé]
}
Note finale : #afficher-note
```

== Opérateurs disponibles

#table(
  columns: (auto, 1fr, auto),
  fill: (col, row) => if row == 0 { bleu } else if calc.odd(row) { gris } else { white },
  stroke: 0.4pt + grisc,
  text(fill: white, weight: "bold")[Opérateur],
  text(fill: white, weight: "bold")[Signification],
  text(fill: white, weight: "bold")[Exemple],
  [`==`], [Égal à], [`x == 5`],
  [`!=`], [Différent de], [`x != 0`],
  [`<` / `>`], [Inférieur / Supérieur], [`x < 10`],
  [`<=` / `>=`], [Inférieur ou égal / Supérieur ou égal], [`x >= 18`],
  [`and`], [ET logique], [`x > 0 and x < 10`],
  [`or`], [OU logique], [`x < 0 or x > 100`],
  [`not`], [NON logique], [`not valide`],

)

= Boucles (for)

#ex("Boucle sur une plage de nombres")
```typ
// range(n) = 0, 1, ..., n-1
#for i in range(5) [
  Élément #(i + 1) \
]

// range(debut, fin, step)
#for i in range(1, 10, 2) [#i — ]   // 1 — 3 — 5 — 7 — 9 —
```

#ex("Boucle sur un tableau (array)")
```typ
#let langages = ("Python", "Rust", "Bash", "Typst")

// Générer des éléments de liste
#for lang in langages [
  - #lang
]

// Avec index (enumerate)
#for (i, lang) in langages.enumerate() [
  #(i+1). #lang \
]
```

#ex("Boucle pour générer un tableau")
```typ
#let eleves = (
  ("Alice", 18, "Paris"),
  ("Bruno", 14, "Lyon"),
  ("Carole", 16, "Marseille"),
  ("David", 12, "Bordeaux"),
)

#table(
  columns: (1fr, auto, auto),
  fill: (col, row) => if row == 0 { rgb("#1A6B9A") }
    else if calc.odd(row) { rgb("#F2F3F4") }
    else { white },
  stroke: 0.4pt + rgb("#BDC3C7"),
  text(fill: white, weight: "bold")[Élève],
  text(fill: white, weight: "bold")[Note/20],
  text(fill: white, weight: "bold")[Ville],
  ..eleves.map(((nom, note, ville)) => (
    nom,
    if note >= 15 { text(fill: green)[#note ★] } else { str(note) },
    ville,
  )).flatten()
)
```

Résultat :

#let eleves = (("Alice", 18, "Paris"), ("Bruno", 14, "Lyon"), ("Carole", 16, "Marseille"), ("David", 12, "Bordeaux"))
#table(
  columns: (1fr, auto, auto),
  fill: (col, row) => if row == 0 { bleu } else if calc.odd(row) { gris } else { white },
  stroke: 0.4pt + grisc,
  text(fill: white, weight: "bold")[Élève], text(fill: white, weight: "bold")[Note/20], text(fill: white, weight: "bold")[Ville],
  ..eleves.map(((nom, note, ville)) => (nom, if note >= 15 { text(fill: vert)[#note ★] } else { str(note) }, ville)).flatten()
)

= Imports et modules

#ex("Organiser le code en fichiers séparés")
```typ
// ── fichier : palette.typ ──
#let rouge  = rgb("#C0392B")
#let bleu   = rgb("#1A6B9A")
#let vert   = rgb("#27AE60")

// ── fichier : fonctions.typ ──
#let encadre(col, cont) = block(
  fill: col.lighten(85%), stroke: 1pt + col, inset: 10pt, cont
)

// ── fichier : main.typ ──
#import "palette.typ": rouge, bleu, vert   // imports sélectifs
#import "palette.typ": *                   // importer tout
#import "fonctions.typ": encadre

#include "chapitres/intro.typ"             // inclure du contenu

// Importer depuis Typst Universe
#import "@preview/showybox:2.0.3": showybox
```

#memo("Fonctions — Règles essentielles")[
  - `#let nom = valeur` → variable (immuable)
  - `#let fn(arg) = [contenu]` → fonction retournant du contenu Typst
  - `#let fn(arg) = { code }` → fonction avec bloc de code
  - `arg: valeur` dans la signature → valeur par défaut
  - `[...]` = contenu Typst rendu ; `"..."` = chaîne brute
  - `{ ... }` = bloc de code pur (résultat = dernière expression)
  - `#import "f.typ": *` → importer tout d'un fichier
  - `#include "f.typ"` → inclure le contenu rendu d'un fichier
  - Les variables ont une portée de bloc — pas de modification après déclaration
]

#import "commun.typ": *
#page-style("Règles set & show", "07")
#style-titres()
#style-code()

#titre-fascicule("07", "Règles set & show", "Configurer globalement avec set, redéfinir visuellement avec show.")

= La règle set

`#set` modifie les *paramètres par défaut* d'une fonction pour tout le contenu qui suit dans sa portée. C'est le mécanisme central de configuration globale en Typst.

== Configurer le texte

#ex("set text — typographie globale")
```typ
// En début de document : configuration globale
#set text(
  font: "Liberation Serif",   // police de caractères
  size: 11pt,                 // taille de base
  lang: "fr",                 // langue (césures, guillemets...)
  weight: "regular",          // regular, bold, light, 100–900
  style: "normal",            // normal, italic, oblique
  fill: black,                // couleur du texte
  tracking: 0pt,              // espacement entre les lettres
  spacing: 100%,              // espacement entre les mots
)
```

== Configurer les paragraphes

#ex("set par — espacement et justification")
```typ
#set par(
  justify: true,              // justification
  leading: 0.8em,             // interligne (entre les lignes)
  spacing: 1.2em,             // espace entre paragraphes
  first-line-indent: 1.5em,   // retrait de 1ère ligne
  hanging-indent: 0pt,        // retrait suspendu
  linebreaks: "optimized",    // simple / optimized
)
```

== Configurer les titres

#ex("set heading — numérotation et style")
```typ
// Numérotation des titres
#set heading(numbering: "1.1.")

// Différents formats :
// "1."          → 1. / 2. / 3.
// "1.1."        → 1.1. / 1.2. / 2.1.
// "I.A.1."      → I.A.1. / I.A.2. / I.B.1.
// "(1)"         → (1) / (2)
// "A."          → A. / B. / C.

// Profondeur de numérotation
#set heading(numbering: "1.1.", depth: 3)
// Seulement les niveaux 1, 2 et 3 sont numérotés
```

== Configurer les listes

#ex("set list et set enum")
```typ
// Puces de liste
#set list(
  marker: ([•], [–], [◦]),    // marqueur par niveau (1, 2, 3)
  indent: 1.5em,               // indentation
  body-indent: 0.5em,          // espace après le marqueur
)

// Listes numérotées
#set enum(
  numbering: "1.a.i.",         // format par niveau
  indent: 1.5em,
  full: false,                 // true = afficher tous les niveaux
)
```

== Configurer les figures

#ex("set figure — légendes et numérotation")
```typ
#set figure(
  numbering: "1",              // "1", "I", "a"...
  supplement: auto,            // texte avant le numéro : "Fig.", "Tableau"...
  gap: 0.65em,                 // espace entre l'image et la légende
  placement: auto,             // auto, top, bottom, none
)

// Style des légendes de figures
#set figure.caption(
  position: bottom,            // top ou bottom
  separator: [. ],             // séparateur entre numéro et texte
)
```

= La règle show

`#show` *intercepte et remplace* entièrement le rendu d'un type d'élément. C'est l'outil de personnalisation avancée.

== Reformater les titres

#ex("show heading — titres avec bandeau coloré")
```typ
// Tous les titres H1 deviennent des bandeaux bleus
#show heading.where(level: 1): it => {
  v(0.5cm)
  block(
    width: 100%,
    fill: rgb("#1A6B9A"),
    inset: (x: 14pt, y: 10pt),
    radius: 7pt,
  )[
    #text(fill: white, weight: "bold", size: 15pt)[#it.body]
  ]
  v(0.5em)
}

// Les H2 avec barre verticale colorée
#show heading.where(level: 2): it => {
  v(0.8em)
  grid(columns: (4pt, 1fr), gutter: 8pt,
    rect(fill: blue, width: 4pt, height: 16pt),
    align(horizon)[#text(fill: blue, weight: "bold")[#it.body]]
  )
  v(0.3em)
}
```

== Reformater les liens

#ex("show link — liens stylisés")
```typ
// Tous les liens en bleu souligné
#show link: it => {
  text(fill: blue, it)
}

// Liens avec icône externe
#show link: it => {
  it
  box(baseline: -0.1em)[
    #text(size: 0.7em, fill: blue)[↗]
  ]
}
```

== Reformater les blocs de code

#ex("show raw — blocs code personnalisés")
```typ
// Reformater tous les blocs de code (block: true = multi-lignes)
#show raw.where(block: true): it => block(
  fill: rgb("#1e1e2e"),
  stroke: 0.5pt + gray,
  inset: 12pt,
  radius: 6pt,
  width: 100%,
)[
  #text(font: "Liberation Mono", size: 9pt, fill: rgb("#CDD6F4"), it)
]

// Code inline uniquement
#show raw.where(block: false): it => box(
  fill: gray.lighten(60%),
  inset: (x: 3pt, y: 1pt),
  radius: 3pt,
)[#text(font: "Liberation Mono", size: 0.9em, it)]
```

== Chercher et remplacer visuellement

#ex("show avec chaîne de texte")
```typ
// Chaque occurrence de "Typst" sera affichée en bleu gras
#show "Typst": name => text(fill: blue, weight: "bold", name)

// Maintenant : Typst est automatiquement mis en valeur partout.
// "J'apprends Typst et j'aime Typst !" → les deux sont en bleu gras.
```

== show avec sélecteurs avancés

#ex("Sélecteurs de show")
```typ
// Seulement les H1 et H2
#show heading.where(level: 1, level: 2): it => {...}

// Tous les éléments strong (gras)
#show strong: it => text(fill: red, it)
// Attention : tout le texte en gras deviendra rouge !

// Seulement dans un bloc local
{
  show emph: it => text(fill: violet, it)
  // Dans ce bloc, tout l'italique est violet
  Texte normal et _texte en violet ici_.
}
// Hors du bloc : le show ne s'applique plus

// Figures d'images uniquement
#show figure.where(kind: image): it => {
  align(center)[
    #box(stroke: 1pt + gray, inset: 4pt, radius: 4pt, it.body)
    #v(0.3em)
    #text(fill: gray, size: 9pt, it.caption)
  ]
}
```

#memo("set vs show — Différences clés")[
  #table(
    columns: (auto, 1fr, 1fr),
    fill: (col, row) => if row == 0 { bleu } else if calc.odd(row) { gris } else { white },
    stroke: 0.4pt + grisc,
    text(fill: white, weight: "bold")[Aspect],
    text(fill: white, weight: "bold")[set],
    text(fill: white, weight: "bold")[show],
    [Rôle], [Modifie des paramètres], [Remplace entièrement le rendu],
    [Granularité], [Paramètres nommés], [Transformation libre],
    [Accès au contenu], [Non], [Oui — via `it.body`, `it.text`...],
    [Portée], [Bloc ou fichier entier], [Bloc ou fichier entier],
    [Priorité], [Dernier déclaré l'emporte], [Dernier déclaré l'emporte],
    [Usage typique], [Police, marges, couleur, numérotation], [Style visuel complet, layout],
  )
]

= Portée des règles

#ex("Règles locales dans un bloc")
```typ
// Règle globale — s'applique à tout le document
#set text(font: "Liberation Serif")

// Règle locale dans un bloc
{
  set text(font: "Liberation Mono", size: 9pt)
  show strong: it => text(fill: red, it)

  // Dans ce bloc : police Mono, gras = rouge
  Ce texte est en Mono. *Ce texte est rouge et Mono.*
}

// Hors du bloc : on revient au font Serif global
Ce texte est à nouveau en Serif. *Et le gras est normal.*
```

= Compter et référencer automatiquement

#ex("Compteurs personnalisés")
```typ
// Créer un compteur personnalisé
#let compteur-exercice = counter("exercice")

#let exercice(titre, corps) = {
  compteur-exercice.step()
  block(
    fill: blue.lighten(88%),
    stroke: 1pt + blue,
    inset: 10pt,
    radius: 5pt,
    width: 100%,
  )[
    #text(fill: blue, weight: "bold")[
      Exercice #context compteur-exercice.display() — #titre
    ]
    #v(0.3em)
    #corps
  ]
}

#exercice("Variables")[Définir une variable contenant ton nom.]
#exercice("Fonctions")[Créer une fonction qui affiche un badge.]
#exercice("Boucles")[Générer une liste de 5 langages de programmation.]
```

#import "commun.typ": *
#page-style("Mathématiques & Code", "08")
#style-titres()
#style-code()

#titre-fascicule("08", "Mathématiques & Code source", "Formules mathématiques, équations numérotées, blocs de code colorés.")

= Mode mathématique

Typst possède un moteur mathématique natif, plus lisible que LaTeX, sans aucun package requis.

== Inline et display

#ex("Maths inline vs display")
```typ
// Inline : entre simples dollars $...$
La formule $a^2 + b^2 = c^2$ est le théorème de Pythagore.

// Display (centrée, sur sa propre ligne) : entre doubles dollars $ ... $
$ a^2 + b^2 = c^2 $

// Plusieurs équations alignées avec &
$ a &= b + c \
  d &= e - f \
  g &= h dot i $
```

Exemples rendus :

La formule $a^2 + b^2 = c^2$ est le théorème de Pythagore.

$ a^2 + b^2 = c^2 $

$ a &= b + c \
  d &= e - f $

== Fractions, racines, puissances

#ex("Opérations de base")
```typ
// Fraction
$ (a + b) / (c - d) $

// Racine carrée
$ sqrt(x + y) $

// Racine n-ième
$ root(3, x^2 + 1) $

// Exposant et indice
$ x^2 + x_i + x_i^2 $

// Fractions imbriquées
$ 1 / (1 + 1 / (1 + 1/x)) $
```

Rendus : $(a + b) / (c - d)$ — $sqrt(x + y)$ — $root(3, x^2 + 1)$ — $x_i^2$ — $1 / (1 + 1 / (1 + 1/x))$

== Sommes, intégrales, produits

#ex("Opérateurs à bornes")
```typ
$ sum_(i=1)^n i = (n(n+1))/2 $

$ integral_0^(+infinity) e^(-x^2) dif x = sqrt(pi)/2 $

$ product_(k=1)^n k = n! $

$ lim_(x -> 0) sin(x)/x = 1 $

$ max_(x in RR) f(x) $
```

Rendus :

$ sum_(i=1)^n i = (n(n+1))/2 $

$ integral_0^(+infinity) e^(-x^2) dif x = sqrt(pi)/2 $

$ lim_(x -> 0) sin(x)/x = 1 $

== Matrices et vecteurs

#ex("Matrices")
```typ
// Matrice 2×2
$ mat(a, b; c, d) $

// Matrice avec délimiteurs personnalisés
$ mat(delim: "[", 1, 2; 3, 4) $

// Vecteur colonne
$ vec(a, b, c) $

// Vecteur ligne (utiliser mat)
$ mat(a, b, c) $

// Système d'équations
$ cases(
  x + y = 5,
  2x - y = 1
) $
```

Rendus :

#grid(columns: (1fr, 1fr, 1fr, 1fr), gutter: 8pt,
  align(center)[$mat(a, b; c, d)$],
  align(center)[$mat(delim: "[", 1, 2; 3, 4)$],
  align(center)[$vec(a, b, c)$],
  align(center)[$cases(x + y = 5, 2x - y = 1)$],
)

== Symboles mathématiques

#table(
  columns: (auto, auto, auto, auto, auto, auto),
  fill: (col, row) => if row == 0 { bleu } else if calc.odd(row) { gris } else { white },
  stroke: 0.4pt + grisc,
  align: center,
  text(fill: white, weight: "bold")[Typst],
  text(fill: white, weight: "bold")[Rendu],
  text(fill: white, weight: "bold")[Typst],
  text(fill: white, weight: "bold")[Rendu],
  text(fill: white, weight: "bold")[Typst],
  text(fill: white, weight: "bold")[Rendu],
  [`alpha`], [$alpha$], [`beta`], [$beta$], [`gamma`], [$gamma$],
  [`delta`], [$delta$], [`epsilon`], [$epsilon$], [`theta`], [$theta$],
  [`lambda`], [$lambda$], [`mu`], [$mu$], [`pi`], [$pi$],
  [`sigma`], [$sigma$], [`phi`], [$phi$], [`omega`], [$omega$],
  [`infinity`], [$infinity$], [`partial`], [$partial$], [`nabla`], [$nabla$],
  [`forall`], [$forall$], [`exists`], [$exists$], [`in`], [$in$],
  [`subset`], [$subset$], [`union`], [$union$], [`inter`], [$inter$],
  [`arrow.r`], [$arrow.r$], [`arrow.l`], [$arrow.l$], [`arrow.l.r`], [$arrow.l.r$],
  [`=>` ou `=>>`], [$=>$], [`approx`], [$approx$], [`equiv`], [$equiv$],
  [`!=`], [$!=$], [`<= `], [$<=$], [`>=`], [$>=$],
)

#memo("Maths — Syntaxe rapide")[
  - Inline : `$...$` — Display (centré) : `$ ... $` (espaces autour)
  - Exposant : `x^2` → $x^2$ — Indice : `x_i` → $x_i$
  - Fraction : `a/b` → $a/b$ — Avec parenthèses : `(a+b)/c` → $(a+b)/c$
  - Racine : `sqrt(x)` → $sqrt(x)$ — N-ième : `root(n, x)` → $root(n, x)$
  - Somme : `sum_(i=0)^n` → $sum_(i=0)^n$ — Intégrale : `integral_a^b` → $integral_a^b$
  - Matrice : `mat(a, b; c, d)` — Vecteur : `vec(a, b, c)`
  - Système : `cases(eq1, eq2)` — Alignement : `a &= b \ c &= d`
  - Espace : `quad` (grand) / `thin` (petit) — `dif` = d différentielle
]

== Équations numérotées et références

#ex("Numéroter et référencer les équations")
```typ
#set math.equation(numbering: "(1)")

La célèbre équation d'Einstein : $ E = m c^2 $ <eq:einstein>

La loi de Newton : $ F = m a $ <eq:newton>

Comme montré en @eq:einstein, l'énergie et la masse sont liées.
On peut combiner avec @eq:newton pour obtenir...
```

= Blocs de code source

== Coloration syntaxique native

Dans un fichier `.typ`, on déclare un bloc de code avec trois backticks + nom du langage.

#block(fill: rgb("#1e1e2e"), inset: 12pt, radius: 5pt, width: 100%)[
  #set text(font: "Liberation Mono", size: 9pt, fill: rgb("#CDD6F4"))
  Syntaxe Python : def fibonacci(n): a, b = 0, 1 ...   Syntaxe Bash : for f in \*.typ; do typst compile "\$f"; done   Syntaxe SQL : SELECT nom FROM eleves WHERE note >= 10
]

#tip[Typst supporte nativement : python, rust, javascript, typescript, bash/sh, sql, html, css, json, yaml, toml, c, cpp, java, go, typ (Typst lui-même), et une trentaine d'autres langages.]

== Numéros de ligne

#ex("Blocs de code avec numérotation")

Pour numéroter les lignes de code, utiliser le paquet `codly` :

```typ
#import "@preview/codly:1.0.0": *
#show: codly-init.with()
#codly(number-format: (n) => str(n), zebra-fill: luma(250))
```

Puis les blocs de code habituels seront automatiquement numérotés.

== Code inline dans le texte

#ex("Code dans une phrase")
```typ
La commande `typst compile main.typ` génère le PDF.
Utilisez `#set text(size: 12pt)` pour changer la taille.

// Personnaliser le code inline
#show raw.where(block: false): it => box(
  fill: gray.lighten(60%),
  inset: (x: 3pt, y: 1pt),
  radius: 3pt,
)[#text(font: "Liberation Mono", size: 0.9em, it)]
```

= Formules physiques et chimiques

#ex("Exemples de formules avancées")
```typ
// Transformée de Fourier
$ hat(f)(xi) = integral_(-infinity)^(+infinity) f(x) e^(-2 pi i x xi) dif x $

// Équation de Schrödinger
$ i hbar (partial Psi) / (partial t) = hat(H) Psi $

// Formule de Bayes
$ P(A | B) = (P(B | A) dot P(A)) / P(B) $

// Développement en série de Taylor
$ f(x) = sum_(n=0)^(+infinity) (f^((n))(a)) / (n!) (x-a)^n $
```

Rendus :

$ hat(f)(xi) = integral_(-infinity)^(+infinity) f(x) e^(-2 pi i x xi) dif x $

$ P(A | B) = (P(B | A) dot P(A)) / P(B) $

$ f(x) = sum_(n=0)^(+infinity) (f^((n))(a)) / (n!) (x-a)^n $

#import "commun.typ": *
#page-style("Paquets & Templates", "09")
#style-titres()
#style-code()

#titre-fascicule("09", "Paquets & Templates", "Typst Universe, paquets utiles, créer ses propres templates réutilisables.")

= Typst Universe

Typst Universe est le dépôt officiel de paquets pour Typst, accessible sur `typst.app/universe`.

== Syntaxe d'import

#ex("Importer un paquet depuis Universe")
```typ
// Syntaxe : @preview/nom-du-paquet:version
#import "@preview/showybox:2.0.3": showybox
#import "@preview/tablex:0.0.9": tablex, hlinex
#import "@preview/cetz:0.3.1": canvas, draw

// Importer tout le paquet
#import "@preview/codly:1.0.0": *

// Importer depuis un fichier local
#import "mes-styles.typ": *
#import "mes-styles.typ": encadre, badge, palette
```

= Paquets incontournables

== showybox — Boîtes stylisées

#ex("showybox — blocs callout avancés")
```typ
#import "@preview/showybox:2.0.3": showybox

#showybox(
  title: "Information importante",
  frame: (
    border-color: blue,
    title-color: blue.lighten(30%),
    body-color: blue.lighten(95%),
  ),
)[
  Ce contenu est dans une boîte showybox avec titre stylisé.
]

#showybox(
  title: "Attention",
  frame: (border-color: orange),
  title-style: (color: white, weight: "bold"),
)[
  Avertissement mis en évidence.
]
```

== tablex — Tableaux avancés

#ex("tablex — contrôle fin des tableaux")
```typ
#import "@preview/tablex:0.0.9": tablex, hlinex, vlinex, cellx

#tablex(
  columns: (1fr, 1fr, 1fr),
  // Lignes horizontales épaisses
  hlinex(stroke: 2pt + black),
  [*Nom*], [*Note*], [*Statut*],
  hlinex(stroke: 1pt + gray),
  [Alice],  [18/20], cellx(fill: green.lighten(80%))[✓ Admis],
  [Bruno],  [9/20],  cellx(fill: red.lighten(80%))[✗ Refusé],
  [Carole], [14/20], cellx(fill: yellow.lighten(60%))[∼ Liste attente],
  hlinex(stroke: 2pt + black),
)
```

== codly — Code stylisé

#ex("codly — blocs de code avancés")
```typ
#import "@preview/codly:1.0.0": *
#show: codly-init.with()

// Configuration
#codly(
  languages: (
    python: (name: "Python", color: rgb("#3572A5"), icon: "🐍"),
    bash: (name: "Bash", color: rgb("#4EAA25"), icon: "🖥"),
  ),
  number-format: (n) => [#n],
  zebra-fill: luma(250),
)

```python
def hello(nom: str) -> str:
    return f"Bonjour, {nom} !"

print(hello("Typst"))
```
```

== cetz — Dessins vectoriels

#ex("cetz — diagrammes et schémas")
```typ
#import "@preview/cetz:0.3.1": canvas, draw

#canvas({
  import draw: *

  // Rectangle avec texte
  rect((0, 0), (3, 1.5), fill: blue.lighten(80%), name: "box1")
  content("box1", [*Module A*])

  // Flèche
  line((3, 0.75), (4.5, 0.75), mark: (end: ">"))

  // Deuxième rectangle
  rect((4.5, 0), (7.5, 1.5), fill: green.lighten(80%), name: "box2")
  content("box2", [*Module B*])
})
```

== fletcher — Diagrammes de flux

#ex("fletcher — flowcharts")
```typ
#import "@preview/fletcher:0.5.1" as fletcher: diagram, node, edge

#diagram(
  node((0, 0), [Début], shape: "circle", fill: green.lighten(70%)),
  edge("->"),
  node((1, 0), [Traitement], shape: "rect", fill: blue.lighten(70%)),
  edge("->"),
  node((2, 0), [Décision], shape: "diamond", fill: orange.lighten(70%)),
  edge("->", label: [Oui]),
  node((3, 0), [Fin], shape: "circle", fill: red.lighten(70%)),
)
```

== Tableau des paquets utiles

#table(
  columns: (auto, 1fr, auto),
  fill: (col, row) => if row == 0 { bleu } else if calc.odd(row) { gris } else { white },
  stroke: 0.4pt + grisc,
  align: (col, row) => if row == 0 { center } else { left },
  text(fill: white, weight: "bold")[Paquet],
  text(fill: white, weight: "bold")[Utilité],
  text(fill: white, weight: "bold")[Version],
  [`showybox`], [Boîtes callout avancées avec titre], [`2.0.3`],
  [`tablex`], [Tableaux avec contrôle fin des lignes], [`0.0.9`],
  [`codly`], [Blocs de code numérotés et stylisés], [`1.0.0`],
  [`cetz`], [Dessin vectoriel (TikZ-like)], [`0.3.1`],
  [`fletcher`], [Diagrammes de flux et graphes], [`0.5.1`],
  [`glossarium`], [Glossaire automatique avec liens], [`0.4.1`],
  [`wordometer`], [Comptage de mots dans le document], [`0.1.4`],
  [`chronos`], [Diagrammes de séquence UML], [`0.2.0`],
  [`codelst`], [Listes de code source avec étiquettes], [`1.0.1`],
  [`quill`], [Notation musicale], [`0.6.0`],
  [`ctheorems`], [Théorèmes, lemmes, preuves], [`1.1.3`],
  [`physica`], [Symboles physique avancés], [`0.9.3`],
  [`diagraph`], [Graphes (interface Graphviz)], [`0.3.0`],
  [`metro`], [Unités physiques (SI)], [`0.3.0`],
)

= Créer ses propres templates

== Template de rapport simple

#ex("template-rapport.typ")
```typ
// ── fichier : template-rapport.typ ──
#let rapport(
  titre,
  auteur,
  date: datetime.today(),
  logo: none,
  corps,
) = {
  // Configuration globale
  set page(paper: "a4", margin: 2.5cm, numbering: "1")
  set text(font: "Liberation Serif", size: 11pt, lang: "fr")
  set par(justify: true, leading: 0.8em)
  set heading(numbering: "1.1.")

  // Styles des titres
  show heading.where(level: 1): it => {
    pagebreak(weak: true)
    block(width: 100%, fill: rgb("#1A6B9A"), inset: 12pt, radius: 6pt)[
      #text(fill: white, weight: "bold", size: 14pt, it.body)
    ]
    v(0.5em)
  }

  // Page de titre
  page(numbering: none)[
    #if logo != none { align(right, image(logo, width: 4cm)) }
    #v(1fr)
    #align(center)[
      #text(size: 24pt, weight: "bold", titre)
      #v(1cm)
      #text(size: 14pt, auteur)
      #v(0.5cm)
      #text(fill: gray, date.display("[day]/[month]/[year]"))
    ]
    #v(1fr)
  ]

  // Table des matières
  outline(title: "Sommaire", indent: 1.5em)
  pagebreak()
  counter(page).update(1)

  // Corps du document
  corps
}
```

#ex("main.typ — utiliser le template")
```typ
#import "template-rapport.typ": rapport

// Le contenu du document passe via #show: rapport.with(...)
#show: rapport.with(
  titre: "Mon Rapport Typst",
  auteur: "Alain — Fedora 43 KDE",
  date: datetime(year: 2025, month: 5, day: 15),
)

= Introduction

Voici le contenu du rapport, structuré avec les styles du template.

== Première section

Le texte suit les règles définies dans `template-rapport.typ`.

= Méthode

== Approche

...
```

== Template de lettre

#ex("template-lettre.typ")
```typ
#let lettre(expediteur, destinataire, date, objet, corps) = {
  set page(paper: "a4", margin: (top: 3cm, bottom: 2.5cm, left: 3cm, right: 2.5cm))
  set text(font: "Liberation Serif", size: 11pt, lang: "fr")
  set par(justify: false, leading: 0.9em)

  // En-tête expéditeur
  align(right)[
    #text(weight: "bold", expediteur.nom) \
    #expediteur.adresse \
    #expediteur.email
  ]

  v(1cm)

  // Destinataire
  text(weight: "bold", destinataire.nom) \
  destinataire.adresse

  v(1cm)

  // Date et lieu
  align(right)[#date.display("[city], le [day] [month repr:long] [year]")]

  v(1cm)

  // Objet
  [*Objet : #objet*]

  v(0.8cm)

  // Corps de la lettre
  corps

  v(2cm)
  [Veuillez agréer, Madame, Monsieur, l'expression de mes salutations distinguées.]
  v(2cm)
  align(right)[_#expediteur.nom_]
}
```

= Structure de projet recommandée

#block(fill: gris, stroke: 0.5pt + grisc, inset: 14pt, radius: 6pt)[
```
mon-projet/
├── main.typ                 # fichier d'entrée principal
├── template.typ             # mise en page et styles
├── palette.typ              # couleurs et variables globales
├── fonctions.typ            # fonctions utilitaires
├── chapitres/
│   ├── 01-introduction.typ
│   ├── 02-methode.typ
│   └── 03-conclusion.typ
├── images/
│   ├── logo.svg
│   ├── schema-architecture.png
│   └── graphiques/
├── references.bib           # bibliographie BibTeX
└── output/
    └── main.pdf             # PDF généré
```
]

#ex("main.typ avec include et import")
```typ
// ── main.typ ──
#import "palette.typ": *          // toutes les couleurs
#import "fonctions.typ": *        // toutes les fonctions
#import "template.typ": rapport   // le template

#show: rapport.with(
  titre: "Mon Document",
  auteur: "Alain",
)

// Inclure les chapitres (leur contenu est inséré ici)
#include "chapitres/01-introduction.typ"
#include "chapitres/02-methode.typ"
#include "chapitres/03-conclusion.typ"

// Bibliographie en fin de document
#bibliography("references.bib", style: "ieee")
```

#memo("Paquets — Bonnes pratiques")[
  - Toujours épingler la *version exacte* dans l'import (`@preview/pkg:1.2.3`)
  - Tester les mises à jour dans une branche séparée avant de les appliquer
  - Les paquets `@preview/` sont en développement actif — vérifier les changelogs
  - `typst.app/universe` → catalogue complet avec démo interactive
  - Pour travailler hors ligne : `typst compile --package-path /chemin/local`
  - Créer ses propres paquets locaux dans `~/.local/share/typst/packages/local/`
]


#import "commun.typ": *
#page-style("Workflow & Mémos finaux", "10")
#style-titres()
#style-code()

#titre-fascicule("10", "Workflow & Mémos de référence", "Workflow Fedora 43, scripts, comparaison LaTeX/Typst, antisèches complètes.")

= Workflow sous Fedora 43 KDE

== Compilation et automatisation

#ex("Script shell de compilation")
```bash
#!/bin/bash
# compile.sh — Compiler un fichier Typst et ouvrir le PDF
# Usage : ./compile.sh [fichier.typ]

FICHIER="${1:-main.typ}"
PDF="${FICHIER%.typ}.pdf"
DIR="$(dirname "$FICHIER")"

echo "Compilation de $FICHIER..."
if typst compile "$FICHIER" "$PDF"; then
    echo "OK : $PDF généré"
    # Ouvrir avec Okular (KDE)
    okular "$PDF" 2>/dev/null &
else
    echo "ERREUR : échec de la compilation"
    exit 1
fi
```

#ex("Mode watch avec notification KDE")
```bash
#!/bin/bash
# watch.sh — Compiler en temps réel avec notification sonore

FICHIER="${1:-main.typ}"
echo "Watch démarré sur $FICHIER (Ctrl+C pour arrêter)"

typst watch "$FICHIER" &
PID=$!

# Notification KDE à chaque recompilation réussie
while inotifywait -e modify "$FICHIER" 2>/dev/null; do
    if typst compile "$FICHIER" 2>/dev/null; then
        notify-send "Typst" "Compilation réussie ✓" --icon=emblem-ok
    fi
done

kill $PID
```

#ex("Makefile pour projets complexes")
```makefile
# Makefile — Automatiser les compilations Typst

SRC = main.typ
PDF = output/main.pdf
CHAPITRES = $(wildcard chapitres/*.typ)

.PHONY: all watch clean

# Compilation principale
all: $(PDF)

$(PDF): $(SRC) $(CHAPITRES) palette.typ template.typ
	@mkdir -p output
	typst compile $(SRC) $(PDF)
	@echo "OK : $(PDF)"

# Mode watch
watch:
	typst watch $(SRC) $(PDF)

# Nettoyage
clean:
	rm -f output/*.pdf
	@echo "Nettoyé"
```

== Raccourcis VSCodium + Tinymist

#table(
  columns: (auto, 1fr),
  fill: (col, row) => if row == 0 { bleu } else if calc.odd(row) { gris } else { white },
  stroke: 0.4pt + grisc,
  text(fill: white, weight: "bold")[Raccourci],
  text(fill: white, weight: "bold")[Action],
  [Ctrl+Shift+P → "Typst: Show Preview"], [Ouvrir la prévisualisation live],
  [Ctrl+Shift+P → "Typst: Export PDF"], [Exporter en PDF],
  [Ctrl+Space], [Autocomplétion des fonctions Typst],
  [F12], [Aller à la définition d'une variable/fonction],
  [Shift+F12], [Voir toutes les références d'un élément],
  [Ctrl+.], [Suggestions de correction rapide],
  [Ctrl+Shift+F], [Rechercher dans tous les fichiers],
  [Clic dans la prévisualisation], [Aller à la ligne source correspondante],
  [Alt+← / Alt+→], [Naviguer dans l'historique de navigation],
)

== Polices disponibles sous Fedora

#ex("Lister les polices disponibles pour Typst")
```bash
# Lister toutes les polices détectées par Typst
typst fonts

# Filtrer les polices supportant le français
typst fonts | grep -i "liberation\|dejavu\|noto\|ubuntu"

# Polices recommandées (à installer si manquantes)
sudo dnf install liberation-fonts      # Liberation Serif/Sans/Mono
sudo dnf install google-noto-fonts-common
sudo dnf install dejavu-fonts-all
```

#ex("Utiliser une police dans Typst")
```typ
// Polices disponibles nativement sous Fedora
#set text(font: "Liberation Serif")   // Similaire Times New Roman
#set text(font: "Liberation Sans")    // Similaire Arial
#set text(font: "Liberation Mono")    // Monospace pour le code

// Polices alternatives
#set text(font: "DejaVu Serif")
#set text(font: "Noto Serif")

// Famille de polices avec fallback
#set text(font: ("Linux Libertine", "Liberation Serif", "serif"))
```

= Débogage et erreurs courantes

== Messages d'erreur typiques

#table(
  columns: (1fr, 1fr),
  fill: (col, row) => if row == 0 { rouge } else if calc.odd(row) { gris } else { white },
  stroke: 0.4pt + grisc,
  text(fill: white, weight: "bold")[Message d'erreur],
  text(fill: white, weight: "bold")[Cause et solution],
  [unclosed delimiter], [Un `[`, `(` ou `{` n'est pas fermé — vérifier les paires],
  [expected comma], [Virgule manquante dans un appel de fonction],
  [unknown variable], [Variable utilisée avant d'être déclarée avec `#let`],
  [file not found], [Chemin d'image ou d'import incorrect — chemin relatif au `.typ`],
  [invalid number suffix], [Hexadécimal mal formaté dans `rgb()` — vérifier la casse],
  [unclosed raw text], [Triple backtick non fermé dans un bloc de code],
  [expected expression], [Syntax Typst invalide — souvent un `#` mal placé],
  [context required], [Utiliser `counter()` sans `context { }` dans le footer],
  [recursion limit], [Fonction récursive sans condition d'arrêt],
  [font not found], [Police non installée — `typst fonts` pour voir les disponibles],
)

== Stratégie de débogage

#ex("Techniques de débogage")
```typ
// Afficher la valeur d'une variable dans le PDF (debug)
#let ma-variable = 42
Debug : #repr(ma-variable)    // affiche : 42
Debug : #type(ma-variable)    // affiche : integer

// Tester un bloc isolément
#block(fill: yellow.lighten(70%), inset: 5pt)[
  Test : #mon-calcul
]

// Compiler avec messages d'erreur détaillés
// Dans le terminal :
// typst compile main.typ 2>&1 | head -50
```

= Mémos de référence rapide

== Antisèche 1 — Syntaxe fondamentale

#block(fill: bleu.lighten(92%), stroke: 0.5pt + bleu, inset: 14pt, radius: 8pt)[
  #grid(columns: (1fr, 1fr), gutter: 16pt,
    [
      *Formatage inline*
      #v(0.2em)
      `*gras*` → *gras* \
      `_italique_` → _italique_ \
      `#strike[barré]` → #strike[barré] \
      `#underline[souligné]` → #underline[souligné] \
      `#super[n]` → x#super[n] (exposant) \
      `#sub[n]` → H#sub[2]O (indice) \
      `#highlight[texte]` → #highlight[surligné] \
      `#text(fill: red)[x]` → #text(fill: red)[rouge]
      #v(0.5em)
      *Structure*
      #v(0.2em)
      `=` H1, `==` H2, `===` H3 \
      `- puce`, `+ numéro`, `/ terme :` déf \
      `---` ligne, `\` retour ligne \
      `~` espace insécable \
      `#pagebreak()` saut de page \
      `#v(1cm)` espace vertical
    ],
    [
      *Configuration*
      #v(0.2em)
      `#set page(paper: "a4", margin: 2.5cm)` \
      `#set text(font: "...", size: 11pt)` \
      `#set par(justify: true)` \
      `#set heading(numbering: "1.1.")` \
      `#show heading: it => {...}` \
      `#show link: it => {...}`
      #v(0.5em)
      *Mise en page*
      #v(0.2em)
      `#align(center)[...]` \
      `#columns(2)[...]` \
      `#grid(columns: ...)[...]` \
      `#block(fill: ..., inset: ...)[...]` \
      `#figure(image("..."), caption: [...])` \
      `#table(columns: ...)` \
      `#image("fichier.png", width: 80%)`
    ]
  )
]

== Antisèche 2 — Variables et fonctions

#block(fill: violet.lighten(92%), stroke: 0.5pt + violet, inset: 14pt, radius: 8pt)[
  #grid(columns: (1fr, 1fr), gutter: 16pt,
    [
      *Variables*
      #v(0.2em)
      `#let nom = "texte"` — chaîne \
      `#let n = 42` — nombre \
      `#let c = rgb("#1A6B9A")` — couleur \
      `#let cont = [*contenu Typst*]` — contenu \
      Variables immuables — pas de modification \
      Portée de bloc — déclaration avant usage
      #v(0.5em)
      *Fonctions*
      #v(0.2em)
      `#let fn(arg) = [rendu]` \
      `#let fn(arg) = { code; expr }` \
      `#let fn(arg, opt: défaut) = ...` \
      `#fn("valeur")` — appel \
      `#fn("val", opt: "autre")` — avec option
    ],
    [
      *Conditions*
      #v(0.2em)
      `#if cond [A] else [B]` \
      `#if a > 0 { text(fill: green)[Positif] }` \
      `and` / `or` / `not` — opérateurs logiques \
      `==` `!=` `<` `>` `<=` `>=` — comparaisons
      #v(0.5em)
      *Boucles*
      #v(0.2em)
      `#for i in range(n) [...]` \
      `#for item in tableau [...]` \
      `#for (i, v) in arr.enumerate() [...]` \
      `array.map(fn)` — transformer \
      `array.filter(fn)` — filtrer \
      `array.join([séparateur])` — joindre
    ]
  )
]

== Antisèche 3 — Mathématiques

#block(fill: vert.lighten(92%), stroke: 0.5pt + vert, inset: 14pt, radius: 8pt)[
  #grid(columns: (1fr, 1fr), gutter: 16pt,
    [
      *Syntaxe de base*
      #v(0.2em)
      `$...$` inline — `$ ... $` display \
      `x^2` → $x^2$ — `x_i` → $x_i$ \
      `(a+b)/c` → $(a+b)/c$ \
      `sqrt(x)` → $sqrt(x)$ \
      `root(3, x)` → $root(3, x)$ \
      `mat(a,b;c,d)` → $mat(a,b;c,d)$ \
      `vec(a,b,c)` → $vec(a,b,c)$ \
      `cases(a, b)` → système d'équations
    ],
    [
      *Opérateurs et symboles*
      #v(0.2em)
      `sum_(i=1)^n` → $sum_(i=1)^n$ \
      `integral_a^b` → $integral_a^b$ \
      `lim_(x->0)` → $lim_(x->0)$ \
      `alpha beta gamma` → $alpha beta gamma$ \
      `infinity` → $infinity$ \
      `forall exists` → $forall exists$ \
      `arrow.r` → $arrow.r$ \
      `approx equiv` → $approx equiv$ \
      Alignement : `a &= b \ c &= d`
    ]
  )
]

== Antisèche 4 — Comparaison Typst / LaTeX

#table(
  columns: (1fr, 1fr),
  fill: (col, row) => if row == 0 { bleu } else if calc.odd(row) { gris } else { white },
  stroke: 0.4pt + grisc,
  text(fill: white, weight: "bold")[LaTeX],
  text(fill: white, weight: "bold")[Typst],
  [`\textbf{texte}`], [`*texte*`],
  [`\textit{texte}`], [`_texte_`],
  [`\underline{texte}`], [`#underline[texte]`],
  [`\section{Titre}`], [`= Titre`],
  [`\begin{itemize}\item\end{itemize}`], [`- élément`],
  [`\textcolor{red}{texte}`], [`#text(fill: red)[texte]`],
  [`\colorbox{yellow}{texte}`], [`#highlight[texte]`],
  [`\begin{table}...\end{table}`], [`#table(columns:...)`],
  [`\includegraphics{img}`], [`#image("img.png")`],
  [`$\frac{a}{b}$`], [`$a/b$`],
  [`$\sqrt{x}$`], [`$sqrt(x)$`],
  [`$\sum_{i=0}^{n}$`], [`$sum_(i=0)^n$`],
  [`$\int_{a}^{b}$`], [`$integral_a^b$`],
  [`\newcommand{\fn}{...}`], [`#let fn = ...`],
  [`\input{fichier}`], [`#include "fichier.typ"`],
  [`\usepackage{pkg}`], [`#import "@preview/pkg:ver": ...`],
  [`\ref{label}`], [`@label`],
  [`\label{nom}`], [`<nom>`],
  [`\bibliography{refs}`], [`#bibliography("refs.bib")`],
)

== Ressources pour aller plus loin

#grid(columns: (1fr, 1fr), gutter: 12pt,
  block(fill: bleu.lighten(90%), stroke: 0.5pt + bleu, inset: 12pt, radius: 6pt)[
    #text(fill: bleu, weight: "bold")[Documentation officielle]
    #v(0.3em)
    - *typst.app/docs* — référence complète
    - *typst.app/universe* — catalogue des paquets
    - *forum.typst.app* — communauté et aide
    - *github.com/typst/typst* — code source
  ],
  block(fill: vert.lighten(90%), stroke: 0.5pt + vert, inset: 12pt, radius: 6pt)[
    #text(fill: vert, weight: "bold")[Outils sous Fedora 43]
    #v(0.3em)
    - `sudo dnf install typst` — installation
    - Typesetter — Flathub (éditeur GTK natif)
    - VSCodium + Tinymist — éditeur complet
    - `typst watch main.typ` — mode live
    - `typst fonts` — polices disponibles
  ]
)

#v(1cm)
#line(length: 100%, stroke: 1pt + bleu)
#v(0.5em)
#align(center)[
  #block(fill: bleu.lighten(90%), stroke: 0.5pt + bleu, inset: 14pt, radius: 8pt, width: 80%)[
    #text(fill: bleu, weight: "bold", size: 12pt)[Guide Complet Typst — Fin du fascicule 10/10]
    #v(0.3em)
    #text(size: 9.5pt)[
      Ce guide en 10 fascicules couvre l'ensemble des fonctionnalités de Typst,
      de l'installation à la création de templates avancés. \
      
    ]
  ]
]
