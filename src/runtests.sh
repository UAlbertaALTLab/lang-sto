bash ./tests.sh > testresult.txt
diff -y goldstandard.tsv testresult.txt| grep '|\|>' >  discrepencies.txt