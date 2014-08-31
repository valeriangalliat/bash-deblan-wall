define REFRESH_USAGE

BEGIN {
	ignore = 0
}

/^Usage$$/ {
	usage = 1
}

usage && ignore && /^```$$/ {
	ignore = 0
	usage = 0
	system("./dwall --help")
}

!ignore

usage && /^```$$/ {
	ignore = 1
}

endef

export REFRESH_USAGE

README.md: force
	awk "$$REFRESH_USAGE" < $@ > $@.new
	mv $@.new $@

force:
