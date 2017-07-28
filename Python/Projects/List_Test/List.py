x = [2, 4, 6, 8]
print(x)
y = ["jan", "feb", "mar", "apr", "may", "jun", "jul", "aug", "sep", "oct", "nov", "dec"]
print(y)
for m in y:
    print(m)
print("may" in y)
"""import time
while time.time() != 1:
    print(time.time())"""
z = ["Sohm", 14]
print(z)
#print(z[0] + " is " + str(z[1]))
a = [z, ["Lou", 72]]
#print(a)
#print(a[0][0] + " is " + str(a[0][1]))
#print(a[1][0] + " is " + str(a[1][1]))
for b in a:
    if b[1] >= 21:
        print(b[0] + " is " + str(b[1]))
print(y[2::2])
y[3] = "fool"
print(y)