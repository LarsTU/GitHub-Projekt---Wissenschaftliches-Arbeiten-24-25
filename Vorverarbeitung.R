# Vorverarbeitung der Daten


# Einlesen der csv-Datei und speichern in der Variable titanic
titanic = read.csv("C:/Users/larse/OneDrive/Desktop/Uni/Inhalte/3. Semester/Wissenschaftliches Arbeiten/GitHub Projekt/titanic.csv")


# extrahiert aus der Spalte "Name" die Anrede der jeweiligen Person mit der
# Funktion sub() und schreibt diese in die neu erstellte Spalte "Title"
titanic$Title = sub(pattern = ".*, (.*?)\\..*", replacement = "\\1",
                    x = titanic$Name)


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
titanic$Title[titanic$Title %in% c("Don", "Rev", "Dr", "Sir", "Capt", 
                                   "Jonkheer","Major", "Col")] = "Mr"


# codiere Variablen "Survived", "Sex" und "Embarked" als factor um

# Variable "Survived" als Faktor umkodieren 
# --> 0 steht für nicht überlebt (no) und 1 steht für überlebt (yes)
titanic$Survived = factor(titanic$Survived, 
                          levels = c(0,1), labels = c("no", "yes"))

# Variable "Sex" als Faktor umkodieren
# --> female steht für weiblich und male für männlich
titanic$Sex = factor(titanic$Sex, 
                     levels = c("female", "male"), labels = c("female", "male"))

# Variable "Embarked" als Faktor umkodieren
titanic$Embarked = factor(titanic$Embarked, 
                          levels = c("C", "Q", "S"), 
                          labels = c("Cherbourg", "Queenstown", "Southampton"))


# Variable "Pclass" in einen ordered-factor überführen

