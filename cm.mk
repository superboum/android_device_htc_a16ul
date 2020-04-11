# Release name
PRODUCT_RELEASE_NAME := a16ul

# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/common_full_phone.mk)

# Inherit device configuration
$(call inherit-product, device/htc/a16ul/device_a16ul.mk)

## Device identifier. This must come after all inclusions
PRODUCT_DEVICE := a16ul
PRODUCT_NAME := cm_a16ul
PRODUCT_BRAND := htc
PRODUCT_MODEL := a16ul
PRODUCT_MANUFACTURER := htc
