# Aufgabe 2, v) und vi)

# v) Funktion zur Visualisierung von 3 oder 4 kategorialen Variablen
library(ggplot2)

visualisiere_kategorial = function(data, var1, var2, var3, var4 = NULL) {
  var1 <- convertToFactor(var1)
  var2 <- convertToFactor(var2)
  var3 <- convertToFactor(var3)
  
  if (is.null(var4)) {
    plot <- ggplot(data, aes_string(x = var1, fill = var2)) +
      geom_bar(position = "dodge") +
      facet_wrap(~ get(var3)) +
      theme_minimal()
  } else {
    plot <- ggplot(data, aes_string(x = var1, fill = var2)) +
      geom_bar(position = "dodge") +
      facet_grid(get(var3) ~ get(var4)) +
      theme_minimal()
  }
  
  return(visualisierungsHelfer(plot, "Visualisierung kategorialer Variablen"))
  
}

# vi) Weitere Funktionen zur Deskription und Visualisierung

# z.b Balkendiagramm für eine kategoriale Variable
balkendiagramm = function(variable) {
  variable <- convertToFactor(variable)
  df = data.frame(Tabelle = table(variable))
  ggplot(df, aes(x = Tabelle.Var1, y = Tabelle.Freq, fill = Tabelle.Var1)) +
    geom_bar(stat = "identity") +
    theme_minimal() +
    xlab("Kategorie") +
    ylab("Häufigkeit") +
    ggtitle("Balkendiagramm der kategorialen Variable")
    return(visualisierungsHelfer(plot, "Balkendiagramm kategoriale Variable "))
  
}

titanic <- read.csv("titanic.csv")
visualisiere_kategorial(titanic, "Pclass", "Sex", "Survived")
balkendiagramm(titanic$Embarked)