#! /usr/bin/make -f
# -*-makefile-*-


.DEFAULT:
	$(MAKE_CMD) $@ CONFIG=$(CONFIG) TOOLCHAIN=$(TOOLCHAIN)


.update-submodules:
	git submodule update --init --recursive
	touch .update-submodules

.gitmodules: .update-submodules


INSTALL_PREFIX?=~/install
PROJECT?=$(shell basename $(CURDIR))
CONFIGURATION_TYPES?=RelWithDebInfo;Debug;Tsan;Asan
DEST?=../install
CMAKE_FLAGS?=

export

ifeq ($(strip $(TOOLCHAIN)),)
	_build_name?=build
	_build_dir?=./cmake.bld/${PROJECT}
	_configuration_types?="RelWithDebInfo;Debug;Tsan;Asan"
	_cmake_args=-DCMAKE_TOOLCHAIN_FILE=$(CURDIR)/etc/clang-19-toolchain.cmake
else
	_build_name?=build-$(TOOLCHAIN)
	_build_dir?=./cmake.bld/${PROJECT}
	_configuration_types?="RelWithDebInfo;Debug;Tsan;Asan"
	_cmake_args=-DCMAKE_TOOLCHAIN_FILE=$(CURDIR)/etc/$(TOOLCHAIN)-toolchain.cmake
endif

ifeq ($(strip $(CONFIG)),)
_config=RelWithDebInfo
else
_config=$(CONFIG)
endif

_build_path?=$(_build_dir)/$(_build_name)

define run_cmake =
	cmake \
	-G "Ninja Multi-Config" \
	-DCMAKE_CONFIGURATION_TYPES=$(_configuration_types) \
	-DCMAKE_INSTALL_PREFIX=$(abspath $(INSTALL_PREFIX)) \
	-DCMAKE_EXPORT_COMPILE_COMMANDS=1 \
	$(_cmake_args) \
	$(CURDIR)
endef

.PHONY: default
default: compile

$(_build_path):
	mkdir -p $(_build_path)

$(_build_path)/CMakeCache.txt: | $(_build_path) .gitmodules
	cd $(_build_path) && $(run_cmake)
	-rm compile_commands.json
	ln -s $(_build_path)/compile_commands.json

.PHONY: compile
compile: $(_build_path)/CMakeCache.txt ## Compile the project
	cmake --build $(_build_path)  --config $(_config) --target all -v -- -k 0

.PHONY: install
install: $(_build_path)/CMakeCache.txt ## Install the project
	DESTDIR=$(abspath $(DEST)) ninja -C $(_build_path) -k 0  install

.PHONY: ctest
ctest: $(_build_path)/CMakeCache.txt ## Run CTest on current build
	cd $(_build_path) && ctest

.PHONY: ctest_
ctest_ : compile
	cd $(_build_path) && ctest

.PHONY: test
test: ctest_ ## Rebuild and run tests

.PHONY: cmake
cmake: |  $(_build_path)
	cd $(_build_path) && ${run_cmake}

.PHONY: realclean
clean: $(_build_path)/CMakeCache.txt ## Clean the build artifacts
	cmake --build $(_build_path)  --config $(_config) --target clean

.PHONY: realclean
realclean: ## Delete the build directory
	rm -rf $(_build_path)

env:
	$(foreach v, $(.VARIABLES), $(info $(v) = $($(v))))


# Help target
.PHONY: help
help: ## Show this help.
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z_-]+:.*?## / {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'  $(MAKEFILE_LIST) | sort

.PHONY: install ctest cmake clean realclean help cmake
