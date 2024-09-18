# Designing a unique ID generator in distributed systems

# [Project Link](https://github.com/effiecancode/CRM-backend)

* Requires ensuring that IDs are globally unique, efficient to generate, and scalable without creating bottlenecks

## Choosing the ID generator

### UUID
* Is a 128 bits, highly unique ID generator that does not require co-ordination between nodes
* It's cons include it being relaitvely large.
  * Lacks sequence - which can be inefficient for indexing in the database

### Snawflake Algorithm
* Is 64 bits, based on time, machine ID and sequence numbers.
* 41 bits for timesatmp, 10 bits for machine ID and 12 bits for sequence numbers

* It's cons include: requires coordination for assigning machine IDs
    * Relies on system clock for accuracy

### Database autoincreament with sharding
* Use multiple database shards, each with an auto-increment strategy, with different increments or starting points.

* Main cons : Does not scale and relys on the database.

### Considerations for Choosing the Right Approach:

* Performance: How fast do you need to generate IDs?
* Scale: How many systems/nodes will be generating IDs?
* Coordination: How decentralized does the system need to be?
* Size: What is the acceptable size for the IDs?

* For most distributed systems, Snowflake is a well-balanced solution that provides both efficiency and uniqueness without heavy coordination. However, if simplicity and independence are key, UUIDs can be a better option.

