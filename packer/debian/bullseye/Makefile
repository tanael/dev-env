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

testing: bullseyesum
		packer build -only=testing -var-file=variables.json -var 'bullseye_chksum=$(bullseyesum)' debian.json; \
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

gitsrv: bullseyesum
		packer build -only=gitsrv -var-file=variables.json -var 'bullseye_chksum=$(bullseyesum)' debian.json; \
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

bullseyesum: bullseye
		$(eval bullseyesum := $(shell sha512sum packer_output/bullseye/debian_bullseye.qcow2 | cut -d ' ' -f 1))

bullseye: debian.json
		packer build -only=bullseye -var-file=variables.json debian.json; \
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
