#' <Add Title>
#'
#' <Add Description>
#'
#' @importFrom reactR createReactShinyInput
#' @importFrom htmltools htmlDependency tags
#'
#' @export
source_uploadInput <- function(
    inputId,
    label,
    fontColor       = '#ffffff',
    mainColor       = '#e05151',
    variant         = c('outlined', 'contained', 'text'),
    size            = c("medium", "small", "large"),
    filetype_accept = '.txt, .rock, text/yaml',
    startIcon       = FALSE,
    endIcon         = FALSE
  ) {
  
  variant <- match.arg(variant)
  size <- match.arg(size)
  
  reactR::createReactShinyInput(
    inputId,
    "source_upload",
    htmltools::htmlDependency(
      name = "source_upload-input",
      version = "1.0.0",
      src = "www/shiny.muiinput/main_bundle",
      package = "shiny.muiinput",
      script = "bundle.js"
    ),
    default = NULL,
    list(
      label     = label,
      variant   = variant,
      size      = size,
      fontColor = fontColor,
      mainColor = mainColor,
      startIcon = startIcon,
      endIcon   = endIcon
    ),
    htmltools::tags$div
  )
}

#' <Add Title>
#'
#' <Add Description>
#'
#' @export
updateSource_uploadInput <- function(session, inputId, value, configuration = NULL) {
  message <- list(value = value)
  if (!is.null(configuration)) message$configuration <- configuration
  session$sendInputMessage(inputId, message);
}