dockerfiles-centos-myfirefox
============================

CentOS 7 dockerfile for a discardable/expandable firefox writing as non-root user on the monted volume

You need to adapt the run.sh file to match you user id/gid.
mkdir -p ~/docker/myfirefox # for the permanent storage space

To build:

    # docker build --rm -t truhuynh/myfirefox:centos7 .

Run the firefox browser inside docker with a permanent storage (in this case ~/docker/myfirefox)
~/docker/myfirefox will be mapped to /home/centos inside the container, and will provide the permanent storage for firefox.

    # docker run --rm -t --memory 512mb --net host  -e DISPLAY=$DISPLAY -v /dev/dri:/dev/dri -v /dev/shm:/dev/shm -v /dev/snd:/dev/snd -v -v ~/docker/myfirefox:/home/centos --privileged  truhuynh/myfirefox:centos7 

Run a pristine firefox browser inside docker, without any previous configuration:

    # docker run --rm -t --memory 512mb --net host  -e DISPLAY=$DISPLAY -v /dev/dri:/dev/dri -v /dev/shm:/dev/shm -v /dev/snd:/dev/snd --privileged  truhuynh/myfirefox:centos7 

based on https://blog.jessfraz.com/posts/docker-containers-on-the-desktop.html


Display issue: 
1) [tru@home ~]$ docker run -t truhuynh/myfirefox:centos7
[1:1:0417/130908:ERROR:browser_main_loop.cc(171)] Running without the SUID sandbox! See https://code.google.com/p/chromium/wiki/LinuxSUIDSandboxDevelopment for more information on developing with the sandbox on.
[1:1:0417/130908:ERROR:browser_main_loop.cc(217)] Gtk: cannot open display

Please use/adapt the provided scripts at https://github.com/truatpasteurdotfr/myfirefox:
myfirefox-in-docker+keep-settings.sh and myfirefox-in-docker.sh 


