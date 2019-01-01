IMAGE_NAME:=batmat/clamscan

build:
	docker build -t ${IMAGE_NAME} .
