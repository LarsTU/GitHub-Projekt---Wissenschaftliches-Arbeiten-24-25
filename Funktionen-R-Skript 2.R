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
  # Für numerische Variablen in numerisches Format umwandeln
  if (is.numeric(x)) {
    modus <- as.numeric(modus)
  }
  return(modus)
}

# Passt ein ggplot2-Objekt mit einem standardisierten Layout und Theme an,
# für eine konsistente Darstellung der Visualisierungen.
# Parameter:
#   - plotObj: Ein ggplot2-Objekt, das angepasst werden soll.
#   - titel: Ein String, der als Plot-Titel genutzt wird.
#   - x_achse: Optionaler String zur Beschriftung der x-Achse.
#   - y_achse: Optionaler String zur Beschriftung der y-Achse.
# Rückgabe:
#   - Das angepasste ggplot2-Objekt.
# ------------------------------------------------------------------
visualisierungsHelfer <- function(plotObj, titel, x_achse = NULL, y_achse = NULL) {
  
  library(ggplot2)
  
  plotObj <- plotObj +
    ggtitle(titel) +
    theme_minimal() +
    theme(
      plot.title = element_text(hjust = 0.5, size = 16, face = "bold"),
      axis.title = element_text(size = 14),
      axis.text = element_text(size = 12)
    )
  
  if (!is.null(x_achse)) {
    plotObj <- plotObj + xlab(x_achse)
  }
  if (!is.null(y_achse)) {
    plotObj <- plotObj + ylab(y_achse)
  }
  
  return(plotObj)
}
