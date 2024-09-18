import time

def snowflake_algo(machine_id, sequence, last_timestamp):
    timestamp = int(time.time() * 1000)
    if timestamp == last_timestamp:
        sequence = (sequence + 1) & 0xFFF #12 bits for sequence

    else:
        sequence = 0

    last_timestamp = timestamp
    unique_id = ((timestamp << 22) | (machine_id << 12) | sequence)

    return unique_id, last_timestamp, sequence