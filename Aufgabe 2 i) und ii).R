# Aufgabe 2, i) und ii)


# i) Funktion für metrische Variablen:

analyse_metrisch = function(variable){
  
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
    Modus = modus_metrisch(variable)
    # Modalwert/ Modus wird mithilfe einer Helfer-Funktion bestimmt
  )
  
  return(statistiken) # Rückgabe der Statistiken für metrische Variablen
}


# ii) Funktion für kategoriale Variablen:

analyse_kategorial = function(variable){
  
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
  modus = modus_kategorial(variable)

  
  # speichert Statistiken in einer Liste
  statistiken = list(
    Absolute_Häufigkeiten = absolute_häufigkeiten,
    Relative_Häufigkeiten = relative_häufigkeiten,
    Modus = modus  
  )
  
  return (statistiken) # Rückgabe der Statistiken für kategoriale Variablen
}



# Helfer-Funktionen, die in Funktionen-R-Skript 2 ergänzt werden

# Modus für kategoriale Variablen
modus_kategorial = function(variable) {
  
  if (all(is.na(variable))) {
    return(NA)  # Falls alle Werte NA sind, Modus = NA
  }
    
  tab = table(variable, useNA = "no")  # Häufigkeitstabelle ohne NA
  max_häufigkeit <- max(tab)  # Maximale Häufigkeit ermitteln
  modus_kateg <- names(tab[tab == max_häufigkeit])  
  # bestimmt Modus
    
  return(modus_kateg) # gibt Modus zurück
}

# Modus für metrische Variablen
modus_metrisch = function(variable) {
  
  if (all(is.na(variable))) {
    return(NA)  # Falls alle Werte NA sind, Modus = NA
  }
  
  tab = table(variable, useNA = "no")  # Häufigkeitstabelle ohne NA
  max_häufigkeit = max(tab)  # Maximale Häufigkeit ermitteln
  modus_metr = as.numeric(names(tab[tab == max_häufigkeit]))
  # bestimmt Modus
  
  return(modus_metr)
}




