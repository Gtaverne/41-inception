We're just starting

docker run -p 80:80 -v $PWD/srcs/:/var/www/html/ hello-weurd

Pour construire une image
docker build --rm -t lenomdelimage .
docker run 