import time
import random
noun = ['man', 'dog', 'house', 'fish', 'girl', 'school']
verb = ['walked', 'ate', 'fed', 'met', 'ran']
verbi = ['slept', 'panted', 'panicked', 'died', 'swam']
adj = ['slimy', 'small', 'smelly', 'slippery', 'furry']
art = ['the', 'a']
def rnoun():
    return random.choice(noun)
def rverb():
    return random.choice(verb)
def rverbi():
    return random.choice(verbi)
def radj():
    return random.choice(adj)
def rart():
    return random.choice(art)
def sentance():
    if random.random() > 0.5:
        s = rart() + ' ' + rnoun() + ' ' + rverb() + ' ' + rart() + ' ' + rnoun() + '.'
    else:
        s = rart() + ' ' + rnoun() + ' ' + rverbi() + '.'
    return s.capitalize()
for i in range(100):
    print(sentance())