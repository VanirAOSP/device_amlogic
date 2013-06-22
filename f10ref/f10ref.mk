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
PRODUCT_NAME := f10ref 
PRODUCT_MANUFACTURER := MBX
PRODUCT_DEVICE := f10ref
PRODUCT_MODEL := MBX M3 reference board (f10ref)
PRODUCT_LOCALES := en_US \
	zh_CN \
	zh_TW \
	en_GB \
	ja_JP \
	mdpi hdpi

# Change this to match target country
# 11 North America; 14 Japan; 13 rest of world
PRODUCT_DEFAULT_WIFI_CHANNELS := 14

# Overlay for device specific settings
DEVICE_PACKAGE_OVERLAYS := device/amlogic/f10ref/overlay

PRODUCT_PACKAGES += \
	FileBrowser \
	AppInstaller \
	VideoPlayer \
	Samba \
	libsmbbase \
	libsmbmnt \
	smbd \
	Aml2DLauncher_mbx \
	Update \
	RemoteIME \
	OOBE \
	remotecfg \
        libpppoejni \
        pppoe_wrapper \
        pppoe \
        amlogic.pppoe \
        amlogic.pppoe.xml \
        pcli 



BUILD_DVB_PACKAGES := false

ifeq ($(BUILD_DVB_PACKAGES), true)
PRODUCT_PACKAGES += \
	libam_adp \
	libam_mw \
	libjnidvbplayer \
	libjnidvr \
	libjnifrontend \
	libjnidmx \
	libjnidsc \
	libjnifilter \
	libjniosd \
	libjniamsmc \
	libjnidvbdatabase \
	libjnidvbscanner \
	libjnidvbepgscanner \
	libjnidvbrecorder \
	libjnidvbsubtitle \
	libjnidvbteletext \
	bookplay_package \
	dvbepg \
	DVBPlayer \
	dvbsearch \
	DVBService \
	progmanager
endif

