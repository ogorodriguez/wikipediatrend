#' function for getting data (download + extraction)
#' 
#' 
#' 
#' @export

wp_get_data <- function(urls){
  tmp <- list()
  h   <- httr::handle("http://stats.grok.se")
  for ( i in seq_along(urls) ){
    url       <- urls[i]
    json      <- wp_download_data(url, wait = 0)
    tmp[[i]]  <- wp_jsons_to_df(json, basename(url) )
    wp_add_to_cache(tmp[[i]])
  }
  # combine data
  res <- do.call(rbind, tmp)
  rownames(res) <- NULL
  # write cache to disk
  wp_save_cache()
  # return
  return(res)
}

