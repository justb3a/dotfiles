SHELL=/bin/bash

#---------------------------------------------------------------------
# executables
#---------------------------------------------------------------------
MKDIR_P = mkdir -p
MV = mv
RM = rm -R
PTB = ${ptb}
.PHONY: directories
FORMAT = %Y%m%d

#---------------------------------------------------------------------
# rules
#---------------------------------------------------------------------
help:
	@echo "Please use \`make <target>\` where <target> is one of"
	@echo ""
	@echo " - flexpaper     * DESC:           to convert a standalone PDF file to pdf, javascript, png and swf to use it for flexpaper"
	@echo "                 * USAGE:          please use \`make flexpaper name=<name>\` where <name> is the name of the pdf without file extension"
	@echo "                 * ERROR HANDLING: use \`ptb=1\` if error \"FATAL Internal error: badly balanced softmasks/transparency groups\" occurs, use with care: QUALITY SUFFERS"
	@echo ""
	@echo " - sortpictures  * DESC:           sorts pictures in several folders automatically by creation date"
	@echo "                 * USAGE:          please use \`make sortpictures\` to start sorting"
	@echo "                                   optional you can pass several arguments:"
	@echo "                                     - \`path\` to specify the folder containing the pictures (important: add an ending slash)"
	@echo "                                     - \`FORMAT\` in terse form, the default format will be \`%Y%m%d\`"

# Sort Pictures
sortpictures: eachpicture

eachpicture:
	@echo 'start sorting pictures..'
	@for i in ${path}*; do \
		date=`stat -f %SB -t '${FORMAT}' $$i`; \
		type=`file --mime-type -b $$i`; \
		if [[ "$$type" =~ image\/[a-zA-Z]* || "$$type" = video/quicktime ]]; then \
			${MKDIR_P} ${path}$$date; \
			${MV} $$i ${path}$$date; \
		fi \
	done
	@echo 'finished successfully'
