# Aufgabe 2, i) und ii)

source("Funktion-R_Skript 2.R")
# i) Funktion für metrische Variablen (angepasst):

analyse_metrisch = function(variable){
  variable = convertToFactor(variable)  # Umwandlung falls nötig
  statistiken = list(
    Mittelwert = mean(variable, na.rm = TRUE), # Mittelwert
    Median = median(variable, na.rm = TRUE), # Median
    Standardabweichung = sd(variable, na.rm = TRUE), # Standardabweichung
    Minimum = min(variable, na.rm = TRUE), # Minimum
    Maximum = max(variable, na.rm = TRUE), # Maximum
    Quartile = quantile(variable, probs = c(0.25, 0.75)), 
    # unteres und oberes Quartil
    range = max(variable, na.rm = TRUE) - min(variable, na.rm = TRUE), 
    # range/ Spannweite
    Interquartilsabstand = IQR(variable, na.rm = TRUE),
    # Interquartilsabstand (oberes Quartil - unteres Quartil)
    Modus = berechneModus(variable)  # Nutzung der Modus-Helferfunktion
  )
  
  return(statistiken) # Rückgabe der Statistiken für metrische Variablen
}



# ii) Funktion für kategoriale Variablen:

analyse_kategorial = function(variable){
  variable = convertToFactor(variable)  # Umwandlung falls nötig
  # Häufigkeitstabelle (abs. Häufigkeit) für die Ausprägungen 
  # einer kategorialen Variable
  absolute_häufigkeiten = table(variable, useNA = "ifany") 
  # Argument useNA = "ifany" --> falls es fehlende Werte gibt, wird deren 
  # Häufigkeit in der Tabelle angezeigt
  
  # relative Häufigkeitstabelle für die Ausprägungen 
  # einer kategorialen Variable
  relative_häufigkeiten = prop.table(absolute_häufigkeiten)
  # Funktion prob.table wandelt die Häufigkeitstabelle (absolute_häufigkeiten) 
  # in eine relative Häufigkeitstabelle um 
  
  # Modus für kategoriale Variablen
  modus = berechneModus(variable)  # Nutzung der Modus-Helferfunktion
  # speichert Statistiken in einer Liste
  statistiken = list(
    Absolute_Häufigkeiten = absolute_häufigkeiten,
    Relative_Häufigkeiten = relative_häufigkeiten,
    Modus = modus  
  )
  
  return (statistiken) # Rückgabe der Statistiken für kategoriale Variablen
}






