# duplicateContentR
Get duplicate content score between 2 web pages. duplicateContentR takes 2 urls as input and computes a duplicate content score to detect plagiarism.

## Install
```
devtools::install_github("remibacha/duplicateContentR")
```

## Getting started
Run the folowing lines to install & load needed packages
```
list.of.packages <- c("XML", "httr", "textrank")
new.packages <- list.of.packages[!(list.of.packages %in% installed.packages()[,"Package"])]
if(length(new.packages)) install.packages(new.packages)

packages <- c("XML", "httr", "textrank", "duplicateContentR")
lapply(packages, library, character.only = TRUE)
```

Call the duplicate_content_score function by specified 3 arguments (url a, url b, your user agent*) and enjoy!

```
duplicate_content_score("https://fr.wikipedia.org/wiki/Physique_quantique", "https://www.futura-sciences.com/sciences/definitions/physique-physique-quantique-13197/","Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:61.0) Gecko/20100101 Firefox/61.0")
```

NB: You can get your user agent by asking Google "What is my user agent?"

## Feedbacks
Questions and feedbacks welcome!

You want to contribute ? Open a pull request ;-) If you encounter a bug or want to suggest an enhancement, please open an issue.
