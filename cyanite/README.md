Prerequisite
============
- Running mbrannigan/cyanite:0.1.0 named cass01

Building
========
    sudo docker build --tag="mbrannigan/cyanite:0.1.0" .

Running
=======
    sudo docker run -d -p 2003:2003 --name="cyanite01" --link cass01:cass01 mbrannigan/cyanite:0.1.0 
