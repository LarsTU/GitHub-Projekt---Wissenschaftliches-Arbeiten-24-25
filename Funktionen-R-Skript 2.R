# Funktionen-R-Skript 2: Allgemeine Helferfunktionen
# Dieses Skript enthält Funktionen, die in Funktionen-R-Skript 1 genutzt werden,
# um wiederkehrende Aufgaben wie Berechnungen, Formatierung und Visualisierung
# zentral zu lösen.
# ------------------------------------------------------------------


# Berechnet den Modus eines Vektors.
# Falls mehrere Werte gleich häufig vorkommen, werden alle zurückgegeben.
# Parameter:
#   - x: Ein Vektor (numerisch oder kategorial)
# Rückgabe:
#   - Der/die Modus/Modi des Vektors.
berechneModus <- function(x) {
  # Entferne NA-Werte
  x = x[!is.na(x)]
  # Erstelle eine Häufigkeitstabelle
  tab = table(x)
  # Ermittle den maximalen Häufigkeitswert
  max_häufigkeit = max(tab)
  # Ermittle alle Werte, die diesen Häufigkeitswert haben
  modus = names(tab)[tab == max_häufigkeit]
  return(modus)
}

