cmake_minimum_required(VERSION 3.15)

project(DeviceVisualizer LANGUAGES CXX VERSION 0.1.0)

set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTORCC ON)
set(CMAKE_AUTOUIC ON)

set(CMAKE_PREFIX_PATH /home/scphamster/dev/yocto/sdk/my-custom-image-sdk/sysroots/cortexa7t2hf-neon-vfpv4-ostl-linux-gnueabi/usr/lib/cmake/Qt5)
set(OE_QMAKE_PATH_EXTERNAL_HOST_BINS /home/scphamster/dev/yocto/sdk/my-custom-image-sdk/sysroots/x86_64-ostl_sdk-linux/usr/bin)

set(QML_SOURCES src/qml/main.qml)

set(SRCES
        src/sources/main.cpp
        src/assets/resource.qrc
        src/sources/device_finder.cpp
        src/headers/device_finder.hpp
)

add_executable(${PROJECT_NAME} ${SRCES})

find_package(Qt5 COMPONENTS
        Core
        Quick
        Widgets
        Gui
        QuickControls2
        REQUIRED)

target_link_libraries(${PROJECT_NAME} PRIVATE
        Qt5::Core
        Qt5::Quick
        Qt5::Widgets
        Qt5::Gui
        Qt5::QuickControls2
)

target_include_directories(${PROJECT_NAME} PRIVATE
        ${CMAKE_CURRENT_SOURCE_DIR}/src/headers
)

set(INSTALLATION_PATH ${CMAKE_CURRENT_SOURCE_DIR}/installation)

install(TARGETS ${PROJECT_NAME}
        RUNTIME DESTINATION ${INSTALLATION_PATH}/bin
        LIBRARY DESTINATION ${INSTALLATION_PATH}/lib
        ARCHIVE DESTINATION ${INSTALLATION_PATH}/lib/static)

