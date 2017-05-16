dockerfiles-fedora-httpd
========================

Red Hat Enterprise Linux dockerfile for httpd

Tested on Docker 0.10.0-dev

Get Docker version

```
# docker version
```

To build:
In your working local directory:
```
# docker build -t rhel1 .
```

To run:
Here we create a volume /vol that maps to our host directory
```
# docker run -it -v /Users/polmyles/openSCAP_logs:/vol rhel1
```

To view logs:
Move oval-report.html to /vol so it appears in our local directory as well
```
# mv oval-report.html /vol
```
Now you can navigate to your local directory and view the .html file that was created

