#### Install Astrometry.net on CentOS 7 mini

##### 1. Prerequisites
```
# yum update
# yum upgrade
# yum install yum-utils
# yum clean all
# yum groupinstall development
# yum -y install cairo \
                 netpbm \
                 netpbm-progs \
                 libpng \
                 libpng-devel \
                 libjpeg \
                 libjpeg-devel \
                 numpy \
                 cairo-devel \
                 fontconfig-devel \
                 libXrender-devel \
                 xorg-x11-proto-devel \
                 zlib-devel \
                 python-devel
```

##### 2. Install FITS IO software, [fitsio][0] or [astropy][1] or [pyfits][2], below is `pyfits`
```
# cd /tmp
# wget https://github.com/spacetelescope/PyFITS/archive/3.5.tar.gz
# tar zxvf 3.5.tar.gz
# cd PyFITS-3.5
# python setup.py install
# cd ..
```

##### 3. Install `cfitsio`
```
# wget http://heasarc.gsfc.nasa.gov/FTP/software/fitsio/c/cfitsio3430.tar.gz
# tar zxvf cfitsio3430.tar.gz
# cd cfitsio
# ./configure --prefix=/usr
# make
# make install
# ln -s /usr/lib/pkgconfig/cfitsio.pc /usr/lib64/pkgconfig/cfitsio.pc
# cd ..
```

##### 4. Install `astrometry.net`
```
# wget http://astrometry.net/downloads/astrometry.net-latest.tar.gz
# tar zxvf astrometry.net-latest.tar.gz
# mv astrometry.net-0.73/ astrometry.net
# cd astrometry.net/util/
```
Edit 'makefile.netpbm'
```
# vi makefile.netpbm
```
> NETPBM_INC ?= -I/usr/include/netpbm   
> NETPBM_LIB ?= -L/usr/lib64 -lnetpbm

```
# cd ..
# make
# make py
# make extra
# make install
```

##### 5. Downloads `index files`, either the [wide-angle][3] or the more [detailed index][4] files.

##### 6. Place the index files in `/usr/local/astrometry/data/`

##### 7. Enjoy :)

PS:　Base on [this guide][5].

[0]:https://github.com/esheldon/fitsio
[1]:http://www.astropy.org/
[2]:https://github.com/spacetelescope/PyFITS/releases
[3]:http://data.astrometry.net/4100/
[4]:http://data.astrometry.net/4200/
[5]:http://plaidhat.com/code/astrometry.php
