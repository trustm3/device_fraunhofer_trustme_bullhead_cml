#
# This file is part of trust|me
# Copyright(c) 2013 - 2018 Fraunhofer AISEC
# Fraunhofer-Gesellschaft zur Förderung der angewandten Forschung e.V.
#
# This program is free software; you can redistribute it and/or modify it
# under the terms and conditions of the GNU General Public License,
# version 2 (GPL 2), as published by the Free Software Foundation.
#
# This program is distributed in the hope it will be useful, but WITHOUT
# ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
# FITNESS FOR A PARTICULAR PURPOSE. See the GPL 2 license for more details.
#
# You should have received a copy of the GNU General Public License along with
# this program; if not, see <http://www.gnu.org/licenses/>
#
# The full GNU General Public License is included in this distribution in
# the file called "COPYING".
#
# Contact Information:
# Fraunhofer AISEC <trustme@aisec.fraunhofer.de>
#

ifeq ($(TARGET_PREBUILT_KERNEL),)
LOCAL_KERNEL := out-trustme/kernel/bullhead/obj/arch/arm64/boot/Image.gz-dtb
else
LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

PRODUCT_COPY_FILES := \
	$(LOCAL_KERNEL):kernel

$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)

PRODUCT_NAME := trustme_bullhead_cml
PRODUCT_DEVICE := bullhead
PRODUCT_BRAND := Android
PRODUCT_MODEL := trust|me CML for Nexus 5X
PRODUCT_MANUFACTURER := fraunhofer
TRUSTME_HARDWARE := bullhead

##################################################
# Configure device specific parts for CML

PRODUCT_COPY_FILES += \
    device/fraunhofer/trustme_bullhead_cml/fstab.bullhead:root/fstab.bullhead \
    device/fraunhofer/trustme_bullhead_cml/init.trustme_bullhead_cml.rc:root/init.rc \
    device/fraunhofer/trustme_bullhead_cml/init.recovery.bullhead.rc:root/init.recovery.bullhead.rc \
    device/lge/bullhead/init.bullhead.usb.rc:root/init.bullhead.usb.rc

$(call inherit-product, device/fraunhofer/trustme_generic/trustme_generic_cml.mk)
