ifneq ($(TARGET_SIMULATOR),true)
ifeq ($(TARGET_ARCH),arm)

LOCAL_PATH := $(call my-dir)

ifeq ($(BOARD_HAVE_BLUETOOTH),true)
include $(CLEAR_VARS)
LOCAL_MODULE := hciattach_usi
LOCAL_SRC_FILES := $(LOCAL_MODULE)
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_CLASS := EXECUTABLES
include $(BUILD_PREBUILT)
endif	# BOARD_HAVE_BLUETOOTH == true

ifeq ($(TARGET_USE_AMLOGIC_MKYAFFS_TOOL),true)
include $(CLEAR_VARS)

LOCAL_MODULE := $(TARGET_AMLOGIC_MKYAFFSIMG_TOOL)
LOCAL_SRC_FILES := $(LOCAL_MODULE)
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_CLASS := EXECUTABLES
LOCAL_MODULE_SUFFIX :=
LOCAL_BUILT_MODULE_STEM := $(notdir $(LOCAL_SRC_FILES))
LOCAL_IS_HOST_MODULE := true
include $(BUILD_PREBUILT)
endif	# TARGET_USE_AMLOGIC_MKYAFFS_TOOL == true

endif   # TARGET_ARCH == arm
endif   # !TARGET_SIMULATOR
