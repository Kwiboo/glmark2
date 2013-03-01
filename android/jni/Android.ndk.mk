LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

LOCAL_CPP_EXTENSION := .cc
LOCAL_MODULE := libglmark2-matrix
LOCAL_CFLAGS := -DUSE_GLESv2 -Werror -Wall -Wextra -Wnon-virtual-dtor \
                -Wno-error=unused-parameter
LOCAL_C_INCLUDES := $(LOCAL_PATH)/src
LOCAL_SRC_FILES := $(subst $(LOCAL_PATH)/,,$(wildcard $(LOCAL_PATH)/src/libmatrix/*.cc))

include $(BUILD_STATIC_LIBRARY)

include $(CLEAR_VARS)

LOCAL_MODULE := libglmark2-png
LOCAL_SRC_FILES := $(subst $(LOCAL_PATH)/,,$(wildcard $(LOCAL_PATH)/src/libpng/*.c))

include $(BUILD_STATIC_LIBRARY)

include $(CLEAR_VARS)

LOCAL_MODULE := libglmark2-jpeg
LOCAL_CFLAGS := -Werror -Wall -Wextra -Wno-error=attributes \
                -Wno-error=unused-parameter -Wno-error=unused-function -Wno-error=unused-variable
LOCAL_C_INCLUDES := $(LOCAL_PATH)/src/libjpeg-turbo/
LOCAL_SRC_FILES := $(subst $(LOCAL_PATH)/,,$(wildcard $(LOCAL_PATH)/src/libjpeg-turbo/simd/*.c)) \
                   $(subst $(LOCAL_PATH)/,,$(wildcard $(LOCAL_PATH)/src/libjpeg-turbo/simd/*.S)) \
                   $(subst $(LOCAL_PATH)/,,$(wildcard $(LOCAL_PATH)/src/libjpeg-turbo/*.c))

include $(BUILD_STATIC_LIBRARY)

include $(CLEAR_VARS)

LOCAL_CPP_EXTENSION := .cc
LOCAL_MODULE := libglmark2-ideas
LOCAL_CFLAGS := -DGLMARK_DATA_PATH="" -DUSE_GLESv2 -Werror -Wall -Wextra\
                -Wnon-virtual-dtor -Wno-error=unused-parameter
LOCAL_C_INCLUDES := $(LOCAL_PATH)/src \
                    $(LOCAL_PATH)/src/libmatrix
LOCAL_SRC_FILES := $(subst $(LOCAL_PATH)/,,$(wildcard $(LOCAL_PATH)/src/scene-ideas/*.cc))

include $(BUILD_STATIC_LIBRARY)

include $(CLEAR_VARS)

LOCAL_MODULE_TAGS := optional
LOCAL_MODULE := libglmark2-android
LOCAL_STATIC_LIBRARIES := libglmark2-matrix libglmark2-png libglmark2-ideas libglmark2-jpeg
LOCAL_CFLAGS := -DGLMARK_DATA_PATH="" -DGLMARK_VERSION="\"2012.12\"" \
                -DUSE_GLESv2 -Werror -Wall -Wextra -Wnon-virtual-dtor \
                -Wno-error=unused-parameter
LOCAL_LDLIBS := -landroid -llog -lGLESv2 -lEGL -lz
LOCAL_C_INCLUDES := $(LOCAL_PATH)/src \
                    $(LOCAL_PATH)/src/libmatrix \
                    $(LOCAL_PATH)/src/scene-ideas \
                    $(LOCAL_PATH)/src/scene-terrain \
                    $(LOCAL_PATH)/src/libjpeg-turbo \
                    $(LOCAL_PATH)/src/libpng
LOCAL_SRC_FILES := $(filter-out src/canvas% src/gl-state% src/native-state% src/main.cpp, \
                     $(subst $(LOCAL_PATH)/,,$(wildcard $(LOCAL_PATH)/src/*.cpp))) \
                   $(subst $(LOCAL_PATH)/,,$(wildcard $(LOCAL_PATH)/src/scene-terrain/*.cpp)) \
                   src/canvas-android.cpp

include $(BUILD_SHARED_LIBRARY)
