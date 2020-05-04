# wiremock-example

Example of using a custom wiremock-body-transformer extension.

To run the mock:
```
docker run -it --rm -p 8080:8080 mihaitatinta/wiremock-example
```

The API contains 3 endpoints:
* POST /login
  Generates a JWT with the subject value from the header: `username`

```shell script
curl -X POST \
  http://localhost:8080/login \
  -H 'Accept: */*' \
  -H 'Accept-Encoding: gzip, deflate' \
  -H 'Cache-Control: no-cache' \
  -H 'Connection: keep-alive' \
  -H 'Content-Length: 0' \
  -H 'Content-Type: application/json' \
  -H 'Host: localhost:8080' \
  -H 'Postman-Token: baf628fc-9b3c-42de-94d9-1ab4eaa55d9a,650668fa-cf0c-49df-97da-a65233fef55d' \
  -H 'User-Agent: PostmanRuntime/7.19.0' \
  -H 'cache-control: no-cache' \
  -H 'username: ionescu'
```
Response:
```json
{
  "token": "eyJhbGciOiJSUzI1NiJ9.eyJleHAiOjE1ODg1Nzc2NzYsImp0aSI6IlhPT2VRVEdMVVVZZVdxbGNzcm9UZFEiLCJpYXQiOjE1ODg1NzcwNzYsIm5iZiI6MTU4ODU3Njk1Niwic3ViIjoiaW9uZXNjdSJ9.ISk-Nf0S6i0FAcUuAk-GSZjvsQadSYBZ45ur4O3CEJeMfZwVxyKM8KyxyGnk-En0_dpFPZkTZ3EA27c9XI-WqK1MRp_mteqStAhIlmPjrS3FY_DmdL5tl75BroovE8lKRmm_-a7b38n9OXkj0f8Or_QC2ireyvI4twNa8sHNUS7CBxPh9BbWK--3mXG0gVTQObdgFlW8lowaF_rIr7AfHRVWfwudn1Hig8yYK-xAzpbPxoKwi2Fi_ffj1SJlRDIxUON50rnBpBZv1tlXgo2ePaR7JIZOLd-eCEaYHTmlGtafwfX8hI7TcTUK8ZItQ487NCAf5IvRDaiPgI1WmaDJ5Q"
}
```

* GET /accounts
    Returns all the associated accounts for the current user
```shell script
curl -X GET \
  http://localhost:8080/accounts \
  -H 'Accept: */*' \
  -H 'Accept-Encoding: gzip, deflate' \
  -H 'Cache-Control: no-cache' \
  -H 'Connection: keep-alive' \
  -H 'Content-Type: application/json' \
  -H 'Host: localhost:8080' \
  -H 'Postman-Token: b887299a-c58d-4619-aef7-3231089f09a5,40d0d01f-8cd0-4bad-b96d-71eba6b513b4' \
  -H 'User-Agent: PostmanRuntime/7.19.0' \
  -H 'X-AUTH: eyJhbGciOiJSUzI1NiJ9.eyJleHAiOjE1ODg1NzgwODAsImp0aSI6ImVDNVJ2YVdlRFI0M1ZyY21TN3dJX3ciLCJpYXQiOjE1ODg1Nzc0ODAsIm5iZiI6MTU4ODU3NzM2MCwic3ViIjoiaW9uZXNjdSJ9.NUsoC7S7WbyZJum8pjgEopYv2XUU_hfuxdTfKNl8Bqh82DwIep4GdCUISaH4W4054CBZIjELehhAbEVc2PrcPpLDybOHDTNf6wAiukXI4G_y_dXThhZ_CVka5qwKwf9-yL6hfH7K89TjAckoU_HVYJsdUP8sTYd_V0y_Ush0wgm85VzuigezmGzMjbeYotz3c9yxrKm2JhxnWQo-0VnC5Baj3PEAUeDR_0IqLYFHE7_n7Gdozof3Ecd7o1qnyAKmyVhSdnutraLhUKMqneHxGEishRvIefMeByaLpLxxjzFY4PEr-HVx9Tf_x8FXEscUxj7bljJvebZxAikHZQtmlA' \
  -H 'cache-control: no-cache'
```
Response:
```json
[
  {
    "id": "698c5104-c80c-4a1a-84d0-c4d70d4f6238",
    "update": "2020-05-04T07:33:09.001+0000",
    "name": "Account-ionescu",
    "product": "Gold account.",
    "status": "ENABLED",
    "type": "CREDIT_CARD",
    "balance": 9107.935799901432
  }
]
```

* GET /transactions

```shell script
curl -X GET \
  http://localhost:8080/transactions \
  -H 'Accept: */*' \
  -H 'Accept-Encoding: gzip, deflate' \
  -H 'Cache-Control: no-cache' \
  -H 'Connection: keep-alive' \
  -H 'Content-Type: application/json' \
  -H 'Host: localhost:8080' \
  -H 'Postman-Token: 2074a151-2443-4533-ac12-6cbc12b2383b,8cb4bea5-5b77-4120-8ba4-8f74686fdb89' \
  -H 'User-Agent: PostmanRuntime/7.19.0' \
  -H 'X-AUTH: eyJhbGciOiJSUzI1NiJ9.eyJleHAiOjE1ODg1Nzk2MDYsImp0aSI6IllqeVhxdG0wRGdmVFVrYk1DZDhMLWciLCJpYXQiOjE1ODg1NzkwMDYsIm5iZiI6MTU4ODU3ODg4Niwic3ViIjoiaW9uZXNjdXNzIn0.F3SseLsaG1ndLPXrN45e_3LOlTSIcTXuIUkWSo0rFmMrGhti6uCYd1ATV_ud98dUkPSdne1zVamL5yonUu-3Wx7fDlr16rYp8P3GIH4Y6hIskNvNvF1bYEY6CQPWtu-qfX6uvCo3HgD2VBLqOS_PqWkLG2FfYl6zpXn9qNRbHDtGmv9H4qLMizxtkdElkX4A9xC0WMbya1JjJcRIMt44eyQzudR6DyKRQTpAEyEnv7OkgmPAO86YKrFEmcDlxPMGwUXur7BJ0ih7Nmrla0NfsQeekrwhOg_jQ9VWHMllqjM5HuwkyhdG9RoEf1ppwxBn2Yo4a3yPPMXPzs0owE9p4w' \
  -H 'cache-control: no-cache'
```

Response:

```json
[
      {
            "id": "53b4d20f-a32e-4e6b-a71e-fc62ace8c910",
            "accountId": "a7065dce-6a18-428a-901d-cca14740af16",
            "exchangeRate": {
                  "currencyFrom": "EUR",
                  "currencyTo": "USD",
                  "rate": 1.1
            },
            "originalAmount": {
                  "amount": 106.17285630918292,
                  "currency": "USD"
            },
            "creditor": {
                  "maskedPan": "XXXXXXXXXX1230",
                  "name": "Creditor 1230"
            },
            "debtor": {
                  "maskedPan": "XXXXXXXXXX9870",
                  "name": "DebtorName 9870"
            },
            "status": "BOOKED",
            "currency": "EUR",
            "amount": 96.52077846289356,
            "update": "2020-05-04T07:57:02.719+0000",
            "description": "Mc Donalds Amsterdam transaction - 0"
      }
]
```

## Build
If you want to make any changes you can build your own version:

```shell script
docker build . -t mihaitatinta/wiremock-example
```
Instead of creating many images you can better attach the volume to your container:

```shell script
docker run -it --rm -p 8080:8080 -v $PWD/wiremock:/home/wiremock:ro -w /home/wiremock mihaitatinta/wiremock-example
```
To publish the image just run;
```shell script
docker push mihaitatinta/wiremock-example
```