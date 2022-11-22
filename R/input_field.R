#' <Add Title>
#'
#' <Add Description>
#'
#' @importFrom reactR createReactShinyInput
#' @importFrom htmltools htmlDependency tags
#'
#' @export
input_fieldInput <- function(
  inputId, 
  label,
  variant        = c('outlined', 'filled', 'standard'),
  secondaryColor = '#ffffff',
  mainColor      = '#e05151'
  ) {
  
  variant <- match.arg(variant)
  
  reactR::createReactShinyInput(
    inputId,
    "input_field",
    htmltools::htmlDependency(
      name = "input_field-input",
      version = "1.0.0",
      src = "www/shiny.muiinput/main_bundle",
      package = "shiny.muiinput",
      script = "bundle.js"
    ),
    default = NULL,
    list(
      label          = label,
      variant        = variant,
      secondaryColor = secondaryColor,
      mainColor      = mainColor
    ),
    htmltools::tags$div
  )
}

#' <Add Title>
#'
#' <Add Description>
#'
#' @export
updateInput_fieldInput <- function(session, inputId, value, configuration = NULL) {
  message <- list(value = value)
  if (!is.null(configuration)) message$configuration <- configuration
  session$sendInputMessage(inputId, message);
}