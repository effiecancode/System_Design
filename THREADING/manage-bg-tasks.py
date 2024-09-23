import threading
import time

class BackgroundTask(threading.Thread):
    def __init__(self, name):
        threading.Thread.__init__(self)
        self.name = name

    def run(self):
        print(f"{self.name} started")
        time.sleep(2)
        print(f"{self.name} finished")

# create & start bg tasks
task1 = BackgroundTask("Task 1")
task2 = BackgroundTask("Task 2")
task3 = BackgroundTask("Task 3")

# wait for tasks to comlete
task1.join()
task2.join()
task3.join()

print("All bg tasks completed")

# this code creates and manages background tasks using threads