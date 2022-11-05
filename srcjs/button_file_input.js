import { reactShinyInput } from 'reactR';
import Button from '@mui/material/Button';

function UploadButton({configuration, value, setValue}) {

  function fileSelectedHandler (event) {
    console.log(event.target.files)

    let file = event.target.files


    // Area for Roma to parse multiple files



    // let reader = new FileReader()
    // reader.readAsDataURL(file)

    // reader.onload = () => {
    //  console.log(reader.result);
    //  setValue(reader.result);
    // };

    // reader.onerror = function (error) {
    //  console.log('Error: ', error);
    // }
  }


  return(
      <Button variant="contained" component="label">
        {configuration.label}
        <input hidden accept={configuration.filetype_accept} multiple type="file" onChange = {fileSelectedHandler}/>
      </Button>
  )

}

export default function initUploadButton(){
  return reactShinyInput(
    '.button_file_input',
    'shiny.muiinput.button_file_input',
    UploadButton
  );
}
