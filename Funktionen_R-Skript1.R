# Aufgabe 2

source("Funktionen-R-Skript 2.R") # Helferfunktionen
titanic <- read.csv("titanic_cleaned.csv")
library(ggplot2)
# i) Funktion für metrische Variablen (angepasst):

analyse_metrisch <- function(variable) {
    variable <- convertToFactor(variable) # Umwandlung falls nötig
    statistiken <- list(
        Mittelwert = mean(variable, na.rm = TRUE), # Mittelwert
        Median = median(variable, na.rm = TRUE), # Median
        Standardabweichung = sd(variable, na.rm = TRUE), # Standardabweichung
        Minimum = min(variable, na.rm = TRUE), # Minimum
        Maximum = max(variable, na.rm = TRUE), # Maximum
        Quartile = quantile(variable, probs = c(0.25, 0.75), na.rm = TRUE),
        # unteres und oberes Quartil
        range = max(variable, na.rm = TRUE) - min(variable, na.rm = TRUE),
        # range/ Spannweite
        Interquartilsabstand = IQR(variable, na.rm = TRUE),
        # Interquartilsabstand (oberes Quartil - unteres Quartil)
        Modus = berechneModus(variable) # Nutzung der Modus-Helferfunktion
    )

    return(statistiken) # Rückgabe der Statistiken für metrische Variablen
}

# ii) Funktion für kategoriale Variablen:

analyse_kategorial <- function(variable) {
    variable <- convertToFactor(variable) # Umwandlung falls nötig
    # Häufigkeitstabelle (abs. Häufigkeit) für die Ausprägungen
    # einer kategorialen Variable
    absolute_häufigkeiten <- table(variable, useNA = "ifany")
    # Argument useNA = "ifany" --> falls es fehlende Werte gibt, wird deren
    # Häufigkeit in der Tabelle angezeigt

    # relative Häufigkeitstabelle für die Ausprägungen
    # einer kategorialen Variable
    relative_häufigkeiten <- prop.table(absolute_häufigkeiten)
    # Funktion prob.table wandelt die Häufigkeitstabelle (absolute_häufigkeiten)
    # in eine relative Häufigkeitstabelle um

    # Modus für kategoriale Variablen
    modus <- berechneModus(variable) # Nutzung der Modus-Helferfunktion
    # speichert Statistiken in einer Liste
    statistiken <- list(
        Absolute_Häufigkeiten = absolute_häufigkeiten,
        Relative_Häufigkeiten = relative_häufigkeiten,
        Modus = modus
    )

    return(statistiken) # Rückgabe der Statistiken für kategoriale Variablen
}
# iii)
# Funktion für bivariate deskriptive Statistiken
# zwischen zwei kategorialen Variablen (Kontingenztafel mit absoluter
# und mit relativer Häufigkeit)
zusammenhang_kategorial <- function(x, y) {
    x <- convertToFactor(x)
    y <- convertToFactor(y)
    # Kontingenztafel mit absoluter Häufigkeit erstellen
    abs_tabelle <- table(x, y)

    # Kontingenztafel mit relativer Häufigkeit erstellen
    rel_tabelle <- prop.table(abs_tabelle, margin = 1)

    return(list(
        "Kontingenztafel mit absoluter Haufigkeit" = abs_tabelle,
        "Kontingenztafel mit relativer Haufigkeit" = rel_tabelle
    ))
}

# iv)
# Funktion für bivariate deskriptive Statistiken
# zwischen einer metrischen (x) und einer dichotomen (y) Variablen
zusammenhang_metrisch_dichotom <- function(x, y) {
    y <- convertToFactor(y)
    # Mittelwert, Median, Standardabweichung für jede Gruppe
    summary_data <- data.frame(
        Gruppe = levels(y),
        Mittelwert = tapply(x, y, mean, na.rm = TRUE),
        Median = tapply(x, y, median, na.rm = TRUE),
        Std = tapply(x, y, sd, na.rm = TRUE)
    )

    return(summary_data)
}

# v) Funktion zur Visualisierung von 3 oder 4 kategorialen Variablen
visualisiere_kategorial <- function(data, var1, var2, var3, var4 = NULL) {
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
balkendiagramm <- function(variable) {
  library(ggplot2)  # ggplot2 laden
  variable <- convertToFactor(variable)  # Umwandlung falls nötig
  
  df <- data.frame(
    Kategorie = names(table(variable)),
    Häufigkeit = as.vector(table(variable))
  )
  
  plot <- ggplot(df, aes(x = Kategorie, y = Häufigkeit, fill = Kategorie)) +
    geom_bar(stat = "identity") +
    theme_minimal() +
    xlab("Kategorie") +
    ylab("Häufigkeit")
  
  return(visualisierungsHelfer(plot, "Balkendiagramm der kategorialen Variable"))
}


visualisiere_kategorial(titanic, "Pclass", "Sex", "Survived")
balkendiagramm(titanic$Embarked)
