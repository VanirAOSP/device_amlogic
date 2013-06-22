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

# config.mk
#
# Product-specific compile-time definitions.
#

# Alsa
BOARD_USES_ALSA_AUDIO := true
BUILD_WITH_ALSA_UTILS := true

# Bluetooth
BOARD_HAVE_BLUETOOTH := true

# Camera
USE_CAMERA_STUB := false
BOARD_HAVE_FRONT_CAM := false
BOARD_HAVE_BACK_CAM := false
BOARD_USE_USB_CAMERA := true
BOARD_HAVE_FLASHLIGHT := false
# GPS
#BOARD_GPS_LIBRARIES := libgpsstub

# Wifi
BOARD_WPA_SUPPLICANT_DRIVER := true

# Amlogic player
BUILD_WITH_AMLOGIC_PLAYER   := true

# VOut
BOARD_VOUT_USES_FREESCALE := false

TARGET_BOOTLOADER_BOARD_NAME := f10ref
TARGET_NO_BOOTLOADER := true
TARGET_NO_KERNEL := true
TARGET_NO_RADIOIMAGE := true
TARGET_SIMULATOR := false
TARGET_PROVIDES_INIT_RC := true
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_ARCH_VARIANT := armv7-a-neon

# Recovery
TARGET_USE_AMLOGIC_MKYAFFS_TOOL := true
TARGET_AMLOGIC_MKYAFFSIMG_TOOL := mkyaffsimage4K.dat
TARGET_AMLOGIC_KERNEL := $(PRODUCT_OUT)/uImage
#TARGET_AMLOGIC_RECOVERY_KERNEL := $(PRODUCT_OUT)/uImage_recovery
#TARGET_AMLOGIC_SPI := $(PRODUCT_OUT)/spi.bin

TARGET_AMLOGIC_AML_LOGO := device/amlogic/f10ref/aml_logo.bmp

# Internal NAND flash /media partition

# Use default APK
BOARD_USE_DEFAULT_APPINSTALL := true

# wifi build in
WIFI_DRIVER := rt3070
WIFI_DRIVER_BUILTIN := 1
WPA_SUPPLICANT_VERSION := VER_0_6_X
BOARD_WPA_SUPPLICANT_DRIVER := WEXT

# Use default keylayout in device/amlogic/common/keylayout
# instead of sdk/emulator/keymaps
PRODUCT_PROVIDES_DEFAULT_KEYLAYOUT := true

include device/amlogic/$(TARGET_PRODUCT)/recovery/Recovery.mk
