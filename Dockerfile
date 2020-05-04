FROM rodolpheche/wiremock


COPY extensions/ /var/wiremock/extensions/
COPY wiremock/ /home/wiremock

CMD ["--extensions", "com.opentable.extension.BodyTransformer,com.opentable.extension.ThymeleafBodyTransformer"]
