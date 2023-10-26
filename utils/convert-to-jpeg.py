import os
from PIL import Image

directory = 'assets/puzzles-assorted/'

for filename in os.listdir(directory):
    f = os.path.join(directory, filename)
    if os.path.isfile(f):
        print(f"Converting {f}")
        im = Image.open(f).convert("RGB") 
        filename = os.path.basename(f) 
        filenameNoExt = filename.split(".")[:-1]
        filenameNoExt = ".".join(filenameNoExt)
        im.save('assets/puzzles/' + filenameNoExt + ".jpeg","jpeg")