install:
	swift build -c release
	install .build/release/publish-cli /opt/bin/publish
