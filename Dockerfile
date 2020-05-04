FROM rodolpheche/wiremock


COPY extensions/ /var/wiremock/extensions/
COPY wiremock/ /home/wiremock

CMD ["--extensions", "com.opentable.extension.BodyTransformer,com.opentable.extension.ThymeleafBodyTransformer"]

#docker build . -t mihaitatinta/wiremock-example
#docker run -it --rm -p 8080:8080 mihaitatinta/wiremock-example
#docker run -it --rm -p 8080:8080 -v $PWD/wiremock:/home/wiremock:ro -w /home/wiremock mihaitatinta/wiremock-example
#docker push mihaitatinta/wiremock-example
