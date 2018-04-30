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
`docker run -it --rm -v $(pwd):/data ogr2osm python ogr2osm.py /data/[inputdata] -o /data/[output.osm]`
for example:  
`docker run -it --rm -v $(pwd):/data ogr2osm python ogr2osm.py /data/roads_senegal.shp -o /data/roads-sen.osm`

This command will run ogr2osm with the default settings, but you can pass [https://github.com/pnorman/ogr2osm#usage]()

## Troubleshooting

### No matching manifest
`no matching manifest for windows/amd64 in the manifest list`

If you get this message while building on Windows, make sure that you are using [Linux Containers](https://docs.docker.com/docker-for-windows/#switch-between-windows-and-linux-containers) and run the `docker build -t ogr2osm .` again.

### Invalid characters for a local volume name
`docker: Error response from daemon: create ${pwd}: "${pwd}" includes invalid characters for a local volume name`

You are likely running this in Command Prompt on Windows. If you have Windows 10, consider using Powershell instead and run the same command again.

To fix this in Command Prompt, substitute `${pwd}` for the full path of the folder you are in. For example:  
`docker run -it --rm -v C:\Users\John\ogr2osm-container:/data ogr2osm python ogr2osm.py /data/roads_senegal.shp -o /data/roads-sen.osm`