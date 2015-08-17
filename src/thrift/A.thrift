namespace py foo.A

include "B.thrift"
include "C.thrift"

struct AStruct {
    1: optional double A
}

enum AEnum {
    AENUM,
}
