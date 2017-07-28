import time
times = 1
for i in range(100000000000):
    print(str(times) + ". " + str(time.time()))
    time.sleep(0.01)
    times = times + 1