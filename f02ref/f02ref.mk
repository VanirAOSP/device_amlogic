# Copyright (C) 2011 Amlogic Inc
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

#
# This file is the build configuration for a full Android
# build for M1 reference board. This cleanly combines a set of
# device-specific aspects (drivers) with a device-agnostic
# product configuration (apps).
#

# Inherit from those products. Most specific first.
$(call inherit-product, device/amlogic/common/mid_amlogic.mk)

# Discard inherited values and use our own instead.
PLATFORM_VERSION_CODENAME := REL
PRODUCT_NAME := f02ref
PRODUCT_MANUFACTURER := MID
PRODUCT_DEVICE := f02ref
PRODUCT_MODEL := MID reference device (f02ref)
# For all locales, $(call inherit-product, buid/target/product/languages_full.mk)
PRODUCT_LOCALES := en_US \
	zh_CN \
	zh_TW \
	en_GB \
	fr_FR \
	it_IT \
	cs_CZ \
	de_DE \
	da_DK \
	el_GR \
	es_ES \
	ja_JP \
	ko_KR \
	nl_NL \
	pt_BR \
	ru_RU \
	sv_SE \
	mdpi hdpi

# Change this to match target country
# 11 North America; 14 Japan; 13 rest of world
PRODUCT_DEFAULT_WIFI_CHANNELS := 14

PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
	persist.sys.usb.config=mass_storage

PRODUCT_PACKAGES += \
	camera.amlogic \
	sensors.amlogic \
	lights.amlogic \
	FileBrowser \
	AppInstaller \
	VideoPlayer \
	HdmiSwitch \
	audio_firmware \
	fw_printenv

# Camera
PRODUCT_PACKAGES += \
        camera.amlogic.so

#BlueTooth
PRODUCT_PACKAGES += Bluetooth

# AML Standard RIL
PRODUCT_PACKAGES += \
	Phone       \
	usb_modeswitch \
	libaml-ril.so \
	init-pppd.sh \
	ip-up \
	chat

# Device specific system feature description
PRODUCT_COPY_FILES += \
	device/amlogic/f02ref/tablet_core_hardware.xml:system/etc/permissions/tablet_core_hardware.xml \
	frameworks/base/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \
	frameworks/base/data/etc/android.hardware.camera.autofocus.xml:system/etc/permissions/android.hardware.camera.autofocus.xml \
	frameworks/base/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
	frameworks/base/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
	frameworks/base/data/etc/android.hardware.sensor.gyroscope.xml:system/etc/permissions/android.hardware.sensor.gyroscope.xml \
	frameworks/base/data/etc/android.hardware.touchscreen.xml:system/etc/permissions/android.hardware.touchscreen.xml \
	frameworks/base/data/etc/android.hardware.location.xml:system/etc/permissions/android.hardware.location.xml \
	packages/wallpapers/LivePicker/android.software.live_wallpaper.xml:system/etc/permissions/android.software.live_wallpaper.xml

# multitouch
PRODUCT_COPY_FILES += \
	frameworks/base/data/etc/android.hardware.touchscreen.multitouch.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.xml \
	frameworks/base/data/etc/android.hardware.touchscreen.multitouch.distinct.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.distinct.xml

# Ilitek Touch Screen
PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/Vendor_222a_Product_0001.idc:system/usr/idc/Vendor_222a_Product_0001.idc

# Light sensor
PRODUCT_COPY_FILES += \
	frameworks/base/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml

# Battery icons shown from uboot
PRODUCT_COPY_FILES += \
	device/amlogic/common/res/battery/0.rot270.bmp:system/resource/battery_pic/0.bmp \
	device/amlogic/common/res/battery/1.rot270.bmp:system/resource/battery_pic/1.bmp \
	device/amlogic/common/res/battery/2.rot270.bmp:system/resource/battery_pic/2.bmp \
	device/amlogic/common/res/battery/3.rot270.bmp:system/resource/battery_pic/3.bmp \
	device/amlogic/common/res/battery/4.rot270.bmp:system/resource/battery_pic/4.bmp \
	device/amlogic/common/res/battery/power_low.rot270.bmp:system/resource/battery_pic/power_low.bmp

# Wifi driver
PRODUCT_COPY_FILES += device/amlogic/f02ref/dhd.ko:system/lib/dhd.ko
PRODUCT_COPY_FILES += device/amlogic/f02ref/mali.ko:root/boot/mali.ko
PRODUCT_COPY_FILES += device/amlogic/f02ref/ump.ko:root/boot/ump.ko
PRODUCT_PACKAGES += wpa_supplicant.conf nvram.txt \
	sdio-g-cdc-full11n-reclaim-roml-wme-idsup.bin \
	sdio-g-cdc-roml-reclaim-wme-apsta-idsup-idauth.bin

#Superuser
BOARD_USE_ADD_SUPERUSER := false
ifeq ($(BOARD_USE_ADD_SUPERUSER),true)
PRODUCT_PACKAGES += \
	Superuser \
	su
endif

PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/init.factorytest.rc:root/init.factorytest.rc \
	$(LOCAL_PATH)/../common/res/logo/robot.800x600.rot270.rle:root/initlogo.rle.bak \
	$(LOCAL_PATH)/set_display_mode.sh:system/bin/set_display_mode.sh \
	$(LOCAL_PATH)/set_camera_clk.sh:system/bin/set_camera_clk.sh \
	$(LOCAL_PATH)/media_profiles.xml:system/etc/media_profiles.xml \
	$(LOCAL_PATH)/asound.conf:system/etc/asound.conf \
	$(LOCAL_PATH)/asound.state:system/etc/asound.state \
	$(LOCAL_PATH)/audio_effects.conf:system/etc/audio_effects.conf

# App optimization
PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/liboptimization.so:system/lib/liboptimization.so

# Overlay for device specific settings
DEVICE_PACKAGE_OVERLAYS := device/amlogic/f02ref/overlay

