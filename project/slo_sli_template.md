# API Service

| Category     | SLI | SLO                                                                                                         |
|--------------|-----|-------------------------------------------------------------------------------------------------------------|
| Availability |     | 99%                                                                                                         |
| Latency      |     | 90% of requests below 100ms                                                                                 |
| Error Budget |     | Error budget is defined at 20%. This means that 20% of the requests can fail and still be within the budget |
| Throughput   |     | 5 RPS indicates the application is functioning                                                              |


Solution:

| Category     | SLI                                                                | SLO                                                                                    
|--------------|--------------------------------------------------------------------|----------------------------------------------------------------------------------------
| Availability | requests whose response is 200/total requests *100 = 99%           |  99%
| Latency      | response time for requests below 100 ms/all response time*100= 90% | 90% of requests below 100m                                                             
| Error Budget | 80% of all queries have successful 200 response                    | Error budget is defined at 20%. This means that 20% of the requests can fail and still                  																	   be within the budget 
| Throughput   | rate of queries returned 200 ok                                    | 5 RPS indicates the application is functioning

