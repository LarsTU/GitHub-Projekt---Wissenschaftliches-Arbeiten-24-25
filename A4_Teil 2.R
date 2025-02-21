#Aufgabe 4 iv-vi
library(ggplot2)

# iv) Bivariate Analysen zwischen einer metrischen und einer zweiteiligen Variablen
# Zusammenhang zwischen Alter und Überlebensstatus
zusammenhang_metrisch_dichotom(titanic$Age, titanic$Survived)
# Es wird untersucht, ob jüngere oder ältere Passagiere eher überlebt haben.

# Zusammenhang zwischen Ticketpreis und Überlebensstatus
zusammenhang_metrisch_dichotom(titanic$Fare, titanic$Survived)
# Sie zeigt, ob es einen Zusammenhang zwischen einem höheren Ticketpreis
#und der Wahrscheinlichkeit zu überleben gibt

# v) Visualisierung von drei oder vier kategorialen Variablen
# Visualisierung von Überlebensrate in Bezug auf Klasse und Geschlecht
visualisiere_kategorial(titanic, "Pclass", "Survived", "Sex")
#So kann man erkennen, ob Frauen oder Männer in bestimmten Klassen eher
#überlebt haben.

# vi) Weitere sinnvolle Analysen und Visualisierungen
# Balkendiagramm die Häufigkeit der Überlebenden und Nicht-Überlebenden.
saeulendiagramm(titanic$Survived)

# Visualisierung der Altersverteilung nach Überlebensstatus
ggplot(titanic, aes(x = Age, fill = factor(Survived))) +
  geom_histogram(bins = 30, position = "dodge") +
  labs(title = "Altersverteilung nach Überlebensstatus", x = "Alter", y = "Anzahl der Passagiere") +
  scale_fill_manual(values = c("red", "green")) +
  theme_minimal()
#Ein Histogramm, das zeigt, wie sich das Alter in Bezug auf den
#Überlebensstatus verteilt.

# Visualisierung der Ticketpreisverteilung nach Überlebensstatus und Klasse
ggplot(titanic, aes(x = factor(Pclass), y = Fare, fill = factor(Survived))) +
  geom_boxplot() +
  labs(title = "Ticketpreis nach Überlebensstatus und Klasse", x = "Klasse", y = "Ticketpreis") +
  scale_fill_manual(values = c("red", "green")) 
  theme_minimal()
#Ein Boxplot, der zeigt, wie sich der Ticketpreis in den verschiedenen Klassen 
#zwischen Überlebenden und Nicht-Überlebenden unterscheidet.
