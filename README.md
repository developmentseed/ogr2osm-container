# ogr2osm in a container
Container for running [ogr2osm](https://github.com/pnorman/ogr2osm) in an OS agnostic environment. ogr2osm is a tool for converting geospatial data in a format [supported by ogr](http://gdal.org/1.11/ogr/ogr_formats.html) into OSM format.

## Setup

1. [Install Docker](https://docs.docker.com/install)
2. Clone or [download and unzip](https://github.com/developmentseed/ogr2osm-container/archive/master.zip) this repository.
3. In the command line, go to unzipped folder root of the repository, build the Docker container:  
`docker build -t ogr2osm .`

## Processing data
After the initial setup, you can convert data by following these steps:

1. Place the input data in the folder of the repository (likely to be called `ogr2osm-container`)
2. Run the following command, substituting `[inputdata]` for the file that contains the source data, and `[output.osm]` with the desired filename of the osm data:  
`docker run -it --rm -v $(pwd):/data rra-osm python ogr2osm.py /data/[inputdata] -o /data/[output.osm]`  
for example:  
`docker run -it --rm -v $(pwd):/data rra-osm python ogr2osm.py /data/roads_senegal.shp -o /data/roads-sen.osm`  

This command will run ogr2osm with the default settings, but you can pass [https://github.com/pnorman/ogr2osm#usage]()
