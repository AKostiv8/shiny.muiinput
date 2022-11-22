#' <Add Title>
#'
#' <Add Description>
#'
#' @importFrom reactR createReactShinyInput
#' @importFrom htmltools htmlDependency tags
#'
#' @export
select_fieldInput <- function(
  inputId,
  label,
  value = NULL,
  disabled = FALSE,
  secondaryColor = '#ffffff',
  mainColor = '#e05151'
  ) {
  reactR::createReactShinyInput(
    inputId,
    "select_field",
    htmltools::htmlDependency(
      name = "select_field-input",
      version = "1.0.0",
      src = "www/shiny.muiinput/main_bundle",
      package = "shiny.muiinput",
      script = "bundle.js"
    ),
    default = NULL,
    list(
      label = label,
      value = value,
      secondaryColor = secondaryColor,
      mainColor = mainColor,
      disabled = disabled
    ),
    htmltools::tags$div
  )
}

#' <Add Title>
#'
#' <Add Description>
#'
#' @export
updateSelect_fieldInput <- function(session, inputId, 
                                    # value, 
                                    configuration = NULL) {
  # message <- list(value = value)
  message <- list()
  if (!is.null(configuration)) message$configuration <- configuration
  session$sendInputMessage(inputId, message);
}