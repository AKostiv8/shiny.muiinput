import { reactShinyInput } from 'reactR';
import React, { useState, useEffect } from 'react'
import TextField from '@mui/material/TextField';
import { createTheme, ThemeProvider } from '@mui/material/styles';
import { useDebouncedCallback } from 'use-debounce';


const TextArea = ({ configuration, value, setValue }) => {
  
  const theme = createTheme({
      status: {
        danger: configuration.mainColor,
      },
      palette: {
        primary: {
          main: configuration.mainColor,
          darker: configuration.mainColor,
        },
        neutral: {
          main: configuration.mainColor,
          contrastText: configuration.secondaryColor,
        },
      },
  });
  
  // Debounce callback
  const debounced = useDebouncedCallback(
     // function
     (value) => {
          if(!value || value === '') {
            setValue(null);
          } else {
            setValue(value);
          }
      },
      // delay in ms
      50
  );



  const handleOnChange = (event) => {
    debounced(event.target.value);
  };


  useEffect(() => {
    const delayDebounceFn = setTimeout(() => {
      // console.log(value)
      // Send Axios request here
    }, 500)
    return () => clearTimeout(delayDebounceFn)
  }, [value])


  return(
    <ThemeProvider theme={theme}>
      <TextField
          id="outlined-multiline-static"
          label={configuration.label}
          multiline
          value={value === null ? '' : value}
          rows={configuration.rowsInit}
          onChange={handleOnChange}
          inputProps={{ style: { color: configuration.secondaryColor} }}
          sx={[{'&:hover': {
                    "&& fieldset": {
                        border: `2px solid ${configuration.secondaryColor}`
                      },
                     "label": {
                        color: configuration.secondaryColor
                     }
                    }
                },
                {"& label": {
                    color: configuration.secondaryColor
                  }
                },
                { color: configuration.secondaryColor },
                {"&& fieldset": {
                    border: `1px solid ${configuration.secondaryColor}`,
                    color: configuration.secondaryColor
                  }
                }
          ]}
      />
    </ThemeProvider>

  )
};


export default function initTextArea(){
  return reactShinyInput(
    '.textarea',
    'shiny.muiinput.textarea',
    TextArea
  );
}
