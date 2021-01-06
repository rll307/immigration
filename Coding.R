# General instructions
# After installing RQDA:
# 1) You will have to go to the RQDA GUI and create a project for your research
# 2) You will have to go to the RQDA GUI and create each of the categories. 
# 3) Then you use this script to import and coding
# Please, note that the number that identifies each category might change according to the creation of these categories. 

# Packages ----------------------------------------------------------------
# Just one package this time
library(RQDA)

# File importing the files ----------------------------------------------------------
file <- "/your/file/location"
files <-list(file)
write.FileList(files)

# Coding ------------------------------------------------------------------

#Opening the project (created previously)
openProject("coding.rqda")

# Please, note that the number of the categories might change axxording to your project
# For each category there is a loop that adds the category automatically to the project

#Adjectives
adj.1 <- c("squat", "filthy", "dirty", "behaviour", "very","unrestricted", "awful", 
           "black", "hungry", "older", "dangerous", "fake", "legitimate", "bad", 
           "bogus", "hard", "racist", "temporary", "higher", "Proper English", 
           "proper tickets", "english properly", "significant", "top", "white citizens", 
           "high hate", "high increase", "highest since", "highest on record", "genuine", 
           "poor", "destitute", "frustrated","poor levels of english","European squatters","poor foreigners",
           "bogus", "contamination", "hovels", 
           "smuggler","smuggled", 'biggest')
for (i in adj.1) {
  codingBySearch(i,fid=getFileIds(),cid=1, seperator="[.!?]",ignore.case=TRUE)
}
##
adj.2 <- c("unskilled migrants", "low-skilled","skilled-worker","jobless","qualification",
           "sharpest minds", "skilled migration", "qualified", "honest","workforce", 
           "academic", "brightest", "clean", "damaging", "exceptional", "extraordinary", 
           "lower", "unemployed", "highly-skilled", "sharpest","unskilled workers")
for (i in adj.2) {
  codingBySearch(i,fid=getFileIds(),cid=2, seperator="[.!?]",ignore.case=TRUE)
}
##
adj.3 <- c("home secretary", "theresa may", "mrs. may", "cabinet source", "mr johnson", "chairman",
           "mr farage", "nigel farage", "boris johnson", "trump", "spokesperson", 
           "Migrationwatch", "Official statisticians", "statistics", "study", "she", 
           "labour leader", "australian", "latest figures", "latest migration", 
           "latest research", "latest census", "honest", "surest","spokeswoman","spokesman",
           "economists","economist", "mayor","added","say","says")

adj.31 <- c("prime minister","president")

for (i in adj.31) {
  codingBySearch(i,fid=getFileIds(),cid=3, seperator="[.!?]",ignore.case=TRUE)
}
##
adj.5 <-c("legal", "illegal", "unlawful","unlawfully","asylum seekers","refugee", "genuine refugees",
          "commonwealth", "unauthorised", "Temporary migrants")
for (i in adj.5) {
  codingBySearch(i,fid=getFileIds(),cid=5, seperator="[.!?]",ignore.case=TRUE)
}
##
adj.6 <-c("Spain", "from outside the EU", "ethnic minorities", "Portugal", "from non-EEA countries",
          "from Europe", "from Eastern Europe", "from poorer EU countries", "from beyond the Europe",
          "from Romania and Bulgaria", "afghanistan", "bulgarian", "syrian", "vietnamese", "mexican",
          "Iranian", "Iran", "foreigner", "foreign", "nigerian", "african", "indian", "iraqi", 
          "turkish", "kurdish", "muslim", "asian", "EU migrants","Europeans", "European workers",
          "euro-immigrants", "European-based migration", "Europe's immigration", "Eastern European",
          "eastern Europe","east	Europeans","Mediterranean",
          "east", "cultural", "greek", "international", "overseas", "american", "global", 
          "native", "polish", "white immigrants", "britons" , "native counterparts", 
          "local", "australian", "national", "former", "jamaican", "economic refugees",
          "economic migrants","EU citizens",  "An Indian national from Goa", "Nigeria",
          " Eastern European workers", "migrant workers", 
          'ordinary workers')
for (i in adj.6) {
  codingBySearch(i,fid=getFileIds(),cid=6, seperator="[.!?]",ignore.case=TRUE)
}


#Adverbs
adv.7 <- c("particularly", "very", "dramatically", "passionately", "directly", "quickly", "completely", 
           "certainly", "controversially", "nearly", "actually", "illegally", "below", "longer",
           "work abroad", "politically","immediately respond", "immediately suspend", 
           "immediately blocked","clearly", "absurd", "bigger", "disastrous", "diverse", "easy", 
           "harder", "awkward", "easier", "effective", "greater", "impossible", "minimum", "negative", 
           "embarrassing", "medical", "radical", "rude", "attractive", "stronger", "tougher", 
           "uncontrolled", "weak", "large", "proper policy", "proper border controls", "proper controls", 
           "highest", "few britons", "high migrant demand", "high levels", "less", "total", "mass imigration",
           "mass migration", "official", "huge", "right to" , "strongest", "clearest", "easiest", 
           "estimated", "lowest", "surest", "trickiest", "unrestricted","hopeful","housing", "arriving","massive")
for (i in adv.7) {
  codingBySearch(i,fid=getFileIds(),cid=7, seperator="[.!?]",ignore.case=TRUE)
}
##
adv.6 <-c("we","born abroad")
for (i in adv.6) {
  codingBySearch(i,fid=getFileIds(),cid=6, seperator="[.!?]",ignore.case=TRUE)
}
###
adv.5 <-c("illegally","voluntarily")
for (i in adv.5) {
  codingBySearch(i,fid=getFileIds(),cid=5, seperator="[.!?]",ignore.case=TRUE)
}
###
adv.1 <-"immediately go onto welfare"
for (i in adv.1) {
  codingBySearch(i,fid=getFileIds(),cid=1, seperator="[.!?]",ignore.case=TRUE)
}
for (i in adv.1) {
  codingBySearch(i,fid=getFileIds(),cid=2, seperator="[.!?]",ignore.case=TRUE)
}


#Noun
n.1 <- c("squatting"	, "squats", "squatters", "squat", "squatters", "squatter")
for (i in n.1) {
  codingBySearch(i,fid=getFileIds(),cid=1, seperator="[.!?]",ignore.case=TRUE)
}

#Verbs
avaliative.verbs <- c("show", "stop illegal immigrants", "stop migrants", "says",
                      "say","said","squat", "stow", "stowaway","coming","born",
                      "work","go","think","left", "allow", "warn","warned","live", 
                      "trying","stagnate","dwindle", "trafficking", "traffick",'collapse', 'flee',
                      'cost',"added")

for (i in avaliative.verbs) {
  codingBySearch(i,fid=getFileIds(),cid=4, seperator="[.!?]",ignore.case=TRUE)
}

Evaluative.modals <- c("should", "would", "must","need","will","can","can't","shouldn't","might")

for (i in Evaluative.modals) {
  codingBySearch(i,fid=getFileIds(),cid=8, seperator="[.!?]",ignore.case=TRUE)
}

#Economics

economics <- c("poorer EU countries", "poorer member states","poorer EU member",
               "European economies", "eurozone","euro","economy","Economic","welfare",
               "housing", "Euro", "recession", "single market","dwindle",
               'cost')
for (i in economics) {
  codingBySearch(i,fid=getFileIds(),cid=10, seperator="[.!?]",ignore.case=TRUE)
}

#Control

control <- c("control", "borders", "border", "wave","waves","surge","increase",
             "uncontrolled","immediately blocked","minimum", "mass migration", "unrestricted",
             "weak","student visa","student visas","proper border controls",
             "proper controls","highest", "high migrant demand", "high levels","visa system")
for (i in control) {
  codingBySearch(i,fid=getFileIds(),cid=11, seperator="[.!?]",ignore.case=TRUE)
}





















