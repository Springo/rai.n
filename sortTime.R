copy$V12 = substr(copy$V1, 5, 6)
copy$V13 = substr(copy$V1, 9, 10)
copy<- subset(copy, select = -c(V1))

for (i in 1:nrow(copy)){
  if (grepl("CLR", copy$V5[i])) {
    copy$V14[i] <- 0; 
  }
  if (grepl("SCT", copy$V5[i])) {
    copy$V14[i] <- 1; 
  }
  if (grepl("BKN", copy$V5[i])) {
    copy$V14[i] <- 2; 
  }
  if (grepl("OVC", copy$V5[i])) {
    copy$V14[i] <- 3; 
  }
}

copy<- subset(copy, select = -c(V5))