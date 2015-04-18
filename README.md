# docker-nxlog

## How to use this image

#### Create nxlog.conf
Since no two users of NXLOG are likely to configure it exactly a like, this image does not come with any default configuration.

Please refer to the [the CE Reference Manual on](http://nxlog-ce.sourceforge.net/nxlog-docs/en/nxlog-reference-manual.html) the subject of configuring NXLOG for your needs.

#### Build and Run the Image

Create a `Dockerfile`:

	FROM jonbrouse/nxlog
	COPY nxlog.conf /etc/nxlog/
	
Build and run:

	docker build -t nxlog-client .
	docker run -d --name my-running-nxlog-client nxlog-client

### Notes

#### The Client Binaries
The client binaries are stored in nxlog-client.tar.gz which is contained in this repo. When I have used this build I normally host it in a private S3 bucket and curl it down during a ```RUN``` action.

