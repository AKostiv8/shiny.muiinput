import { reactShinyInput } from 'reactR';
import React, { useState, useEffect } from 'react'
import TextField from '@mui/material/TextField';

const TextArea = ({ configuration, value, setValue }) => {

  const [timer, setTimer] = useState(null)

  const handleOnChange = (event) => {
    setValue(event.target.value);
  };


  useEffect(() => {
    const delayDebounceFn = setTimeout(() => {
      console.log(value)
      // Send Axios request here
    }, 5000)
    return () => clearTimeout(delayDebounceFn)
  }, [value])


  return(
    <div>
      <TextField
          id="outlined-multiline-static"
          label={configuration.label}
          multiline
          rows={configuration.rowsInit}
          onChange={handleOnChange}
      />
      </div>

  )
};


export default function initTextArea(){
  return reactShinyInput(
    '.textarea',
    'shiny.muiinput.textarea',
    TextArea
  );
}
