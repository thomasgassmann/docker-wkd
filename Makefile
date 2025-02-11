build:
	podman build --build-arg domain=$(DOMAIN) -t wkd .

run: build
	podman run --network host -d -it --rm --name wkd wkd

stop:
	podman stop wkd
