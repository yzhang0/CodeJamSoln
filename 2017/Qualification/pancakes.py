def flip(s):
    if s == "-":
        return "+"
    return "-"

length = int(raw_input())
for test in range(length):
    pancakes, num = raw_input().split()
    num = int(num)
    pancakes = list(pancakes)
    count = 0
    for i in range(len(pancakes)-num+1):
        if pancakes[i] == "-":
            count += 1
            for j in range(num):
                pancakes[i+j] = flip(pancakes[i+j])
    if "-" in pancakes[:]:
        print "Case #" + str(test+1) + ": IMPOSSIBLE"
    else:
        print "Case #" + str(test+1) + ": " + str(count)
