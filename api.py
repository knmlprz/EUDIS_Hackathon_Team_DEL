from fastapi import FastAPI
from pydantic import BaseModel
import getScrapFile

app = FastAPI()

class ScanObject(BaseModel):
    data: str

@app.post("/scan")
async def scan_web(scan_object: ScanObject):
    safe = True

    if (scan_object.data == "" or scan_object.data == "undefined"):
        safe = True
    else:
        scrapFile = getScrapFile.scrapFile(scan_object.data)
        print(scrapFile)

    #####################################
    #########Index LamaFunction #########
    #####################################

    return {"safe" : safe}
