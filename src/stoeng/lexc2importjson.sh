#!/bin/sh

# Usage:
#   cat sto-stems.lexc | stoeng/lexc2importjson.sh > stoeng/stoeng_test.importjson

gawk 'BEGIN { printf "[\n"; }
{
  if(match($0, "^LEXICON ([^! ]+)", f)!=0)
    infl=f[1];

  if(match($0, "^([^ !]+)[^;]+;.*! (for .+)$", f)!=0 && infl!="")
    {
      if(lexc=="")
        printf "  {\n";
      else
        printf ",\n  {\n";

      lexc=f[1]; eng=f[2];

      if(split(lexc, f, ":")!=0)
        {
          lemma=f[1]; stem=f[2];
        }
      else
        {
          lemma=lexc; stem=lexc;
        }

      if(index(eng, " O")!=0)
        pdgm="VT";
      else
        pdgm="VI";
      printf "    \"head\": \"%s\",\n", lemma;
      printf "    \"linguistInfo\": {\n";
      printf "      \"inflectional_category\": \"%s\",\n", infl;
      printf "      \"pos\": \"%s\",\n", "V";
      printf "      \"stem\": \"%s\",\n", stem;
      printf "    },\n";
      printf "    \"paradigm\": \"%s\",\n", pdgm;
      printf "    \"senses\": [\n";
      printf "      {\n";
      printf "        \"definition\": \"%s\",\n", eng;
      printf "        \"sources\": \"%s\"\n", "McA&K&C";;
      printf "      }\n";
      printf "    ]\n";
      printf "  }";
    }
}
END {
  printf "\n";
  printf "]\n";
}'

# [
#   {
#     "head": "a'po'taki",
#     "linguistInfo": {
#       "inflectional_category": "VAI",
#       "pos": "V",
#       "stem": "a'po'taki",
#       "wordclass": "VAI"
#     },
#   "paradigm": "VAI",
#   "senses": [
#       {
#         "definition": "work, be operational, be in effect",
#         "sources": ["F&R"]
#       }
#     ],
#     "slug": "a'po'taki"
#   },
# ...
# ]
