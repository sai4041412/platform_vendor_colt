# Copyright (C) 2017 Unlegacy-Android
# Copyright (C) 2017,2020 The LineageOS Project
# Copyright (C) 2020 The ColtOS Project
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
# -----------------------------------------------------------------
#
# Build system colors
#
# PFX: Prefix "target C++:" in yellow
# INS: Module "Install:" output color (cyan for ics)

ifneq ($(BUILD_WITH_COLORS),0)
    include $(TOP_DIR)build/tasks/colors.mk
endif

# ColtOS OTA update package
COLT_TARGET_PACKAGE := $(PRODUCT_OUT)/$(COLT_VERSION).zip

MD5 := prebuilts/build-tools/path/$(HOST_PREBUILT_TAG)/md5sum

.PHONY: colt
colt: $(INTERNAL_OTA_PACKAGE_TARGET)
	$(hide) ln -f $(INTERNAL_OTA_PACKAGE_TARGET) $(COLT_TARGET_PACKAGE)
	$(hide) $(MD5) $(COLT_TARGET_PACKAGE) | sed "s|$(PRODUCT_OUT)/||" > $(COLT_TARGET_PACKAGE).md5sum
	@echo -e ${CL_RED}"                                                                                                                                  "${CL_RED}
	@echo -e ${CL_RED}"**********************************************************************************************************************************"${CL_RED}
	@echo -e ${CL_RED}"*─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────*"${CL_RED}
	@echo -e ${CL_RED}"*─██████████████─██████████████─██████─────────██████████████────██████████████─██████████████────────────────████████████████────*"${CL_RED}
	@echo -e ${CL_RED}"*─██░░░░░░░░░░██─██░░░░░░░░░░██─██░░██─────────██░░░░░░░░░░██────██░░░░░░░░░░██─██░░░░░░░░░░██────────────────██░░░░░░░░░░░░██────*"${CL_RED}
	@echo -e ${CL_CYN}"*─██░░██████████─██░░██████░░██─██░░██─────────██████░░██████────██░░██████░░██─██░░██████████────────────────██░░████████░░██────*"${CL_CYN}
	@echo -e ${CL_CYN}"*─██░░██─────────██░░██──██░░██─██░░██─────────────██░░██────────██░░██──██░░██─██░░██────────────────────────██░░██────██░░██────*"${CL_CYN}
	@echo -e ${CL_CYN}"*─██░░██─────────██░░██──██░░██─██░░██─────────────██░░██────────██░░██──██░░██─██░░██████████─██████████████─██░░████████░░██────*"${CL_CYN}
	@echo -e ${CL_CYN}"*─██░░██─────────██░░██──██░░██─██░░██─────────────██░░██────────██░░██──██░░██─██░░░░░░░░░░██─██░░░░░░░░░░██─██░░░░░░░░░░░░██────*"${CL_CYN}
	@echo -e ${CL_CYN}"*─██░░██─────────██░░██──██░░██─██░░██─────────────██░░██────────██░░██──██░░██─██████████░░██─██████████████─██░░██████░░████────*"${CL_CYN}
	@echo -e ${CL_YLW}"*─██░░██─────────██░░██──██░░██─██░░██─────────────██░░██────────██░░██──██░░██─────────██░░██────────────────██░░██──██░░██──────*"${CL_YLW}
	@echo -e ${CL_YLW}"*─██░░██████████─██░░██████░░██─██░░██████████─────██░░██────────██░░██████░░██─██████████░░██────────────────██░░██──██░░██████──*"${CL_YLW}
	@echo -e ${CL_YLW}"*─██░░░░░░░░░░██─██░░░░░░░░░░██─██░░░░░░░░░░██─────██░░██────────██░░░░░░░░░░██─██░░░░░░░░░░██────────────────██░░██──██░░░░░░██──*"${CL_YLW}
	@echo -e ${CL_YLW}"*─██████████████─██████████████─██████████████─────██████────────██████████████─██████████████────────────────██████──██████████──*"${CL_YLW}
	@echo -e ${CL_YLW}"*─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────*"${CL_YLW}
	@echo -e ${CL_YLW}"***********************************************************************************************************************************"${CL_YLW}
	@echo -e ${CL_CYN}"                                            Thanks for Compiling ColtOS : Enjoy :)                                                 "${CL_CYN}
	@echo -e ${CL_CYN}"=====================================================Package Completed============================================================="${CL_CYN}
	@echo -e ${CL_CYN}"                                                   ColtOS -> by TeamColt                                                           "${CL_CYN}
	@echo -e ${CL_CYN}"***********************************************************************************************************************************"${CL_CYN}
	@echo -e ${CL_RED}"                                                                                                                                   "${CL_RED}
	@echo -e ${CL_BLD}${CL_YLW}"Zip: "${CL_YLW} $(COLT_TARGET_PACKAGE)${CL_YLW}
	@echo -e ${CL_BLD}${CL_YLW}"MD5: "${CL_YLW}" `cat $(COLT_TARGET_PACKAGE).md5sum | awk '{print $$1}' `"${CL_YLW}
	@echo -e ${CL_BLD}${CL_YLW}"Size:"${CL_YLW}" `du -sh $(COLT_TARGET_PACKAGE) | awk '{print $$1}' `"${CL_YLW}
	@echo -e ${CL_BLD}${CL_RED}"======================================================================================================================="${CL_RED}
