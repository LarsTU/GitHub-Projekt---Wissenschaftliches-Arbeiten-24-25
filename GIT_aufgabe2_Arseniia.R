#iii)

#Funktion für bivariate deskriptive Statistiken 
#zwischen zwei kategorialen Variablen (Kontingenztafel mit absoluter 
#und mit relativer Haufigkeit)
f_3 <- function(x, y) {
  #Kontingenztafel mit absoluter Haufigkeit erstellen
  abs_tabelle <- table(x,y)
  
  #Kontingenztafel mit relativer Haufigkeit erstellen
  rel_tabelle <- prop.table(abs_tabelle, margin = 1)
  
  print(list("Kontingenztafel mit absoluter Haufigkeit" = abs_tabelle, 
             "Kontingenztafel mit relativer Haufigkeit" = rel_tabelle))

  return(list("Kontingenztafel mit absoluter Haufigkeit" = abs_tabelle, 
              "Kontingenztafel mit relativer Haufigkeit" = rel_tabelle))
}

#Beispiel
result <- f_3(titanic$Survived, titanic$Sex)

