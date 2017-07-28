import time
lower = int(input("Enter lower range: "))
upper = int(input("Enter upper range: "))
def prime(lower, upper):
    primes = []
    for num in range(lower, upper + 1):
        # prime numbers are greater than 1
        if num > 1:
            for i in range(2,num):
                if (num % i) == 0:
                    break
            else:
                #print(num)
                primes.append(num)

    for i in primes:
        time.sleep(0.5)
        print(i)
    time.sleep(0.5)
    return primes
print(prime(lower, upper))