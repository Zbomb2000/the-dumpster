# This gets the path to the parent directory of the file
def getCdVar():
    cd_var = os.path.dirname(__file__)
    cd = r"{}".format(cd_var)
    return cd
