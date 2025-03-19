#' Description of cover crop treatments
#'
#' A dataset describing each cover crop treatmment in more detail.
#' The variables are as follows:
#'
#' @format A data frame with 2 rows and XX variables:
#' \describe{
#'   \item{cctrt_id}{Uniquely identifies a cover crop treatment}
#'   \item{desc}{A description of the treatment}
#' }
"sexy1_cctrtkey"

#' Description of the crops used
#'
#' A dataset describing each crop in more detail.
#' The variables are as follows:
#'
#' @format A data frame with 2 rows and XX variables:
#' \describe{
#'   \item{crop_id}{Uniquely identifies a crop (a, p)}
#'   \item{cropdesc}{A description of the crop}
#'   \item{tkw_g}{A description of the crop}
#'   \item{germination_pct}{The % germination based on either the bag (a) or tests (p)}
#'   \item{ergot_pct}{The percentage of the crop that was originally infested with ergot (ergot was removed using color sorting)}
#' }
"sexy1_cropkey"

#' Description of the croptreatments used
#'
#' A dataset describing each crop treatment in more detail.
#' The variables are as follows:
#'
#' @format A data frame with 4 rows and XX variables:
#' \describe{
#'   \item{croptrt_id}{Uniquely identifies a crop (a, apmix, aprows, p)}
#'   \item{croptrtdesc}{A description of the crop treatment}
#'   \item{plantingrate_kgha}{The crop planting rate in kg per hectare}
#'   \item{planting_desc}{A description of the logic for the planting rates}
#'   \item{rowspacing_cm}{The spacing between planted rows}
#'   \item{plantingdepth_cm}{The depth of seed planting}
#' }
"sexy1_croptrtkey"


#' Description of experimental units
#'
#' A dataset containing links between experimental and 
#' observational units in the SEXY trials. The plots are
#' double wide tractor widths, meaning two passes of the same
#' treatment are next to each other. This was done to create one 
#' side for yield measurements, and the other for destructive sampling.
#' It may seem like overkill, but it is designed to make merging
#' with all kinds of data easier. The variables are as follows:
#'
#' @format A data frame with 96 rows and 10 variables:
#' \describe{
#'   \item{trial}{Identifies which trial, Trial1 was established fall 2024}
#'   \item{eu_id}{Identifies the unique experimental unit of measurement (plot) in an easier way compared to the plot_id}
#'   \item{plot_id}{Identifies the unique plot using block, plot, plothalf, and sample type (see sexy1_plotkey for more info)}
#'   \item{trt_id}{A unique identifier for the treatments 
#'   (p, xp, pcc, xpcc, a, xa, acc, xacc, aprow, xaprow, apmix, xapmix), see the sexy1_trtkey for more info}
#' }
"sexy1_eukey"

#' Description of the plots
#'
#' A dataset describing each plot in detail
#' The variables are as follows:
#'
#' @format A data frame with 96 rows and 5 variables:
#' \describe{
#'   \item{plot_id}{Uniquely identifies an area of measurement}
#'   \item{block}{The block which the plot is located in (b1, b2, b3, b4)}
#'   \item{plot}{The plot number corrresponding to one crop treatment (101-112, 201-212, 301-312, 401-412)}
#'   \item{plothalf}{North or south half of plot}
#'   \item{samptype}{Whether the half is designated as destructive sampling (d) or for yield sampling (y)}
#' }
"sexy1_plotkey"

#' Description of the treatments
#'
#' A dataset describing each treatment
#' The variables are as follows:
#'
#' @format A data frame with 12 rows and 5 variables:
#' \describe{
#'   \item{trt_id}{Uniquely identifies a treatment applied to a plot}
#'   \item{croptrt_id}{Identifies the crop treatment (see sexy1_croptrtkey)}
#'   \item{cctrt_id}{Identifies the cover crop treatment (see sexy1_cctrtkey)}
#'   \item{cropcat}{General categorization of the treatment as perennial, annual, or a mix}
#' }
"sexy1_trtkey"

#' Manually collected standcount data
#'
#' A dataset containing the data collected by Anders and Gina
#'  estimating stand counts. The variables are as follows:
#'
#' @format A data frame with an expanding number of rows and 4 variables:
#' \describe{
#'   \item{trial}{Identifies which trial, Trial1 was established fall 2024}
#'   \item{date}{the ymd the data was collected}
#'   \item{eu_id}{the unit the data was collected on}
#'   \item{plot_id}{the unit the data was collected on (see sexy1_plotkey)}
#'   \item{plants_m2}{The number of plants present per square meter}
#' }
"sexy1_standcounts"