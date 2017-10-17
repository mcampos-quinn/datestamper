# datestamper

Super simple bash script to add a datestamp to a directory of image files. I'm sure it exists elsewhere but someone at work asked for it so here it is.

It uses `exiftool` to look for either:
* Date/Time Original
* Create Date
--or if neither of those exist--
* Any other metadata tag that has 'Date' in it


Then it uses `montage` to add a pixel-height-proportional banner to the bottom of the image that has the `exiftool` output in it.

The output then gets saved to a new `out/` directory.

Here's an example:

![](GegenNazis.png)

It requires [`exiftool`](https://www.sno.phy.queensu.ca/~phil/exiftool/) and [`imagemagick`](https://www.imagemagick.org/script/index.php) to run.

To run it: `bash /path/to/datestamper.sh /path/to/directory/of/images`
