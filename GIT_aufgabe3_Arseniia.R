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

# Die Analyse zeigt, dass die meisten Passagiere der Titanic noch sehr jung 
# waren (Mittelwert 29.41 und Median 30).

analyse_metrisch(titanic$Fare)
#Analyse von dem  Ticketpreis (Mittelwert, Median, Standardabweichung, Minimum,
#Maximum, Quartile, Range, Interquartilsabstand und Modus). 
#Es liefert uns Information, wie die Ticketpreisverteilung aussieht.

#Mittelwert - 32.20421
#Median - 14.4542
#Standardabweichung - 49.69343
#Minimum - 0
#Maximum - 512.3292
#Quartile(25% und 75%) - 7.9104 und 31.0000 
#range - 512.3292
#Interquartilsabstand - 23.0896
#Modus -  8.05

# Die Ticketpreise sind sehr unterschiedlich (Minimum 0 und Maximum 512). 
# Auch die Standardabweichung der Ticketpreise ist mit 49.69 groß, was mit den
# unterschiedlichen Klassen und den dadurch sehr verschiedenen Ticketpreisen
# zu tun hat. 

#ii)
analyse_kategorial(titanic$Survived)
#Häufigkeitstabellen (mit absoluter und mit relativer Häufigkeit) für die 
#Variable Survived, die zeigen, wie viele Passagiere überlebt haben.

# $Absolute_Häufigkeiten
# variable
# no yes 
# 549 342 

# $Relative_Häufigkeiten
# variable
# no       yes 
# 0.6161616 0.3838384 

# $Modus
# [1] "no"

#Die meisten Passagiere haben nicht überlebt (549 Passagiere - 62%). Die 
#anderen 342 Passagiere (38%) wurden gerettet.

analyse_kategorial(titanic$Pclass)
#Häufigkeitstabellen (mit absoluter und mit relativer Häufigkeit) für die 
#Variable PClass, um zu analysieren, wie sich die Passagiere auf die 
#verschiedenen Klassen verteilen.

# $Absolute_Häufigkeiten
# variable
# 3   2   1 
# 491 184 216 

# $Relative_Häufigkeiten
# variable
# 3         2         1 
# 0.5510662 0.2065095 0.2424242 

# $Modus
# [1] "3"

# Die meisten Passagiere waren in der 3. Klasse (491 Personen). An zweiter Stelle 
# steht die 1. Klasse mit 216 Personen, danach kommt die 2. Klasse 
# mit 184 Personen.

#iii)
zusammenhang_kategorial(titanic$Survived, titanic$Sex)
#Kontingenztafeln (mit absoluter und mit relativer Häufigkeit), um den 
#Zusammenhang zwischen Überlebensrate und Geschlecht zu analysieren

# $`Kontingenztafel mit absoluter Häufigkeit`
#      y 
# x     female male
#   no      81  468
#   yes    233  109

# $`Kontingenztafel mit relativer Häufigkeit`
#       y
#   x         female       male
#     no  0.09090909 0.52525253
#     yes 0.26150393 0.12233446

# Zunächst fällt auf, dass es insgesamt deutlich mehr Männer (577) als Frauen (314)
# auf der Titanic gab.
# Außerdem zeigt die Analyse, dass die meisten Frauen überlebten (233 von 314), 
# während die meisten Männer nicht überlebten (468 von 577).  
# Es gibt also einen Zusammenhang zwischen Geschlecht und Überlebensrate, da 
# wahrscheinlich zuerst Frauen und Kinder gerettet wurden. 

zusammenhang_kategorial( titanic$Pclass, titanic$Survived)
#Kontingenztafeln (mit absoluter und mit relativer Häufigkeit), um den 
#Zusammenhang zwischen Überlebensrate und Klasse zu analysieren

# $`Kontingenztafel mit absoluter Häufigkeit`
#    y
# x    no yes
#   3 372 119
#   2  97  87
#   1  80 136

# $`Kontingenztafel mit relativer Häufigkeit`
#    y
# x           no        yes
#  3 0.41750842 0.13355780
#  2 0.10886644 0.09764310
#  1 0.08978676 0.15263749


# Es fällt auf, dass je höher die Klasse (Klasse 1 ist die höchste Klasse), desto
# größer ist der Anteil der Passagiere in dieser Klasse, die überlebt haben. 
# Während in Klasse 3 nur 119 von 491 Passagieren überlebten (~24%), waren es in 
# Klasse 2 schon 87 von 184 (~47%) und in Klasse 1 haben die meisten Passagiere
#(136 von 216) sogar überlebt (~63%). Man kann also davon ausgehen, dass Passagiere
# der höheren Klassen (1 und 2) zuerst gerettet wurden. 

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

