import { reactShinyInput } from 'reactR';
import Button from '@mui/material/Button';
import CodeIcon from '@mui/icons-material/Code';
import SortIcon from '@mui/icons-material/Sort';
import { useState } from "react";
import { createTheme, ThemeProvider } from '@mui/material/styles';


const SourceUploadButton = ({ configuration, value, setValue }) => {
  
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
          contrastText: configuration.fontColor,
        },
      },
    });
    
    let fileReader;
    const [tempResult, setTempResult] = useState([]);
    
    
    const handleFileChosen = (file) => {

            fileReader = new FileReader();
            fileReader.onloadend = function (event) {
                const content = event.target.result;
                saveValue(file.name, content)
            };
            fileReader.readAsText(file);
    };
    
    function saveValue(fileName,content){
        fileName = fileName.split(".txt")[0]
        let result = tempResult;
        // result.push([fileName,content]);
        result.push({content});
        // result.push(fileName);
        // result.push(content);
        setTempResult(result);
        setValue(JSON.stringify(tempResult).toString());
        console.log(result);
    }
  
  return(
  
      <ThemeProvider theme={theme}>
        <Button 
            variant={configuration.variant} 
            component="label"
            size={configuration.size}  
            startIcon={configuration.startIcon ? <CodeIcon /> : null} 
            endIcon={configuration.endIcon ? <SortIcon /> : null}>
          {configuration.label}
          <input 
            hidden 
            accept={configuration.filetype_accept}
            type="file" 
            onChange={e => handleFileChosen(e.target.file)}            
          />
        </Button>
      </ThemeProvider>
  
  );
  
};


export default function initSourceUploadButton() {
    return reactShinyInput(
        '.source_upload',
        'shiny.muiinput.source_upload',
        SourceUploadButton
    );
}