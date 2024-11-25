# Define paths
PROTOC = protoc
PROTO_DIR = proto
GEN_DIR = ./gen/go

# Define proto files
PROTO_FILES = $(shell find $(PROTO_DIR) -name "*.proto")

# Define commands for generation
GO_OUT_FLAGS = --go_out=$(GEN_DIR) --go_opt=paths=source_relative
GRPC_OUT_FLAGS = --go-grpc_out=$(GEN_DIR) --go-grpc_opt=paths=source_relative

# Default target
all: generate

# Generate gRPC and Go files
generate:
	@mkdir -p $(GEN_DIR)
	$(PROTOC) -I $(PROTO_DIR) $(PROTO_FILES) $(GO_OUT_FLAGS) $(GRPC_OUT_FLAGS)

# Clean generated files
clean:
	@rm -rf $(GEN_DIR)

# Help target
help:
	@echo "Available targets:"
	@echo "  generate   - Generate Go and gRPC files from .proto"
	@echo "  clean      - Remove generated files"
	@echo "  help       - Show this help message"

.PHONY: all generate clean help
