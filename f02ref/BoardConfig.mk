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
#BOARD_USES_GENERIC_AUDIO := true
BOARD_USES_ALSA_AUDIO := true
BUILD_WITH_ALSA_UTILS := true

# Bluetooth
BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_BCM := true

# G-Sensor
BOARD_USES_G_SENSOR_MEMSIC := false
BOARD_USES_G_SENSOR_MMA7660 := false
BOARD_USES_SENSOR_MPU3050 := true

# Light sensor
BOARD_USES_LIGHT_SENSOR := true

BOARD_HAVE_COMPASS := false

# GPS
#BOARD_GPS_LIBRARIES := libgpsstub

# Camera
USE_CAMERA_STUB := false
BOARD_HAVE_FRONT_CAM :=true
BOARD_HAVE_BACK_CAM :=false


# Amlogic player
BUILD_WITH_AMLOGIC_PLAYER := true

# Wifi
WIFI_DRIVER := dhd
#WPA_SUPPLICANT_VERSION := VER_0_6_X
WPA_SUPPLICANT_VERSION := VER_0_8_X
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_wext
BOARD_WPA_SUPPLICANT_DRIVER := WEXT

WIFI_DRIVER_MODULE_PATH := /system/lib/dhd.ko
WIFI_DRIVER_MODULE_NAME := dhd
WIFI_DRIVER_MODULE_ARG  := "firmware_path=/etc/wifi/sdio-g-cdc-full11n-reclaim-roml-wme-idsup.bin nvram_path=/etc/wifi/nvram.txt"
WIFI_DRIVER_FW_STA_PATH := /etc/wifi/sdio-g-cdc-full11n-reclaim-roml-wme-idsup.bin
WIFI_DRIVER_FW_AP_PATH := /etc/wifi/sdio-g-cdc-roml-reclaim-wme-apsta-idsup-idauth.bin

TARGET_BOOTLOADER_BOARD_NAME := f02ref
TARGET_NO_BOOTLOADER := true
TARGET_NO_KERNEL := true
TARGET_NO_RADIOIMAGE := true
TARGET_SIMULATOR := false
TARGET_PROVIDES_INIT_RC := true
TARGET_PROVIDES_UEVENTD_RC := true
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_ARCH_VARIANT := armv7-a-neon

# Recovery
TARGET_USE_AMLOGIC_MKYAFFS_TOOL := true
TARGET_AMLOGIC_MKYAFFSIMG_TOOL := mkyaffsimage4K.dat
TARGET_AMLOGIC_KERNEL := $(PRODUCT_OUT)/uImage
TARGET_AMLOGIC_RECOVERY_KERNEL := $(PRODUCT_OUT)/uImage_recovery
TARGET_AMLOGIC_AML_LOGO := device/amlogic/common/res/logo/a9.800x600.rot270.bmp
TARGET_AMLOGIC_LOGO := device/amlogic/common/res/logo/robot.800x600.rot270.bmp
TARGET_BUILD_WIPE_USERDATA := false

TARGET_BOOTANIMATION_SLIDE_HORIZONTAL := false

# Touch screen calibration
TARGET_TOUCH_CALIBRATION_METHOD := none
ifeq ($(TARGET_TOUCH_CALIBRATION_METHOD),tslib)
        ADDITIONAL_BUILD_PROPERTIES += ro.board.tscalibration=tslib
endif

# Use default APK, always TRUE in 2.3.3
BOARD_USE_DEFAULT_APPINSTALL := true
BOARD_USE_DEFAULT_HDMISWITCH := true

BOARD_USE_AML_STANDARD_RIL := true

BOARD_USES_USB_PM := true

# Use default keylayout in device/amlogic/common/keylayout
# instead of sdk/emulator/keymaps
PRODUCT_PROVIDES_DEFAULT_KEYLAYOUT := true

BOARD_PROVIDES_MALI := true

include device/amlogic/$(TARGET_PRODUCT)/recovery/Recovery.mk
