#Aufgabe 4 iv-vi
library(ggplot2)
source("Funktionen_R-Skript1.R") # Helferfunktionen
titanic = readRDS("titanic_cleaned.Rds")

# v) Visualisierung von drei oder vier kategorialen Variablen
# Visualisierung von Überlebensrate in Bezug auf Klasse und Geschlecht
visualisiere_kategorial(titanic, "Pclass", "Survived", "Sex")
# Diese Visualisierung zeigt, wie die Überlebensrate vom Geschlecht der 
# Passagiere und ihrer Klassenstufe zusammenhängt.
# --> Frauen hatten generell eine höhere Überlebensrate als Männer.
# In der 1. Klasse war die Überlebensrate am höchsten, insbesondere bei Frauen.
# In der 3. Klasse hatten Männer kaum Überlebenschancen, während einige Frauen
# überlebt haben.
# Mit höherer Klasse waren die Überlebenschancen also größer.

# vi) Weitere sinnvolle Analysen und Visualisierungen
# Säulendiagramm die Häufigkeit der Überlebenden und Nicht-Überlebenden.
saeulendiagramm(titanic$Survived)
#Die Säule für „no“ (Nicht-Überlebende) ist deutlich höher 
#--> die Mehrheit der Passagiere ist gestorben. 

# Visualisierung der Altersverteilung nach Überlebensstatus
ggplot(titanic, aes(x = Age, fill = factor(Survived))) +
  geom_histogram(bins = 30, position = "dodge") +
  labs(title = "Altersverteilung nach Überlebensstatus", x = "Alter", y = "Anzahl der Passagiere") +
  scale_fill_manual(values = c("red", "green")) +
  theme_minimal()
plot(Survived~Age,titanic, main="Überlebensstatus nach Altersverteilung",
     ylab="überlebt", xlab="Alter",yaxt="n")
axis(2,at=c(0.25,0.75),labels=c("Ja","Nein"),tick=FALSE)

#  Ein Histogramm, das zeigt, wie sich das Alter in Bezug auf den Überlebensstatus verteilt.
#  Kinder (< 10 Jahre) hatten eine höhere Überlebensrate,da viele gerettet wurden („Frauen und Kinder zuerst“). 
#  Die meisten Erwachsenen zwischen 20–40 Jahren hatten eine hohe Sterblichkeit.
#  Senioren hatten eine sehr geringe Überlebenschance.
# Schlussfolgerung: Jüngere Passagiere hatten bessere Überlebenschancen, insbesondere Kleinkinder.


# Visualisierung der Ticketpreisverteilung nach Überlebensstatus und Klasse
ggplot(titanic, aes(x = factor(Pclass), y = Fare, fill = factor(Survived))) +
  geom_boxplot() +
  labs(title = "Ticketpreis nach Überlebensstatus und Klasse", x = "Klasse", y = "Ticketpreis") +
  scale_fill_manual(values = c("red", "green")) 
  theme_minimal()
#Ein Boxplot, der zeigt, wie sich der Ticketpreis in den verschiedenen Klassen 
#zwischen Überlebenden und Nicht-Überlebenden unterscheidet.
