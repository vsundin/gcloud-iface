IMAGE:=gcloud-iface
TAG:=$(shell git describe --always --dirty) 

default: build

build:
	docker build -t $(IMAGE):$(TAG) .

run:
	docker volume create $(IMAGE)-root-volume || true
	#docker run -v $(IMAGE)-root-volume:/root -it $(IMAGE):$(TAG)
	docker run -it $(IMAGE):$(TAG)
