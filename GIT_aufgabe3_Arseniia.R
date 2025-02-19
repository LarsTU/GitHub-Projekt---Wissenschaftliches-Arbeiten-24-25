# Aufgabe 3
source("Funktionen_R-Skript1.R") # Helferfunktionen
titanic = readRDS("titanic_cleaned.Rds")
# titanic = read.csv("titanic_cleaned_richtig2.csv", sep = ",")


#Anwendung von Funktionen aus Aufgabe 2.a
#i)
analyse_metrisch(titanic$Age)
#Analyse von dem Alter (Mittelwert, Median, Standardabweichung, Minimum,
#Maximum, Quartile, Range, Interquartilsabstand und Modus). 
#Es liefert uns Information, wie sich die Altersverteilung der Passagiere 
#auf der Titanic gestaltet.

analyse_metrisch(titanic$Fare)
#Analyse von dem  Ticketpreis (Mittelwert, Median, Standardabweichung, Minimum,
#Maximum, Quartile, Range, Interquartilsabstand und Modus). 
#Es liefert uns Information, wie sich Ticketpreisverteilung aussieht.

#ii)
analyse_kategorial(titanic$Survived)
#Häufigkeitstabellen (mit absoluter und mit relativer Häufigkeit) für die 
#Variable Survived, die zeigen, wie viele Passagiere ueberlebt haben.

analyse_kategorial(titanic$Pclass)
#Häufigkeitstabellen (mit absoluter und mit relativer Häufigkeit) für die 
#Variable PClass, um zu analysieren, wie sich die Passagiere auf die 
#verschiedenen Klassen verteilen.

#iii)
zusammenhang_kategorial(titanic$Survived, titanic$Sex)
#Kontingenztafeln (mit absoluter und mit relativer Häufigkeit), um den 
#Zusammenhang zwischen Überlebensrate und Geschlecht zu analysieren

zusammenhang_kategorial(titanic$Survived, titanic$Pclass)
#Kontingenztafeln (mit absoluter und mit relativer Häufigkeit), um den 
#Zusammenhang zwischen Überlebensrate und Klasse zu analysieren

#iv)
zusammenhang_metrisch_dichotom(titanic$Age, titanic$Survived)
#Analyse des Zusammenhangs zwischen Alter und Überlebensrate 

zusammenhang_metrisch_dichotom(titanic$Fare, titanic$Survived)
#Analyse des Zusammenhangs zwischen Ticketpreis und Überlebensrate 
