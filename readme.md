# lang-sto
This is the preliminary repo for the Nakoda FST. This project is developed by <a href="https://a.ttic.us">Atticus G. Harrigan</a>, <a ref="https://sites.ualberta.ca/~arppe/english.html">Antti Arppe</a>, and Jordan Lachler. Development has recieved support from the Univeristy of Alberta's <a href="https://altlab.ualberta.ca/">Alberta Language Technology Laboratory</a>, <a href="https://silr.ca/">Supporting Indigenous Language Revitalization</a> and the <a href="https://www.ualberta.ca/canadian-indigenous-languages-and-literacy-development-institute/index.html">Canadian Indigenous Languages and Literacy Development Institute</a>.

Eventually this repo will be migtrated into the Giellatekno Infrastructure. **THIS IS CURRENTLY THE ACTIVE DEVELOPMENT REPO**.

# philosophy
This model considers Nakoda as an infixing language. Stems have special characters that are replaced with infixes. This is controled with flag diacritics.

# structure
The majority of the develoment files are in the `/src` directory and all instructions below assume it as the woeking directory.

# source files
-Stems, plural morphs, and evidential morphs are located in the `sto-stems.lexc` file.

-Infixes (including ones that surface word initially) are located in the `sto-infixes.lexc`.

-Prefixes for words like `maní` are found in `sto-phon.xfscript`.

-Morphosyntactic features `+1Sg` are located in `sto-stems.lexc`.

-Morpho-phonological rules are found in `sto-phon.xfscript`.

# compilation
To compile the FST you should navagat to the `/src` folder. The most recent version of the FST is available as a foma binary at `sto.foma`. You can load this into foma if you would like by running `load sto.foma` within foma. You can also use a python module like `fst-lookup`. 

If you wish to interact with the FST directly, you can run `foma -l sto-master.xfscript`. Note that doing this will automatically save the stack to a foma binary, so if you have made achanges to the source files, running `sto-master.xfscript` will automatically change the sto.foma`.

# testing
If you wish, you can run `bash runtests.sh` to test the FST. This will run the items in `goldstandard.tsv` through the FST, generating surface forms for analyses. The results will then be compared against the goldstandard and any discrepencies will be written to `discrepencies.txt`. The left column is what is expected and the right column is what was observed. 
