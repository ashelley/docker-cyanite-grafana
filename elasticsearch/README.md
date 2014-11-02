Build
=====
    sudo docker build --tag="mbrannigan/elasticsearch:0.1.0" .

Run
===
    sudo docker run -d -p 9200:9200 -p 9300:9300 --name='es01' mbrannigan/elasticsearch:0.1.0
