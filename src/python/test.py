from pprint import pprint

from foo.C.ttypes import CStruct

if __name__ == "__main__":
    c = CStruct()
    pprint([name for name in dir(c) if not name.startswith('__')])
