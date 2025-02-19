# Aufgabe 3
source("Funktionen_R-Skript1.R") # Helferfunktionen
titanic = readRDS("titanic_cleaned.Rds")


#Anwendung von Funktionen aus Aufgabe 2.a
#i)
analyse_metrisch(titanic$Age)
#Analyse von dem Alter (Mittelwert, Median, Standardabweichung, Minimum,
#Maximum, Quartile, Range, Interquartilsabstand und Modus). 
#Es liefert uns Information, wie sich die Altersverteilung der Passagiere 
#auf der Titanic gestaltet.
#Mittelwert - 29.41209
#Median - 30
#Standardabweichung - 13.22881
#Minimum - 0.42
#Maximum - 80
#Quartile(25% und 75%) - 22 und 35 
#range - 79.58
#Interquartilsabstand - 13
#Modus - 30


analyse_metrisch(titanic$Fare)
#Analyse von dem  Ticketpreis (Mittelwert, Median, Standardabweichung, Minimum,
#Maximum, Quartile, Range, Interquartilsabstand und Modus). 
#Es liefert uns Information, wie sich Ticketpreisverteilung aussieht.
#Mittelwert - 32.20421
#Median - 14.4542
#Standardabweichung - 49.69343
#Minimum - 0
#Maximum - 512.3292
#Quartile(25% und 75%) - 7.9104 und 31.0000 
#range - 512.3292
#Interquartilsabstand - 23.0896
#Modus -  8.05

#ii)
analyse_kategorial(titanic$Survived)
#Häufigkeitstabellen (mit absoluter und mit relativer Häufigkeit) für die 
#Variable Survived, die zeigen, wie viele Passagiere ueberlebt haben.
#Die meisten Passagieren wurden nicht ueberlebt (549 Passagiere - 0.61%). Die 
#anderen 342 Passagiere (0.38%) wurden gerettet.

analyse_kategorial(titanic$Pclass)
#Häufigkeitstabellen (mit absoluter und mit relativer Häufigkeit) für die 
#Variable PClass, um zu analysieren, wie sich die Passagiere auf die 
#verschiedenen Klassen verteilen.
#Die meisten Leute waren in der 3. Klasse (491 Personen). An zweiter Stelle 
#steht die 1. Klasse mit 216 Personen, danach kommt die 2. Klasse 
#mit 184 Personen.

#iii)
zusammenhang_kategorial(titanic$Survived, titanic$Sex)
#Kontingenztafeln (mit absoluter und mit relativer Häufigkeit), um den 
#Zusammenhang zwischen Überlebensrate und Geschlecht zu analysieren
#Die Analyse zeigt, dass die meisten Frauen überlebten, während die Männer 
#nicht überlebten. Das kann darauf hindeuten, dass es einen Zusammenhang 
#zwischen Überlebensrate und Geschlecht gibt.

zusammenhang_kategorial( titanic$Pclass, titanic$Survived)
#Kontingenztafeln (mit absoluter und mit relativer Häufigkeit), um den 
#Zusammenhang zwischen Überlebensrate und Klasse zu analysieren
#Die Analyse zeigt, dass je höher die Klasse ist, desto mehr Passagiere 
#überlebten. Das könnte darauf hindeuten, dass es einen Zusammenhang zwischen 
#Überlebensrate und Klasse gibt.


#iv)
zusammenhang_metrisch_dichotom(titanic$Age, titanic$Survived)
#Analyse des Zusammenhangs zwischen Alter und Überlebensrate 
#Es gibt keinen wesentlichen Unterschied zwischen dem Alter der überlebten und 
#der nicht überlebten Personen. Dennoch sind die überlebten Personen im 
#Durchschnitt ein bisschen älter.

zusammenhang_metrisch_dichotom(titanic$Fare, titanic$Survived)
#Analyse des Zusammenhangs zwischen Ticketpreis und Überlebensrate 

#Es gibt einen wesentlichen Unterschied zwischen dem Ticketpreis der überlebten 
#und der nicht überlebten Personen. Die überlebten Personen haben im 
#Durchschnitt doppelt so viel für Tickets bezahlt (im Mittel 48 Euro), 
#während die nicht überlebten nur 22 Euro im Durchschnitt bezahlten.

