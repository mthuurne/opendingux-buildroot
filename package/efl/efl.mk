ifeq ($(BR2_PACKAGE_EFL),y)
include package/efl/eina/eina.mk
include package/efl/evas/evas.mk
endif

