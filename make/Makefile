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

# Flexpaper
flexpaper: directories pdf js png

directories:
	if (test -d ${name}); then ${MV} ${name}/${name}.pdf ${name}.pdf && ${RM} ${name}; fi
	${MKDIR_P} ${name}
	${MV} ${name}.pdf ${name}

pdf:
	if [[ "${PTB}" == 1 ]]; then pdf2swf -f -T 9 -t -s storeallcharacters -s poly2bitmap ${name}/${name}.pdf -o ${name}/${name}.pdf.swf; else pdf2swf -f -T 9 -t -s storeallcharacters ${name}/${name}.pdf -o ${name}/${name}.pdf.swf; fi

js:
	pdf2json ${name}/${name}.pdf -enc UTF-8 -compress ${name}/${name}.pdf.js

png:
	mudraw -r100 -o ${name}/${name}.pdf_%d.png ${name}/${name}.pdf

# Sort Pictures
sortpictures: eachpicture

eachpicture:
	@echo 'starting sorting pictures..'
	@for i in ${path}*; do \
		date=`stat -f %SB -t '${FORMAT}' $$i`; \
		type=`file --mime-type -b $$i`; \
		if [[ "$$type" =~ image\/[a-zA-Z]* || "$$type" = video/quicktime ]]; then \
			${MKDIR_P} ${path}$$date; \
			${MV} $$i ${path}$$date; \
		fi \
	done
	@echo 'finished successfully'
