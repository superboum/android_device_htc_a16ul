# HTC DESIRE 530

Trying to port the HTC Desire 530 to Lineage OS.
Nothing has been tested for now, use this repository with EXTREME care.

## flex is too old

```
loadlocale.c:130: _nl_intern_locale_data: Assertion `cnt < (sizeof (_nl_value_type_LC_TIME) / sizeof (_nl_value_type_LC_TIME[0]))' failed.
```

can be fixed by:

```
LC_ALL=C make
```

https://github.com/sonyxperiadev/bug_tracker/issues/136
