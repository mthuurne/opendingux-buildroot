ifeq ($(BR2_PACKAGE_EFL),y)
include package/efl/eina/eina.mk
include package/efl/evas/evas.mk
include package/efl/ecore/ecore.mk
include package/efl/eet/eet.mk
include package/efl/embryo/embryo.mk
include package/efl/edje/edje.mk
include package/efl/elementary/elementary.mk
endif

