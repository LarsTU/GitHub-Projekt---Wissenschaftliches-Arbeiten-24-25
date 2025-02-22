
# Aufgabe 4 Teil 1
source("Funktionen_R-Skript1.R") # Helferfunktionen
titanic = readRDS("titanic_cleaned.Rds")
library(ggplot2)

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


analyse_kategorial(titanic$Sex)
# Häufigkeitstabellen (absolute und relative Häufigkeit) für das Geschlecht
# der Passagiere

# $Absolute_Häufigkeiten
# variable
# female   male 
#    314    577 

# $Relative_Häufigkeiten
# variable
#   female     male 
# 0.352413 0.647587 

# $Modus
# [1] "male"

# Auf der Titanic waren deutlich mehr Männer (577) als Frauen (314).


analyse_kategorial(titanic$Embarked)
# Häufigkeitstabellen (absolute und relative Häufigkeit) für die Zustiegshafen

# $Absolute_Häufigkeiten
# variable
#   Cherbourg  Queenstown Southampton        <NA> 
#         168          77         644           2 

# $Relative_Häufigkeiten
# variable
#   Cherbourg  Queenstown Southampton        <NA> 
# 0.188552189 0.086419753 0.722783389 0.002244669 

# $Modus
# [1] "Southampton"

# Die meisten Gäste sind in Southampton zugestiegen (644 von 891 --> ~72%), was
# auch zu erwarten ist, da die Titanic ihre Reise in Southampton begonnen hat.
# In Cherbourg sind ca. 19% der Gäste zugestiegen und die wenigsten Gäste sind
# in Queenstown zugestiegen (~9%).


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

zusammenhang_kategorial(titanic$Pclass, titanic$Survived)
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

zusammenhang_kategorial(titanic$Embarked,titanic$Pclass)
# Kontingenztafeln mit absoluten und relativen Häufigkeiten der Zustiegshafen
# und der Klassenstufe

# $`Kontingenztafel mit absoluter Häufigkeit`
#              y
# x               3   2   1
#   Cherbourg    66  17  85
#   Queenstown   72   3   2
#   Southampton 353 164 127

# $`Kontingenztafel mit relativer Häufigkeit`
#              y
# x                       3           2           1
#   Cherbourg   0.074240720 0.019122610 0.095613048
#   Queenstown  0.080989876 0.003374578 0.002249719
#   Southampton 0.397075366 0.184476940 0.142857143

# Den größten Anteil der Passagiere übernehmen die Passagiere, die in Southampton
# zugestiegen und in Klasse 3 sind (~40%). Insgesamt ist der Anteil der Passagiere, 
# die sich in Klasse 1 und 2 befinden, bei den Zustiegshafen Queenstown und Southampton
# mit 97% (75 von 77 in Queenstown) und 80% (517 von 644 in Southampton) sehr groß.
# In Cherbourg hingegen sind viele Passagiere aus Klasse 1 zugestiegen, 85 von
# von 168, mit einem Anteil von ca 51%. 


#iv)
zusammenhang_metrisch_dichotom(titanic$Age, titanic$Survived)
#Analyse des Zusammenhangs zwischen Alter und Überlebensrate 

#         Gruppe Mittelwert Median      Std
#     no      no   30.21038     30 12.63442
#    yes    yes   28.13061     28 14.05513

# Es gibt keinen wesentlichen Unterschied zwischen dem Alter der überlebten und 
# der nicht überlebten Personen. Dennoch sind die Personen, die überlebt haben, im 
# Durchschnitt ein wenig jünger.


zusammenhang_metrisch_dichotom(titanic$Fare, titanic$Survived)
#Analyse des Zusammenhangs zwischen Ticketpreis und Überlebensrate 

#     Gruppe Mittelwert Median      Std
# no      no   22.11789   10.5 31.38821
# yes    yes   48.39541   26.0 66.59700

# Es gibt einen wesentlichen Unterschied zwischen dem Ticketpreis der überlebten 
# und der nicht überlebten Personen. Die überlebten Personen haben im 
# Durchschnitt doppelt so viel für Tickets bezahlt, wie die Personen, die nicht
# überlebt haben. Personen, die mehr für ein Ticket bezahlt haben, wurden also
# vorzugsweise gerettet, was sich mit den Ergebnissen deckt, dass Personen aus einer
# höheren Klasse (1) zu einem größeren Anteil überlebt haben, da für eine höhere
# Klasse auch mehr gezahlt werden muss. 


#Aufgabe 4 v-vi

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


# Visualisierung des Überlebensstatus nach Altersverteilung mit einem Mosaikplot
plot(Survived~Age,titanic, main="Überlebensstatus nach Altersverteilung")
# Der Mosaikplot zeigt:
#  Kinder (< 10 Jahre) hatten eine höhere Überlebensrate als Erwachsene
# („Frauen und Kinder zuerst“). 
# Erwachsene zwischen 20–50 Jahren hatten
# eine niedrigere Überlebenschance
# Senioren (wenn auch wenige -> letzte Säule sehr schmal) hatten 
# die niedrigste Überlebenschance.
# Schlussfolgerung: Jüngere Passagiere hatten bessere Überlebenschancen, insbesondere Kleinkinder.


# Visualisierung der Ticketpreisverteilung nach Überlebensstatus und Klasse
ggplot(titanic, aes(x = factor(Pclass), y = Fare, fill = factor(Survived))) +
  geom_boxplot() +
  labs(title = "Ticketpreis nach Überlebensstatus und Klasse", x = "Klasse", y = "Ticketpreis") +
  scale_fill_manual(values = c("salmon", "mediumturquoise")) +
  theme_minimal()

#  Ein Boxplot, der zeigt, wie sich der Ticketpreis in den verschiedenen Klassen zwischen 
# Überlebenden und Nicht-Überlebenden unterscheidet.
# 1. Klasse: Höhere Ticketpreise und mehr Überlebende.
# 2. Klasse: Niedrige Ticketpreise, aber sehr wenige Überlebende.
# Große Preisunterschiede in der 1. Klasse – einige zahlten extrem hohe Beträge.
# Schlussfolgerung: Wohlhabendere Passagiere (1. Klasse) hatten bessere Überlebenschancen, 
# während die ärmeren Passagiere (3. Klasse) benachteiligt waren.

# --------------------------------------------------------
#Entferne Ausreißer
remove_outliers <- function(df, value_col, group_col) {
  # value_col: Spalte mit den numerischen Werten, aus denen die Ausreißer entfernt werden sollen
  # group_col: Spalte, nach der gruppiert wird (z.B. Klassen oder Kategorien)
  
  # Sicherstellen, dass die Spalten als Namen übernommen werden
  value_col <- as.name(value_col)
  group_col <- as.name(group_col)
  
  # Split nach Gruppen und Filterung der Ausreißer
  df_clean <- do.call(rbind, lapply(split(df, df[[group_col]]), function(sub_df) {
    # IQR für jede Gruppe berechnen
    Q1 <- quantile(sub_df[[value_col]], 0.25, na.rm = TRUE)
    Q3 <- quantile(sub_df[[value_col]], 0.75, na.rm = TRUE)
    IQR <- Q3 - Q1
    
    # Filter: Nur Werte innerhalb von [Q1 - 1.5*IQR, Q3 + 1.5*IQR] behalten
    sub_df <- subset(sub_df, 
                     sub_df[[value_col]] >= (Q1 - 1.5 * IQR) & 
                       sub_df[[value_col]] <= (Q3 + 1.5 * IQR))
    return(sub_df)
  }))
  
  return(df_clean)
}

# Bereinigte Daten für Pclass = 1 erstellen
titanic_clean <- remove_outliers(titanic,
                                 value_col = "Fare",
                                 group_col = "Pclass")


plot=ggplot(titanic_clean, aes(x = factor(Pclass), y = Fare, fill = Survived)) +
  geom_boxplot() +
  scale_fill_manual(values = c("no" = "salmon", "yes" = "mediumturquoise")) +
  labs(title = "Ticketpreis nach Überlebensstatus und Klasse (ohne Ausreißer in Klasse 1)",
       x = "Klasse",
       y = "Ticketpreis") +
  theme_minimal()
visualisierungsHelfer(plot, "Ticketpreis nach Überlebensstatus und Klasse (ohne Ausreißer in Klasse 1)")

# In allen Klassen hatten Überlebende tendenziell höhere Ticketpreise
# als Nicht-Überlebende 
# Besonders in der 1. Klasse sind die 
# Ticketpreise der Überlebenden deutlich höher.
# In den Klasse 2 und 3 sind die Boxen enger beieinander, 
# was ähnlichere Ticketpreise für Überlebende und Nicht-Überlebende 
# in diesen Klassen zeigt.
# 1. Klasse hat insgesamt die höchsten Ticketpreise mit größerer Preisspanne.
# 2. Klasse hat mittlere Preise 
# 3. Klasse zeigt sehr niedrige Preise 

#---------------------------------------------------------------------
visualisiere_kategorial(titanic, "Pclass", "Embarked", "Sex")
#das Säulendiagramm zeigt,
# Southampton  dominiert in allen Klassen und bei beiden Geschlechtern, 
# besonders bei 3. Klasse und Männern.
# Cherbourg  ist besonders bei 1. Klasse vertreten, sowohl bei Männern als auch Frauen.
# Queenstown kommt sehr selten vor und hauptsächlich bei 3. Klasse.
