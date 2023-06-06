from random import shuffle, randint, choices, choice
from time import sleep

def test(iteration, bound):
    chem = [["C", 4], ["C", 4], ["C", 4], ["H", 1], ["H", 1], ["H", 1], ["H", 1], ["H", 1], ["H", 1], ["H", 1], ["O", 2], ["H", 1]]
    shuffle(chem)
    print(chem)
    success = 0
    fail = 0
    startNode = ["", 0]
    chemLen = len(chem) - 1
    for i in range(iteration):
        tmp = []
        tmp = tmp + chem
        print("REF: "+str(tmp))
        print("==========ROUND "+str(i)+"==========")
        while startNode[1] < bound or startNode[1] == 0:
            startNode = choice(tmp)
        print("SART NODE: "+str(startNode))
        tmp.remove(startNode)
        potentialSubsequentNodes = choices(tmp, k=startNode[1])
        print("POTENTIAL CONECTING NODES: "+str(potentialSubsequentNodes))
        for n in potentialSubsequentNodes:
            n[1] = n[1] - 1
        print(potentialSubsequentNodes)
        additionNode = []
        for n in potentialSubsequentNodes:
            if n[1] > 0:
                additionNode.append(n)
        print("NODES THAT CAN CONNECT AGAIN: "+str(additionNode))
        if len(additionNode) > 0:
            print("SUCCESS")
            success = success + 1
        else:
            print("FAIL")
            fail = fail + 1
        startNode = ["", 0]
    return str(success/(success+fail)*100)
print("SIMULATION IN 3SEC...")
sleep(3)
out = ""
for i in range(3):
    out = out + "PERCENTAGE EVALUATION OF SUCCESS FOR "+str(i)+": "+test(100000, i)+"\n"
print("="*40)
print(out)

