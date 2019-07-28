GOARCH=wasm
GOOS=js
GOPATH=$(CURDIR)/../..
TOOLS=$(GOPATH)/bin

BUILDDIR=build

STATICDIR=static
WASMDIR=$(STATICDIR)/wasm
JSDIR=$(STATICDIR)/js

GOROOT=$(shell go env GOROOT)

statics: main.wasm
	if test ! -d $(JSDIR); then  mkdir -p $(JSDIR); fi
	cp $(GOROOT)/misc/wasm/wasm_exec.js $(JSDIR)
	if test ! -d $(WASMDIR); then  mkdir -p $(WASMDIR); fi
	cp $(BUILDDIR)/main.wasm $(WASMDIR)

main.wasm: main.go
	if test ! -d $(BUILDDIR); then  mkdir -p $(BUILDDIR); fi
	$(TOOLS)/dep ensure
	go build -o $(BUILDDIR)/main.wasm main.go
