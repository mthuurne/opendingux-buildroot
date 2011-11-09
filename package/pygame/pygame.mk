
PYGAME_VERSION = 1.9.1release
PYGAME_SOURCE = pygame-$(PYGAME_VERSION).tar.gz
PYGAME_SITE = http://pygame.org/ftp/
PYGAME_DEPENDENCIES = host-python python sdl sdl_ttf sdl_image sdl_mixer libpng jpeg

PYGAME_DIR=$(BUILD_DIR)/pygame-$(PYGAME_VERSION)

PYGAME_LIB_DIR=$(PYGAME_DIR)/lib
PYGAME_SRC_DIR=$(PYGAME_DIR)/src

PYGAME_PYTHON_MODULES_DIR=$(TARGET_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR)/site-packages
PYGAME_INSTALL_DIR=$(PYGAME_PYTHON_MODULES_DIR)/pygame

#--StartConfig
#SDL = -I/usr/include/SDL -D_REENTRANT -lSDL
SDL = -lSDL -I$(STAGING_DIR)/usr/include/SDL
FONT = -lSDL_ttf
IMAGE = -lSDL_image
MIXER = -lSDL_mixer
SMPEG = -lsmpeg
PNG = -lpng
JPEG = -ljpeg
SCRAP = -lX11
PORTMIDI = -lportmidi
PORTTIME = -lporttime
#--EndConfig

CFLAGS = $(TARGET_CFLAGS) -fPIC -D_REENTRANT \
		 -I$(STAGING_DIR)/usr/include/python$(PYTHON_VERSION_MAJOR)
LDFLAGS = -pthread -shared $(SDL)

$(PYGAME_SRC_DIR)/%.c: $(PYGAME_DIR)/.downloaded

# Generic rule for building pygame' shared libraries.
$(PYGAME_LIB_DIR)/%.so: $(PYGAME_SRC_DIR)/%.c
	$(TARGET_CC) $(CFLAGS) $^ $(LDFLAGS) -o $@


#the following modules are optional. you will want to compile
#everything you can, but you can ignore ones you don't have
#dependencies for, just comment them out

$(PYGAME_LIB_DIR)/imageext.so: $(PYGAME_SRC_DIR)/imageext.c
	$(TARGET_CC) $(CFLAGS) $^ $(LDFLAGS) -o $@ $(IMAGE) $(PNG) $(JPEG)

$(PYGAME_LIB_DIR)/font.so: $(PYGAME_SRC_DIR)/font.c
	$(TARGET_CC) $(CFLAGS) $^ $(LDFLAGS) -o $@ $(FONT)

$(PYGAME_LIB_DIR)/mixer.so: $(PYGAME_SRC_DIR)/mixer.c
	$(TARGET_CC) $(CFLAGS) $^ $(LDFLAGS) -o $@ $(MIXER)

$(PYGAME_LIB_DIR)/mixer_music.so: $(PYGAME_SRC_DIR)/music.c
	$(TARGET_CC) $(CFLAGS) $^ $(LDFLAGS) -o $@ $(MIXER)

$(PYGAME_LIB_DIR)/_numericsurfarray.so: $(PYGAME_SRC_DIR)/_numericsurfarray.c
	$(TARGET_CC) $(CFLAGS) $^ $(LDFLAGS) -o $@

$(PYGAME_LIB_DIR)/_numericsndarray.so: $(PYGAME_SRC_DIR)/_numericsndarray.c
	$(TARGET_CC) $(CFLAGS) $^ $(LDFLAGS) -o $@ $(MIXER)

$(PYGAME_LIB_DIR)/movie.so: $(PYGAME_SRC_DIR)/movie.c
	$(TARGET_CC) $(CFLAGS) $^ $(LDFLAGS) -o $@ $(SMPEG)

$(PYGAME_LIB_DIR)/scrap.so: $(PYGAME_SRC_DIR)/scrap.c
	$(TARGET_CC) $(CFLAGS) $^ $(LDFLAGS) -o $@ $(SCRAP)

$(PYGAME_LIB_DIR)/_camera.so: $(PYGAME_SRC_DIR)/_camera.c $(PYGAME_SRC_DIR)/camera_v4l2.c $(PYGAME_SRC_DIR)/camera_v4l.c
	$(TARGET_CC) $(CFLAGS) $^ $(LDFLAGS) -o $@

$(PYGAME_LIB_DIR)/pypm.so: $(PYGAME_SRC_DIR)/pypm.c
	$(TARGET_CC) $(CFLAGS) $^ $(LDFLAGS) -o $@ $(PORTMIDI) $(PORTTIME)

$(PYGAME_LIB_DIR)/gfxdraw.so: $(PYGAME_SRC_DIR)/gfxdraw.c
	$(TARGET_CC) $(CFLAGS) $^ $(LDFLAGS) -o $@ $(GFX)

PYGAME_MODULES_ALT  = imageext font mixer mixer_music \
					  _numericsurfarray _numericsndarray \
					  gfxdraw \
#					  movie scrap _camera pypm



#these modules are required for pygame to run. they only require
#SDL as a dependency. these should not be altered

$(PYGAME_LIB_DIR)/fastevent.so: $(PYGAME_SRC_DIR)/fastevent.c $(PYGAME_SRC_DIR)/fastevents.c
	$(TARGET_CC) $(CFLAGS) $^ $(LDFLAGS) -o $@

$(PYGAME_LIB_DIR)/surface.so: $(PYGAME_SRC_DIR)/surface.c $(PYGAME_SRC_DIR)/alphablit.c $(PYGAME_SRC_DIR)/surface_fill.c
	$(TARGET_CC) $(CFLAGS) $^ $(LDFLAGS) -o $@

$(PYGAME_LIB_DIR)/transform.so: $(PYGAME_SRC_DIR)/transform.c $(PYGAME_SRC_DIR)/rotozoom.c $(PYGAME_SRC_DIR)/scale2x.c $(PYGAME_SRC_DIR)/scale_mmx.c
	$(TARGET_CC) $(CFLAGS) $^ $(LDFLAGS) -o $@ -D_NO_MMX_FOR_X86_64

$(PYGAME_LIB_DIR)/mask.so: $(PYGAME_SRC_DIR)/mask.c $(PYGAME_SRC_DIR)/bitmask.c
	$(TARGET_CC) $(CFLAGS) $^ $(LDFLAGS) -o $@

PYGAME_MODULES_BASE = base cdrom color constants \
					  display event fastevent key \
					  mouse rect rwobject surface \
					  surflock time joystick draw \
					  image overlay transform mask \
					  bufferproxy pixelarray _arraysurfarray


PYGAME_MODULES_ALL  =   $(addsuffix .so,$(addprefix $(PYGAME_LIB_DIR)/,$(PYGAME_MODULES_BASE)) $(addprefix $(PYGAME_LIB_DIR)/,$(PYGAME_MODULES_ALT)))

#$(HOST_DIR)/usr/bin/python -OO -E -c 'import compileall ; compileall.compile_dir("$$i")' ;
pygame_compile:
	for i in `find $(PYGAME_LIB_DIR) -type d` ; do \
		$(HOST_DIR)/usr/bin/python -OO -E -c "import compileall ; compileall.compile_dir('$$i')" ; \
	done

#pygame_compile:
#	for i in `find $(PYGAME_LIB_DIR) -type f -name *.py` ; do \
#		$(HOST_DIR)/usr/bin/python -m py_compile $$i ; \
#	done

ifeq ($(BR2_PACKAGE_PYTHON_PYC_ONLY),y)
$(PYGAME_DIR)/.compiled: pygame_compile
	for i in `find $(PYGAME_LIB_DIR) -type f -name *.py` ; do \
		if [ -f $$ic ] ; then rm -f $$i ; fi ; \
	done
endif

ifeq ($(BR2_PACKAGE_PYTHON_PY_PYC),y)
$(PYGAME_DIR)/.compiled: pygame_compile
endif

ifeq ($(BR2_PACKAGE_PYTHON_PY_ONLY),y)
$(PYGAME_DIR)/.compiled:
endif

$(PYGAME_DIR)/.downloaded:
	rm -rf $(PYGAME_DIR)
	$(call DOWNLOAD,$(PYGAME_SITE),$(PYGAME_SOURCE))
	tar -xzf $(DL_DIR)/$(PYGAME_SOURCE) --directory $(BUILD_DIR)
	touch $@

pygame_build_modules:
	make -j $(BR2_JLEVEL) $(PYGAME_MODULES_ALL)

$(PYGAME_LIB_DIR): $(PYGAME_DIR)/.downloaded pygame_build_modules $(PYGAME_DIR)/.compiled

$(PYGAME_DIR)/.installed: $(PYGAME_LIB_DIR)
	cp -r $(PYGAME_LIB_DIR) $(PYGAME_INSTALL_DIR)
	touch $@

pygame: $(PYGAME_DEPENDENCIES) $(PYGAME_DIR)/.installed

pygame-dirclean:
	rm -rf $(PYGAME_INSTALL_DIR)

pygame-clean: pygame-dirclean
	rm -rf $(PYGAME_MODULES_ALL)

ifeq ($(BR2_PACKAGE_PYGAME),y)
TARGETS+=pygame
endif

