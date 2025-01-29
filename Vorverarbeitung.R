# Vorverarbeitung der Daten


# Einlesen der csv-Datei und speichern in der Variable titanic
titanic = read.csv("C:/Users/larse/OneDrive/Desktop/Uni/Inhalte/3. Semester/Wissenschaftliches Arbeiten/GitHub Projekt/titanic.csv")


# extrahiert aus der Spalte "Name" die Anrede der jeweiligen Person mit der
# Funktion sub() und schreibt diese in die neu erstellte Spalte "Title"
titanic$Title = sub(pattern = ".*, (.*?)\\..*", replacement = "\\1", x = titanic$Name)


# fasse unterschiedliche Anreden mit gleicher Bedeutung zusammen

# Anrede Miss, Ms und Mlle werden zu Ms zusammengefasst
# beschreiben eine junge unverheiratete Frau
titanic$Title[titanic$Title %in% c("Miss", "Ms", "Mlle")] = "Ms" 

# Anrede Mrs und Mme werden zu Mrs zusammengefasst
# beschreiben eine verheiratete Frau
titanic$Title[titanic$Title %in% c("Mrs", "Mme")] = "Mrs"

# Anrede the Countess und Lady werden ebenfalls zu Ms zusammengefasst,
# da nichts über den Famlienstand bekannt ist
titanic$Title[titanic$Title %in% c("the Countess", "Lady")] = "Ms"

# Anrede Don, Rev, Dr, Sir, Capt, Jonkheer, Major und Col werden zu Mr
# zusammengefasst, da es somit später einfacher wird, fehlende Werte beim Alter
# mithilfe der Anrede zu ergänzen
titanic$Title[titanic$Title %in% c("Don", "Rev", "Dr", "Sir", "Capt", "Jonkheer",
                                   "Major", "Col")] = "Mr"








