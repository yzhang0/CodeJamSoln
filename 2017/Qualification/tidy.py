length = int(raw_input())
for test in range(length):
    num = raw_input()
    l = len(num)
    sofar = ""
    repeated = ["a",0]
    for i in range(l):
        if i != l-1 and num[i] >= num[i+1]:
            if num[i] > num[i+1]:
                if i != 0 and num[i] == num[i-1]:
                    # we go back to first time the value was encountered
                    sofar = sofar[:repeated[1]] + str((ord(repeated[0])-48) * 10**(l-repeated[1]-1)-1)
                else:
                    # we dont need to go back to before and can return x*10**digits-1
                    sofar += str((ord(num[i])-48) * 10**(l-len(sofar)-1)-1)
                break
            elif repeated[0] == "a" or repeated[0] != num[i]:
                # store the first time
                repeated = [num[i], i]
        sofar += num[i]
    print "Case #" + str(test+1) + ": " + sofar
