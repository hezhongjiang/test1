
.PHONY: sso
sso:
	docker build -f Dockerfile -t harbor1.zlibs.com/island/sso:alpha .
	docker push harbor1.zlibs.com/island/sso:alpha