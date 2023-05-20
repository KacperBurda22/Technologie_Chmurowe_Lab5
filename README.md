Polecenie do budowania obrazu: 
docker build --build-arg VERSION=1.0 -f <Dockerfile> -t <nazwa_obrazu>:<wersja> .

Polecenie do wlaczenia serwera: 
docker run -p 80:80 nazwa_obrazu>:<wersja>

Polecenie potweirdzajace dzialanie kontenera: 
docker ps

Polecenie potwierdzajace dzialanie zbudowanej aplikacji : 
docker exec <nazwa_kontenera> curl http://localhost