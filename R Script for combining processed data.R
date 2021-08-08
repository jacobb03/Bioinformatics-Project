library("DescTools")
library("data.table")

multmerge = function(mypath){
  filenames=list.files(path=mypath, full.names=TRUE)
  datalist = lapply(filenames, function(x){read.csv(file=x,header=T)})
  Reduce(function(x,y) {merge(x,y,by = "rsid",all.x = TRUE)}, datalist)
}

full_data = multmerge("C:/Users/Jacob/Desktop/Project CSV files")

write.csv(full_data,"C:/Users/Jacob/Desktop/Supplementary Data/Test Combined Data.csv", row.names = FALSE)
