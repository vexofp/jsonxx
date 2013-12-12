cmake_minimum_required(VERSION 2.6)

project(json++)

find_package(BISON)
find_package(FLEX)

BISON_TARGET(parser json.y ${CMAKE_CURRENT_BINARY_DIR}/json.tab.cc)
FLEX_TARGET(scanner json.l  ${CMAKE_CURRENT_BINARY_DIR}/lex.yy.cc)
ADD_FLEX_BISON_DEPENDENCY(scanner parser)

include_directories(${CMAKE_CURRENT_BINARY_DIR})
include_directories(.)

set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++0x")

add_library(jsonpp SHARED json_st.cc json_st.hh ${BISON_parser_OUTPUTS} ${FLEX_scanner_OUTPUTS})

install(TARGETS jsonpp DESTINATION lib)
install(FILES json_st.hh json.hh json.tab.hh DESTINATION include/json)
