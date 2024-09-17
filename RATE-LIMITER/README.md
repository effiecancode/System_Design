# Design a rate limiter

* In a network system, a rate limiter is used to control the rate of traffic sent by a client or a service.
* In the HTTP world, a rate limiter limits the number of client requests allowed to be sent over a specified period. If the API request count exceeds the threshold defined by the rate limiter, all the excess calls are blocked

## Where to put the rate limiter?
Intuitively, you can implement a rate limiter at either the client or server-side.
• Client-side implementation. Generally speaking, client is an unreliable place to enforce rate limiting because client requests can easily be forged by malicious actors. Moreover, we might not have control over the client implementation.
• Server-side implementation. Figure 4-1 shows a rate limiter that is placed on the server- side.

## Algorithms for rate limiting
Rate limiting can be implemented using different algorithms, and each of them has distinct pros and cons. Even though this chapter does not focus on algorithms, understanding them at high-level helps to choose the right algorithm or combination of algorithms to fit our use cases. Here is a list of popular algorithms:
• Token bucket - most used
• Leaking bucket
• Fixed window counter • Sliding window log
• Sliding window counter


