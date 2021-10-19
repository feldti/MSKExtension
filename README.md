# MSKExtension
Extensions to base classes of Gemstone/S. The areas of extension is DateAndTime (RFC3339), logging via GsFile and convenience methods for directory handling, support for curl, zip ad 7z files, Encoding checks and encoding conversions

## Installation

You can load MSKExtension using Metacello

```Smalltalk
Metacello new
  repository: 'github://feldti/MSKExtension:main/repository';
  baseline: 'MSKExtension';
  load
```
