USE_PKGBUILD=1
include /usr/local/share/luggage/luggage.make
TITLE=jmp_12_license
REVERSE_DOMAIN=com.example
PAYLOAD=\
	pack-JMP_12_per\
	pack-script-postinstall

l_JMP_12: l_Library_Application_Support
	@sudo mkdir -p ${WORK_D}/Library/Application\ Support/JMP
	@sudo mkdir -p ${WORK_D}/Library/Application\ Support/JMP/12

pack-JMP_12_per: l_JMP_12
	@sudo ${CP} ./JMP.per ${WORK_D}/Library/Application\ Support/JMP/12/JMP.per
	@sudo chmod 755 ${WORK_D}/Library/Application\ Support/JMP/12/
	@sudo chown root:admin ${WORK_D}/Library/Application\ Support/JMP/12/JMP.per

munkiimport: dmg
		munkiimport \
--nointeractive \
--subdirectory apps \
--name "${TITLE}" \
--displayname "JMP 12 license" \
--description "License file for JMP 12." \
--category "Productivity" \
--developer "SAS Institute Inc." \
--icon_name "JMP.png" \
--minimum_os_version "10.7.0" \
--update_for="JMP Pro" \
"${DMG_NAME}"