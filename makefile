SHELL := /bin/bash

### Load project-specific vars
-include .makerc
### Load Client overrides
-include ../.makerc

.PHONY: printvars test

printvars:
	@$(foreach V,$(sort $(.VARIABLES)), \
		$(if $(filter-out environment% default automatic, \
		$(origin $V)),$(warning $V=$($V) ($(value $V)))))

test: printvars

SRC = $(wildcard uploads/**/*.jpg)

# PDFS=$(SRC:.md=.pdf)
TNS=$(SRC:.jpg=_tn.jpg)
MDS=$(SRC:uploads/%.jpg=_%.md)

JPG_FILES := $(wildcard uploads/**/*.jpg)
TN_FILES := $(patsubst %.jpg,%_tn.jpg,$(JPG_FILES))
MD_FILES := $(patsubst %.jpg,%.md,$(JPG_FILES))

build-thumbs: $(JPG_FILES:%.jpg=%_tn.jpg) ##@website Create thumbnails for gallery images (all)
	$(TN_FILES)

thumbs: $(TNS) cleanup ##@website Create thumbnails for gallery images (all)

galleries: $(MD_FILES)
	# $(MD_FILES)

METRIC := canny
FUZZVAL := 10
TNSIZE := 250
%_tn.jpg: %.jpg ##@website Create a thumbnail image using content-aware cropping
	mkdir -p $(@D)/thumbnail
ifeq '$(ALT)' 'Y'
	../APP/smarttrim.sh -m $(METRIC) -f $(FUZZVAL) -s $(TNSIZE)x$(TNSIZE) $< $(@D)/thumbnail/$(@F)
else
	smartcrop --width $(TNSIZE) --height $(TNSIZE) $< $(@D)/thumbnail/$(@F)
endif

%.md: %.jpg
	printf -- "---\nlayout: galleryitem\nimage_path: /$<\ntitle: $(shell echo $(subst -, ,$(basename $(@F))) | sed 's/[^ ]\+/\L\u&/g') \npublished: true\ndate: $(shell stat -c "%x" $<)\n---\n\n" > $(subst uploads/,_,$(@D))/$(@F)

cleanup: uploads/**/*_tn_tn.jpg
	rm -rf $^

clean: $(wildcard uploads/**/*_tn_tn.jpg)
	rm -rf $^
