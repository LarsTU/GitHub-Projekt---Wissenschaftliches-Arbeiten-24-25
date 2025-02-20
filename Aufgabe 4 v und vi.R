#Aufgabe 4 v-vi
library(ggplot2)


# v) Visualisierung von drei oder vier kategorialen Variablen
# Visualisierung von Überlebensrate in Bezug auf Klasse und Geschlecht
visualisiere_kategorial(titanic, "Pclass", "Survived", "Sex")

 #  Diese Visualisierung zeigt, wie die Überlebensrate von Passagieren mit Geschlecht 
 # und Klassenstufe zusammenhängt. --> Frauen hatten generell eine höhere Überlebensrate als Männer.
 #  In der 1. Klasse war die Überlebensrate am höchsten, insbesondere bei Frauen.
 #  In der 3. Klasse hatten Männer kaum Überlebenschancen, während einige Frauen überlebt haben.

# vi) Weitere sinnvolle Analysen und Visualisierungen
# Balkendiagramm die Häufigkeit der Überlebenden und Nicht-Überlebenden.
balkendiagramm_neu(titanic$Survived)

 #Der Balken für „0“ (Nicht-Überlebende) ist deutlich höher --> die Mehrheit der Passagiere ist gestorben.
 #Der Balken für „1“ (Überlebende) ist kleiner --> nur eine Minderheit überlebt hat.
 #Keine weitere Unterteilung nach Geschlecht oder Klasse – Eine allgemeine Übersicht über die Überlebensrate.
 #Schlussfolgerung: Die Titanic-Katastrophe hatte eine sehr hohe Sterberate,
#da weit mehr Menschen gestorben sind als überlebt haben.


# Visualisierung der Altersverteilung nach Überlebensstatus
ggplot(titanic, aes(x = Age, fill = factor(Survived))) +
  geom_histogram(bins = 30, position = "dodge") +
  labs(title = "Altersverteilung nach Überlebensstatus", x = "Alter", y = "Anzahl der Passagiere") +
  scale_fill_manual(values = c("red", "green")) +
  theme_minimal()

 #  Ein Histogramm, das zeigt, wie sich das Alter in Bezug auf den Überlebensstatus verteilt.
 #  Kinder (< 10 Jahre) hatten eine höhere Überlebensrate,da viele gerettet wurden („Frauen und Kinder zuerst“). 
 #  Die meisten Erwachsenen zwischen 20–40 Jahren hatten eine hohe Sterblichkeit.
 #  Senioren hatten eine sehr geringe Überlebenschance.
 # Schlussfolgerung: Jüngere Passagiere hatten bessere Überlebenschancen, insbesondere Kleinkinder.


# Visualisierung der Ticketpreisverteilung nach Überlebensstatus und Klasse
ggplot(titanic, aes(x = factor(Pclass), y = Fare, fill = factor(Survived))) +
  geom_boxplot() +
  labs(title = "Ticketpreis nach Überlebensstatus und Klasse", x = "Klasse", y = "Ticketpreis") +
  scale_fill_manual(values = c("red", "green")) +
  theme_minimal()

 #  Ein Boxplot, der zeigt, wie sich der Ticketpreis in den verschiedenen Klassen zwischen 
 # Überlebenden und Nicht-Überlebenden unterscheidet.
 # 1. Klasse: Höhere Ticketpreise und mehr Überlebende.
 # 2. Klasse: Niedrige Ticketpreise, aber sehr wenige Überlebende.
 # Große Preisunterschiede in der 1. Klasse – einige zahlten extrem hohe Beträge.
 # Schlussfolgerung: Wohlhabendere Passagiere (1. Klasse) hatten bessere Überlebenschancen, 
 # während die ärmeren Passagiere (3. Klasse) benachteiligt waren.

