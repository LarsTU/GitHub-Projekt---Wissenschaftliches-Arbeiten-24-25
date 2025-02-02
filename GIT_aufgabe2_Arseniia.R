#iii)
#Funktion für bivariate deskriptive Statistiken 
#zwischen zwei kategorialen Variablen (Kontingenztafel mit absoluter 
#und mit relativer Haufigkeit)
f_3 <- function(x, y) {
  #Kontingenztafel mit absoluter Haufigkeit erstellen
  abs_tabelle <- table(x,y)
  
  #Kontingenztafel mit relativer Haufigkeit erstellen
  rel_tabelle <- prop.table(abs_tabelle, margin = 1)

  return(list("Kontingenztafel mit absoluter Haufigkeit" = abs_tabelle, 
              "Kontingenztafel mit relativer Haufigkeit" = rel_tabelle))
}

#Beispiel
f_3(titanic$Survived, titanic$Sex)

#iv)
#Funktion für bivariate deskriptive Statistiken 
#zwischen einer metrischen (x) und einer dichotomen (y) Variablen
f_4 <- function(x, y) {
  #Mittelwert, Median, Standardabweichung für jede Gruppe
  summary_data <- data.frame(
    Gruppe = levels(y),
    Mittelwert = tapply(x, y, mean, na.rm = TRUE),
    Median = tapply(x, y, median, na.rm = TRUE),
    Std = tapply(x, y, sd, na.rm = TRUE)
  )
  
  return(summary_data)
}

#Beispiel 
f_4(titanic$Age, titanic$Survived)

