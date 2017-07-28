def fact(x):
    z = 1
    for y in range(1, x + 1):
        z = z * y
    return (z)
def factrec(x):
    if (x == 1):
        return (1)
    return (x * factrec(x - 1))
def hello(name):
    print("Hello " + name)
print(factrec(10))

