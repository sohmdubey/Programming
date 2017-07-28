import random
a = "abcdefghijklmnopqrstuvwxyz"
password = ""
for i in range(7):
    password = password + random.choice(a)
def cracker():
    ct = 0
    for i in a:
        for j in a:
            for k in a:
                for w in a:
                    for q in a:
                        for v in a:
                            for l in a:
                                ct = ct + 1
                                c = i + j + k + w + q + v + l
                                print(str(ct) + ". " + c)
                                if password == c:
                                    print("The password is " + password)
                                    exit(0)
cracker()