#' <Add Title>
#'
#' <Add Description>
#'
#' @importFrom reactR createReactShinyInput
#' @importFrom htmltools htmlDependency tags
#'
#' @export
checkbox_fieldInput <- function(
  inputId,
  label,
  default = TRUE,
  # checked = FALSE,
  labelPlacement = c("end", "start", "top", "bottom"),
  fontColor = '#ffffff',
  mainColor = '#e05151'
  ) {
  
  labelPlacement <- match.arg(labelPlacement)
  
  reactR::createReactShinyInput(
    inputId,
    "checkbox_field",
    htmltools::htmlDependency(
      name = "checkbox_field-input",
      version = "1.0.0",
      src = "www/shiny.muiinput/main_bundle",
      package = "shiny.muiinput",
      script = "bundle.js"
    ),
    default = default,
    list(
      # checked = checked,
      label = label,
      labelPlacement = labelPlacement,
      fontColor = fontColor,
      mainColor = mainColor
    ),
    htmltools::tags$div
  )
}

#' <Add Title>
#'
#' <Add Description>
#'
#' @export
updateCheckbox_fieldInput <- function(session, inputId, value, configuration = NULL) {
  message <- list(value = value)
  if (!is.null(configuration)) message$configuration <- configuration
  session$sendInputMessage(inputId, message);
}