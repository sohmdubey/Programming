a = "abcdefghijklmnopqrstuvwxyz .,ABCDEFGHIJKLMNOPQRSTUVWXYZ"
def encrypt(s):
    e = ''
    for i in s:
        q = (a.find(i) + 10)%len(a)
        e = e + a[q]
    return e
def decrypt(s):
    e = ''
    for i in s:
        q = (a.find(i) - 10)%len(a)
        e = e + a[q]
    return e
print(decrypt(encrypt("The quick brown fox jumped over the lazy dog")))
pri
