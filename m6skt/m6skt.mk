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

#
# This file is the build configuration for a full Android
# build for M1 reference board. This cleanly combines a set of
# device-specific aspects (drivers) with a device-agnostic
# product configuration (apps).
#

# Inherit from those products. Most specific first.
$(call inherit-product, device/amlogic/common/mbx_amlogic.mk)

# Discard inherited values and use our own instead.
PRODUCT_NAME := m6skt
PRODUCT_MANUFACTURER := MBX
PRODUCT_DEVICE := m6skt
PRODUCT_MODEL := MBX dev board (m6skt)
PRODUCT_LOCALES := en_US \
	zh_CN \
	mdpi hdpi

# Change this to match target country
# 11 North America; 14 Japan; 13 rest of world
PRODUCT_DEFAULT_WIFI_CHANNELS := 14

# Overlay for device specific settings
#DEVICE_PACKAGE_OVERLAYS := device/amlogic/m6skt/overlay

PRODUCT_PACKAGES += \
	FileBrowser \
	AppInstaller \
	VideoPlayer \
	Aml2DLauncher_mbx \
	Update \
	RemoteIME \
	remotecfg \
	pcli \
	audio_firmware \
	remote_control \
	40181/nvram.txt \
	40181/sdio-apsta.bin \
	40181/sdio-sta.bin \
	40181/fw_bcm43362a0.bin \
	wpa_supplicant.conf	

PRODUCT_COPY_FILES += \
	device/amlogic/m6skt/ump.ko:root/boot/ump.ko \
	device/amlogic/m6skt/mali.ko:root/boot/mali.ko
	
PRODUCT_COPY_FILES += device/amlogic/m6skt/dhd.ko:system/lib/dhd.ko	
	
BUILD_DVB_PACKAGES := false

PRODUCT_COPY_FILES += \
       $(LOCAL_PATH)/init.factorytest.rc:init.factorytest.rc \
       $(LOCAL_PATH)/initlogo-robot-1280x720.rle:root/initlogo.720p.rle \
       $(LOCAL_PATH)/initlogo-robot-1920x1080.rle:root/initlogo.1080p.rle \
       $(LOCAL_PATH)/initlogo-robot-720x480.rle:root/initlogo.480p.rle \
       $(LOCAL_PATH)/set_display_mode.sh:system/bin/set_display_mode.sh \
       $(LOCAL_PATH)/reset_display_mode.sh:system/bin/reset_display_mode.sh \
       $(LOCAL_PATH)/media_profiles.xml:system/etc/media_profiles.xml \
       $(LOCAL_PATH)/asound.conf:system/etc/asound.conf \
       $(LOCAL_PATH)/asound.state:system/etc/asound.state \
       $(LOCAL_PATH)/audio_effects.conf:system/etc/audio_effects.conf \
       $(LOCAL_PATH)/remote.conf:system/etc/remote.conf \
	     $(LOCAL_PATH)/Vendor_0001_Product_0001.kl:/system/usr/keylayout/Vendor_0001_Product_0001.kl

# Overlay for device specific settings
DEVICE_PACKAGE_OVERLAYS := device/amlogic/m6skt/overlay

PRODUCT_COPY_FILES += \
  frameworks/base/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \
	frameworks/base/data/etc/android.hardware.camera.autofocus.xml:system/etc/permissions/android.hardware.camera.autofocus.xml \
	frameworks/base/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
	frameworks/base/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
	frameworks/base/data/etc/android.hardware.sensor.gyroscope.xml:system/etc/permissions/android.hardware.sensor.gyroscope.xml \
	frameworks/base/data/etc/android.hardware.sensor.compass.xml:system/etc/permissions/android.hardware.sensor.compass.xml \
	frameworks/base/data/etc/android.hardware.touchscreen.xml:system/etc/permissions/android.hardware.touchscreen.xml \
	frameworks/base/data/etc/android.hardware.location.xml:system/etc/permissions/android.hardware.location.xml \
	packages/wallpapers/LivePicker/android.software.live_wallpaper.xml:system/etc/permissions/android.software.live_wallpaper.xml
