devenv: testingsum
		packer build -only=devenv -var-file=variables.json -var 'testing_chksum=$(testingsum)' box.json; \
				case "$$?" in \
				0) \
				echo "Image successfully created, continue..." \
				;; \
				1) \
				echo "Image already present, continue..." \
				;; \
				*) \
				echo "Unhandled error" \
				;; \
				esac;

testingsum: testing
		$(eval testingsum := $(shell sha512sum packer_output/testing/debian_testing.qcow2 | cut -d ' ' -f 1))

testing: bustersum
		packer build -only=testing -var-file=variables.json -var 'buster_chksum=$(bustersum)' debian.json; \
				case "$$?" in \
				0) \
				echo "Image successfully created, continue..." \
				;; \
				1) \
				echo "Image already present, continue..." \
				;; \
				*) \
				echo "Unhandled error" \
				;; \
				esac;

gitsrv: bustersum
		packer build -only=gitsrv -var-file=variables.json -var 'buster_chksum=$(bustersum)' debian.json; \
				case "$$?" in \
				0) \
				echo "Image successfully created, continue..." \
				;; \
				1) \
				echo "Image already present, continue..." \
				;; \
				*) \
				echo "Unhandled error" \
				;; \
				esac;

bustersum: buster
		$(eval bustersum := $(shell sha512sum packer_output/buster/debian_buster.qcow2 | cut -d ' ' -f 1))

buster: debian.json
		packer build -only=buster -var-file=variables.json debian.json; \
				case "$$?" in \
				0) \
				echo "Image successfully created, continue..." \
				;; \
				1) \
				echo "Image already present, continue..." \
				;; \
				*) \
				echo "Unhandled error" \
				;; \
				esac;

clean:
		rm -rf packer_output/devenv*
		rm -rf packer_output/gitsrv*
		rm -f packer_output/boxes/*.box

wipe:
		rm -rf packer_output/testing*
		rm -rf packer_output/devenv*
		rm -rf packer_output/gitsrv*
		rm -f packer_output/boxes/*.box

purge:
		rm -rf packer_output/*
