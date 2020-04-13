# HTC DESIRE 530


## STEPS

```
source build/envsetup.sh
make clean
mkdir -p out/target/product/a16ul/obj/KERNEL_OBJ/usr
export ANDROID_JACK_VM_ARGS="-Dfile.encoding=UTF-8 -XX:+TieredCompilation -Xmx4G"
export JAVA_HOME=/usr/lib/jvm/java/
add_lunch_combo cm_a16ul-eng
lunch
LC_ALL=C make -j8 otatools
LC_ALL=C make -j8 all
```

## Stuff

Trying to port the HTC Desire 530 to Lineage OS.
Nothing has been tested for now, use this repository with EXTREME care.


Configure JACK:

```
export ANDROID_JACK_VM_ARGS="-Dfile.encoding=UTF-8 -XX:+TieredCompilation -Xmx4G"
```

add combo to lunch:

```
add_lunch_combo cm_a16ul-eng
lunch
```


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

## JAVA\_HOME

JAVA\_HOME is not set correctly...

```
export JAVA_HOME=/usr/lib/jvm/java/
```

## make: \*\*\* No rule to make target

```
mkdir -p out/target/product/a16ul/obj/KERNEL_OBJ/usr
```

FIXME: should be fixed in a more elegant way.
Info :
  - https://bbs.archlinux.org/viewtopic.php?id=147928
  - https://blog.csdn.net/ztguang/article/details/52875059
  - https://forum.xda-developers.com/android/help/problem-compiling-generic-cyanogenmod-t3318017

## Fix curl `--no-proxy` error

```
curl: option --no-proxy: used '--no-' for option that isn't a boolean
curl: try 'curl --help' or 'curl --manual' for more information
```

To fix, please do:

```
croot
cd ./prebuilts/sdk/tools
git apply ../../../device/htc/a16ul/fix_curl.patch
croot
make jack
```

If everything went well, you should find `--noproxy` instead of `--no-proxy` in this file:

```
./out/host/linux-x86/bin/jack
./out/host/linux-x86/bin/jack-admin
```
