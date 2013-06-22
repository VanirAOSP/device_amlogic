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

file := $(TARGET_OUT_KEYLAYOUT)/aml-usbkbd.kl
ALL_PREBUILT += $(file)
$(file) : $(LOCAL_PATH)/aml-usbkbd.kl | $(ACP)
	$(transform-prebuilt-to-target)

include $(CLEAR_VARS)
LOCAL_SRC_FILES := aml-usbkbd.kcm
LOCAL_MODULE_TAGS := debug
include $(BUILD_KEY_CHAR_MAP)

ifeq ($(TARGET_PREBUILT_KERNEL),)
TARGET_PREBUILT_KERNEL := $(LOCAL_PATH)/kernel
endif

file := $(INSTALLED_KERNEL_TARGET)
ALL_PREBUILT += $(file)
$(file): $(TARGET_PREBUILT_KERNEL) | $(ACP)
	$(transform-prebuilt-to-target)

file := $(TARGET_ROOT_OUT)/init.rc
ALL_PREBUILT += $(file)
$(file) : $(LOCAL_PATH)/init.rc | $(ACP)
	$(transform-prebuilt-to-target)

file := $(TARGET_ROOT_OUT)/init.factorytest.rc
ALL_PREBUILT += $(file)
$(file) : $(LOCAL_PATH)/init.factorytest.rc | $(ACP)
	$(transform-prebuilt-to-target)
	
file := $(TARGET_ROOT_OUT)/initlogo.480p.rle
ALL_PREBUILT += $(file)
$(file) : $(LOCAL_PATH)/initlogo-robot-800x480.rle | $(ACP)
	$(transform-prebuilt-to-target)
	
file := $(TARGET_ROOT_OUT)/initlogo.720p.rle
ALL_PREBUILT += $(file)
$(file) : $(LOCAL_PATH)/initlogo-robot-1200x690.rle | $(ACP)
	$(transform-prebuilt-to-target)

file := $(TARGET_ROOT_OUT)/initlogo.1080p.rle
ALL_PREBUILT += $(file)
$(file) : $(LOCAL_PATH)/initlogo-robot-1880x1060.rle | $(ACP)
	$(transform-prebuilt-to-target)

file := $(TARGET_OUT_ETC)/vold.fstab
ALL_PREBUILT += $(file)
$(file) : $(LOCAL_PATH)/vold.fstab | $(ACP)
	$(transform-prebuilt-to-target)

file := $(TARGET_OUT_EXECUTABLES)/set_display_mode.sh
ALL_PREBUILT += $(file)
$(file) : $(LOCAL_PATH)/set_display_mode.sh | $(ACP)
	$(transform-prebuilt-to-target)

file := $(TARGET_OUT_ETC)/media_profiles.xml
ALL_PREBUILT += $(file)
$(file) : $(LOCAL_PATH)/media_profiles.xml | $(ACP)
	$(transform-prebuilt-to-target)

file := $(TARGET_OUT_ETC)/asound.conf
ALL_PREBUILT += $(file)
$(file) : $(LOCAL_PATH)/asound.conf | $(ACP)
	$(transform-prebuilt-to-target)

file := $(TARGET_OUT_ETC)/audio_effects.conf
ALL_PREBUILT += $(file)
$(file) : $(LOCAL_PATH)/audio_effects.conf | $(ACP)
        $(transform-prebuilt-to-target)

file := $(TARGET_OUT_ETC)/gps.conf
ALL_PREBUILT += $(file)
$(file) : $(LOCAL_PATH)/gps.conf | $(ACP)
	$(transform-prebuilt-to-target)

file := $(TARGET_OUT_ETC)/remote.conf
ALL_PREBUILT += $(file)
$(file) : $(LOCAL_PATH)/remote.conf | $(ACP)
	$(transform-prebuilt-to-target)	

file := $(TARGET_OUT_KEYLAYOUT)/aml_keypad.kl
ALL_PREBUILT += $(file)
$(file) : $(LOCAL_PATH)/aml_keypad.kl | $(ACP)
	$(transform-prebuilt-to-target)		

file := $(TARGET_OUT_EXECUTABLES)/reset_display_mode.sh
ALL_PREBUILT += $(file)
$(file) : $(LOCAL_PATH)/reset_display_mode.sh | $(ACP)
	$(transform-prebuilt-to-target)
	
include frameworks/base/data/sounds/OriginalAudio.mk
