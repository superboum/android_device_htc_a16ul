# HTC DESIRE 530

Trying to port the HTC Desire 530 to Lineage OS.
Nothing has been tested for now, use this repository with EXTREME care.

## flex is too old

```
loadlocale.c:130: _nl_intern_locale_data: Assertion `cnt < (sizeof (_nl_value_type_LC_TIME) / sizeof (_nl_value_type_LC_TIME[0]))' failed.
```

can be fixed by:

```
LC_ALL=C make -j4 xxx
```

https://github.com/sonyxperiadev/bug_tracker/issues/136


## python2 is required by tools and Fedora 32 uses python3 by default

```
sudo ln -s /usr/bin/python2 /usr/local/bin/python3
```

## javac: file not found: xxxxx

```
javac: file not found: /home/quentin/Documents/htc_desire_530/lineage/out/target/common/obj/APPS/org.cyanogenmod.platform-res_intermediates/src/cyanogenmod/platform/Manifest.java
Usage: javac <options> <source files>
use -help for a list of possible options
```

Cyanogen/LineageOS require many threads to compile, check that you have set `-j 4` for example:

```
make -j4
```
