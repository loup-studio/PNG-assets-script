# PNG assets script for Android

Simple script to organize automatically assets for different screen densities

## Android project structure

```
project/
  app/
    src/main/res
  assets/
    png/
    svg/
    create_png.sh
```


## Workflow

**1. Assets from designer**

The designer exports png assets from sketch in 4 sizes:

* x1 (drawable-mdpi)
* x1,5 (drawable-hdpi)
* x2 (drawable-xhdpi)
* x3 (drawable-xxhdpi)
* x4 (drawable-xxxhdpi)

The assets will be in a unique folder with flat hierarchy. The png files are named in the following format:

```
my_image_1@1x.png
my_image_1@1,5x.png
my_image_1@2x.png
my_image_1@3x.png
my_image_1@4x.png
my_image_2@1x.png
my_image_2@1,5x.png
my_image_2@2x.png
my_image_2@3x.png
my_image_2@4x.png
etc
```

**2. Convert to android drawable-xxx structure**

1. Move these assets to `assets/png/`.
2. Run `create_png.sh`
3. Done
