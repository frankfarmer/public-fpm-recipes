RECIPES := $(patsubst recipes/%, %, $(wildcard recipes/*))

TARGET := bionic64
# TARGET ?= precise64
.PHONY: all force $(RECIPES)

PACKAGE_DIR=packages/$(TARGET)

all: $(RECIPES)
	@

recipes/%: %
	@

$(RECIPES): %: recipes/%/recipe.rb force
	@echo -e '\n'Cleaning build dir $@
	@rm -rf "recipes/$@/tmp-build/"
	@echo -e '\n'Making $@ for $(TARGET)
	@vagrant docker-run $(TARGET) -- fpm-cook package /vagrant/$< ;\

collect:
	@mkdir -p $(PACKAGE_DIR)
	@find recipes/ -name "*.deb" | xargs -I: mv : $(PACKAGE_DIR)/
