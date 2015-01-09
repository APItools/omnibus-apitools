MACHINES=$(shell bin/kitchen list -b 2> /dev/null)
LOG_LEVEL=debug

default: converge all

all: build
build: $(MACHINES)

converge:
	bin/kitchen create all
	bin/kitchen converge all

$(MACHINES): % :
	bin/kitchen exec $@ -c 'sudo chruby-exec $${RUBY_ENGINE}-$${RUBY_VERSION} -- "cd apitools-monitor && make omnibus"'

clean:
	rm -rf /var/cache/omnibus/pkg/
	# bin/omnibus clean apitools-monitor -l=$(LOG_LEVEL)
omnibus: install clean
	bin/omnibus build apitools-monitor -l=$(LOG_LEVEL)

clean-ccache:
	sudo rm -rf $(HOME)/.ccache

install: clean-ccache
	bundle install

login:
	echo "Run: cd apitools-monitor && make"
