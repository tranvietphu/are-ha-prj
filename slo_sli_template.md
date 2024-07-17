# API Service

| Category     | SLI | SLO                                                                                                         |
|--------------|-----|-------------------------------------------------------------------------------------------------------------|
| Availability |successful HTTP requests/total HTTP requests | 99%                                                                                                         |
| Latency      |latency of HTTP requests| 90% of requests below 100ms                                                                                 |
| Error Budget |unsuccessful HTTP requests/total HTTP requests | Error budget is defined at 20%. This means that 20% of the requests can fail and still be within the budget |
| Throughput   |successful HTTP requests per second| 5 RPS indicates the application is functioning                                                              |
