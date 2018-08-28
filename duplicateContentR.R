#' @title Get Duplicate Content Ratio between 2 web pages
#'
#' @description duplicateContentR takes 2 urls as input and computes a duplicate content score to detect plagiarism.
#'
#' @param url_a
#' @param url_b
#' @param my_user_agent
#'
#' @return NULL
#'
#' @examples duplicate_content_score("https://fr.wikipedia.org/wiki/Physique_quantique", "https://www.futura-sciences.com/sciences/definitions/physique-physique-quantique-13197/","Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:61.0) Gecko/20100101 Firefox/61.0")
#'
#' @export

duplicate_content_score <- function(url_a,url_b,my_user_agent) {
  url_to_checka <- url_a
  requesta <- GET(url_to_checka, user_agent(my_user_agent))
  doca <- htmlParse(requesta, encoding = "UTF-8")
  main_texta <- xpathSApply(doca, "//text()[not(ancestor::script)][not(ancestor::style)][not(ancestor::noscript)][not(ancestor::form)][string-length(.) > 10]", xmlValue)
  main_texta <- paste(main_texta, collapse = " ")

  url_to_checkb <- url_b
  requestb <- GET(url_to_checkb, user_agent(my_user_agent))
  docb <- htmlParse(requestb, encoding = "UTF-8")
  main_textb <- xpathSApply(docb, "//text()[not(ancestor::script)][not(ancestor::style)][not(ancestor::noscript)][not(ancestor::form)][string-length(.) > 10]", xmlValue)
  main_textb <- paste(main_textb, collapse = " ")

  x <- as.character(main_texta)
  sentencea <- strsplit(x, " ")[[1]]

  y <- as.character(main_textb)
  sentenceb <- strsplit(y, " ")[[1]]

  cat(paste("The page A and the page B are", round(100*textrank_jaccard(termsa = sentencea, termsb = sentenceb),2), "% similar"))

}
