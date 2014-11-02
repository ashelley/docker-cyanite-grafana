Cyanite / Graphite-API / Grafana
================================
Sets up various containers to provide a means of storing metrics via graphite into a cassandra instance via cyanite.

This uses cyanite, developed by Pierre-Yves Ritschard and graphite-cyanite/graphite-api developed by Bruno Renié

Description Of The Components
-----------------------------
- [cyanite] - cassandra backed carbon daemon and metric web service
- [graphite-cyanite] - A plugin for using graphite-web with the cassandra-based Cyanite storage backend
- [graphite-api] - Graphite-web, without the interface. Just the rendering HTTP API
- [grafana] - An open source, feature rich metrics dashboard and graph editor 
- [cassandra] - open source distributed database management system designed to handle large amounts of data across many commodity servers, providing high availability with no single point of failure. Used by cyanite to store the graphite data instead of the traditional graphite whisper files.

Building The Docker Containers
==============================
To build out the project, run the following
    sudo -s
    ./build.sh

Usage
=====
The grafana dashboard is available at http://localhost

Write metrics via graphite at localhost:2003

Run ./test.sh to generate some test metrics - 1 minute load average

[cyanite]: https://github.com/pyr/cyanite
[graphite-cyanite]: https://github.com/brutasse/graphite-cyanite
[graphite-api]: https://github.com/brutasse/graphite-api
[grafana]: http://grafana.org/
[cassandra]: http://cassandra.apache.org/
