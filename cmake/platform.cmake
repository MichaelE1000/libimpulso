include (${CMAKE_SOURCE_DIR}/cmake/platforms/common.cmake)

if ("${LIZAZUL_TARGET_PLATFORM}" STREQUAL "")
    set(LIBAZUL_TARGET_PLATFORM ${CMAKE_SYSTEM_NAME})
endif()

if (${LIBAZUL_TARGET_PLATFORM} MATCHES "Android")
    include("${CMAKE_SOURCE_DIR}/cmake/platforms/Android.cmake")
elseif (${LIBAZUL_TARGET_PLATFORM} MATCHES "Linux")
    include("${CMAKE_SOURCE_DIR}/cmake/platforms/Linux.cmake")
elseif (${LIBAZUL_TARGET_PLATFORM} MATCHES "Darwin")
    if (${IOS})
        include("${CMAKE_SOURCE_DIR}/cmake/platforms/iOS.cmake")
    else()
        include("${CMAKE_SOURCE_DIR}/cmake/platforms/Darwin.cmake")
    endif()
elseif (${LIBAZUL_TARGET_PLATFORM} MATCHES "iOS")
    include("${CMAKE_SOURCE_DIR}/cmake/platforms/iOS.cmake")
elseif (${LIBAZUL_TARGET_PLATFORM} MATCHES "Windows")
    include("${CMAKE_SOURCE_DIR}/cmake/platforms/Windows.cmake")
else()
    message(FATAL_ERROR "Target (${LIBAZUL_TARGET_PLATFORM}) / Host (${CMAKE_SYSTEM_NAME}) combination atm not supported.")
endif()

