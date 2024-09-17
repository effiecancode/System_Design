# Design a rate limiter

* In a network system, a rate limiter is used to control the rate of traffic sent by a client or a service.
* In the HTTP world, a rate limiter limits the number of client requests allowed to be sent over a specified period. If the API request count exceeds the threshold defined by the rate limiter, all the excess calls are blocked

## Where to put the rate limiter?
Intuitively, you can implement a rate limiter at either the client or server-side.
• Client-side implementation. Generally speaking, client is an unreliable place to enforce rate limiting because client requests can easily be forged by malicious actors. Moreover, we might not have control over the client implementation.
• Server-side implementation. Figure 4-1 shows a rate limiter that is placed on the server- side.

