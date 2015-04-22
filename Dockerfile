FROM centos:centos7
MAINTAINER Tru Huynh <tru@pasteur.fr>
#
# purpose: running a discardable/expandable firefox on CentOS-7 as non root user
#
# build with:
# $ docker build --rm -t truhuynh/myfirefox:centos7 .
#
# run without permanent volume storage:
# $ SOCK=/tmp/.X11-unix
# $ XAUTH=`mktemp`
# $ xauth nlist ${DISPLAY}| sed -e 's/^..../ffff/' | xauth -f $XAUTH nmerge -
# $ docker run -t \
#    --net host \
#    --memory 512mb \
# -v $XSOCK:$XSOCK \
# -v $XAUTH:$XAUTH \
# -v /dev/dri:/dev/dri -v /dev/shm:/dev/shm \
# -v /dev/snd:/dev/snd \
# -e XAUTHORITY=$XAUTH \
# -e DISPLAY=$DISPLAY \
# --privileged \
# truhuynh/myfirefox:centos7
#
# the permanent storage is mounted at ~/docker/myfirefox
# you only need to match the uid/gid in the run.sh file
# and to add to the previous lines:
#  -v ~/docker/myfirefox:/home/centos

RUN yum -y update; yum clean all
RUN yum -y install mesa-dri-drivers libexif libcanberra-gtk2 libcanberra firefox; yum clean all

# adapt this run.sh script to match your uid/gid
COPY run.sh /run.sh
CMD ["/run.sh"]

