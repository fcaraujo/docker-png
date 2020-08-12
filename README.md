# Docker - Prometheus and Grafana

This project is an example and study case of a Dockerized solution to use Prometheus and Grafana.
Taking the opportunity we're gonna use 3Musketeers methodology and other prometheus exporters to explore some possibilities.
It's inspired on several existing examples so feel free to contribute or use them as well. 

## Dependencies
More details soon... docker and make commands though;

## TODO list:
- Tomcat container:
  - Find a way to build the image in a idempotent way leveraging on docker cache;
  - Add tomcat-build as dependency on `make up` command;
  - Improve build script splitting into small scripts and call them on docker file;
  - Use a fallback strategy to copy config file contents if cUrl doesn't work;
  - Change script to leverage on environment variables;
- Change Linting script to all docker files;
- Improve dot-env usage;
- ...