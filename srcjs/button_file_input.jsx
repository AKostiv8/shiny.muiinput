import {reactShinyInput} from 'reactR';
import Button from '@mui/material/Button';
import JSZip from "jszip";
import {useState} from "react";

function UploadButton({configuration, value, setValue}) {
    let fileReader;
    const [tempResult,setTempResult] = useState([]);

    const handleFileChosen = (file) => {
        if (file.type === "application/zip") {
            JSZip.loadAsync(file).then(function (zip) {
                Object.keys(zip.files).forEach(function (filename) {
                    // let content = zip.files[filename];
                    // console.log(file);
                    // console.log(content);

                    zip.files[filename].async('blob').then(function (blob) {
                        let reader = new FileReader();
                        reader.onload = function (event) {
                            saveValue(filename.split("/")[1],event.target.result);
                        }; // data url!
                        reader.readAsBinaryString(blob);
                    })
                });
            });
        } else {
            fileReader = new FileReader();
            // fileReader.onloadend = handleFileRead;
            fileReader.onloadend = function (event) {
                const content = event.target.result;
                saveValue(file.name,content)
            };
            fileReader.readAsText(file);
        }
    };

    function saveValue(fileName,content){
        fileName = fileName.split(".txt")[0]
        let result = tempResult;
        // result.push([fileName,content]);
        result.push({fileName,content});
        // result.push(fileName);
        // result.push(content);
        setTempResult(result);
        setValue(JSON.stringify(tempResult).toString());
        console.log(result);
    }


    return (
        <>
            {/*{isList ?*/}
            {/*    <>*/}
            {/*        {*/}
            {/*            listOfFiles.map((element) => {*/}
            {/*                console.log("here");*/}
            {/*                console.log(element);*/}
            {/*                return <p>{element}</p>*/}
            {/*            })*/}
            {/*        }*/}
            {/*    </>*/}
            {/*    : <></>*/}
            {/*}*/}
            <Button variant="contained" component="label">
                {configuration.label}
                {/*<input hidden accept={configuration.filetype_accept} multiple type="file"*/}
                {/*       onChange={fileSelectedHandler}/>*/}
                <input
                    id='file'
                    hidden
                    className='input-file'
                    accept={configuration.filetype_accept}
                    multiple
                    type="file"
                    onChange={e => {
                        let files = e.target.files;
                        for (let i = 0; i < files.length; i++) {
                            handleFileChosen(files[i]);
                        }
                    }}
                />
            </Button>
        </>
    )
}

export default function initUploadButton() {
    return reactShinyInput(
        '.button_file_input',
        'shiny.muiinput.button_file_input',
        UploadButton
    );
}