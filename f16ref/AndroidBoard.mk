# Copyright (C) 2010 Amlogic Inc
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

LOCAL_PATH := $(call my-dir)

#include $(CLEAR_VARS)
#LOCAL_SRC_FILES := aml-usbkbd.kcm
#LOCAL_MODULE_TAGS := debug
#include $(BUILD_KEY_CHAR_MAP)

ifeq ($(TARGET_PREBUILT_KERNEL),)
TARGET_PREBUILT_KERNEL := $(LOCAL_PATH)/kernel/amlogic/mbx12122012
endif

file := $(INSTALLED_KERNEL_TARGET)
ALL_PREBUILT += $(file)
$(file): $(TARGET_PREBUILT_KERNEL) | $(ACP)
	$(transform-prebuilt-to-target)

file := $(TARGET_ROOT_OUT)/init.rc
ALL_PREBUILT += $(file)
$(file) : $(LOCAL_PATH)/init.rc | $(ACP)
	$(transform-prebuilt-to-target)

file := $(TARGET_ROOT_OUT)/ueventd.rc
ALL_PREBUILT += $(file)
$(file) : device/amlogic/common/ueventd.rc | $(ACP)
	$(transform-prebuilt-to-target)

file := $(TARGET_OUT_ETC)/vold.fstab
ALL_PREBUILT += $(file)
$(file) : $(LOCAL_PATH)/vold.fstab | $(ACP)
	$(transform-prebuilt-to-target)
	
file := $(TARGET_OUT_ETC)/gps.conf
ALL_PREBUILT += $(file)
$(file) : $(LOCAL_PATH)/gps.conf | $(ACP)
	$(transform-prebuilt-to-target)

