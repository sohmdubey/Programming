animals = ['Has Feathers?', 'chicken', []]
t = ['Four Legs?', 'dog', []]
s = ['No Legs?', 'snake', []]
animals[2] = t
t[2] = s
print(animals)
def q20():
    solved = False
    q = animals
    print('Think of an animal.')
    while not solved:
        ans = input(q[0])
        if ans in ["Yes", "yes", "YES"]:
            q = q[1]
        print(ans, q)
q20()