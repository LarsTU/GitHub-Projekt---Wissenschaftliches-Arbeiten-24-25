# Aufgabe 2, v) und vi)

 titanic <- read.csv("titanic.csv")

# v) Funktion zur Visualisierung von 3 oder 4 kategorialen Variablen
# Ein gruppierte Balkendiagramm
library(ggplot2) # Lade das ggplot2-Paket für die Visualisierung

visualisiere_kategorial = function(data, var1, var2, var3, var4 = NULL) {
  
  # Falls nur drei Variablen angegeben sind, verwende facet_wrap für die 3. Variable
  if (is.null(var4)) {
    plot <- ggplot(data, aes_string(x = var1, fill = var2)) +
      geom_bar(position = "dodge") +  # Erstelle gruppierte Balkendiagramme
      facet_wrap(~ get(var3)) + # Erzeuge separate Plots für jede Ausprägung von var3
      theme_minimal()
  } else {
    # Falls vier Variablen angegeben sind, verwende facet_grid für die 3. und 4. Variable
    plot <- ggplot(data, aes_string(x = var1, fill = var2)) + 
      geom_bar(position = "dodge") + # Erstelle gruppierte Balkendiagramme
      facet_grid(get(var3) ~ get(var4)) + # Erzeuge ein Raster aus Plots basierend auf var3 und var4
      theme_minimal()
  }
  
return(plot)  # Rückgabe des erstelltes Diagramm
}



# vi) Weitere Funktionen zur Deskription und Visualisierung

# z.b Funktion zur Erstellung eines Balkendiagramms für eine kategoriale Variable
balkendiagramm_neu = function(variable) {
  df = as.data.frame(table(variable))  # Erstelle eine Häufigkeitstabelle
  
  ggplot(df, aes(x = variable, y = Freq, fill = variable)) +  # Achsen & Farben definieren
    geom_bar(stat = "identity") +  # Balkendiagramm erstellen mit exakten Häufigkeiten
    theme_minimal() +  # Verwende minimalistisches Theme
    xlab("Kategorie") +  # Beschrifte x-Achse
    ylab("Häufigkeit") +  # Beschrifte y-Achse
    ggtitle("Balkendiagramm der kategorialen Variable") +  #  Diagrammtitel
    theme(legend.position = "none")  # unnötige Legende entfernen
}
#  Kann als zusätzliche Funktion genutzt werden, um einfache Balkendiagramme für die Häufigkeit von
# Variablen wie Survived oder Pclass zu erstellen.




