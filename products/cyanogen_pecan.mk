# Inherit device configuration
$(call inherit-product, device/lge/pecan/pecan.mk)

# Inherit some common cyanogenmod stuff.
$(call inherit-product, vendor/cyanogen/products/common_full.mk)

# Include GSM stuff
$(call inherit-product, vendor/cyanogen/products/gsm.mk)

#
# Setup device specific product configuration.
#
PRODUCT_NAME := cyanogen_pecan
PRODUCT_BRAND := lge
PRODUCT_DEVICE := pecan
PRODUCT_MODEL := Optimus Me
PRODUCT_MANUFACTURER := LGE
PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=lge_pecan BUILD_ID=GRJ90 BUILD_DISPLAY_ID=GRJ90 BUILD_FINGERPRINT=LGE/pecan/pecan/pecan:2.3.7/GRJ90/20111018:user/release-keys PRIVATE_BUILD_DESC="pecan-user 2.3.7 GRJ90 20111018 release-keys"

# Add LDPI assets, in addition to MDPI
PRODUCT_LOCALES += ldpi mdpi

# Extra overlay for LDPI
PRODUCT_PACKAGE_OVERLAYS += vendor/cyanogen/overlay/ldpi

# Extra Star overlay
PRODUCT_PACKAGE_OVERLAYS += vendor/cyanogen/overlay/pecan

#
# Set ro.modversion
#
ifdef CYANOGEN_NIGHTLY
    PRODUCT_PROPERTY_OVERRIDES += \
        ro.modversion=CyanogenMod-7-$(shell date +%m%d%Y)-NIGHTLY-pecan
else
    ifdef CYANOGEN_RELEASE
        PRODUCT_PROPERTY_OVERRIDES += \
            ro.modversion=CyanogenMod-7.1.0-pecan
    else
        PRODUCT_PROPERTY_OVERRIDES += \
            ro.modversion=CyanogenMod-7.1.0-pecan-KANG
    endif
endif

#
# Copy prebuilt files
#
PRODUCT_COPY_FILES +=  \
    vendor/cyanogen/prebuilt/ldpi/media/bootanimation.zip:system/media/bootanimation.zip
