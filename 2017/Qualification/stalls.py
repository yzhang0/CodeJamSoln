def stalls_slow():
  length = int(raw_input())
  for test in range(length):
    n, k = list(map(int, raw_input().split()))
    a = [n]
    for i in range(k):
      # print a
      ma = max(a)
      m = a.index(ma)
      if ma % 2 == 0:
        a = a[:m] + [ma/2-1, ma/2] + a[m+1:]
      else:
        a = a[:m] + [ma/2, ma/2] + a[m+1:]
    L = a[m]
    R = a[m+1]
    print "Case #" + str(test+1) + ": " + str(max(L, R)) + " " + " " + str(min(L,R))

def stalls_fast():
  length = int(raw_input())
  for test in range(length):
    n, k = list(map(int, raw_input().split()))
    a = [n]
    for i in range(k):
      ma = a.index(max(a))
      L = int(np.floor((a[ma]-1)*1.0/2))
      R = int(np.ceil((a[ma]-1)*1.0/2))
      a = a[:ma] + a[ma+1:] + [L, R]
    print "Case #" + str(test+1) + ": " + str(R) + " " + " " + str(L)

def stalls_faster():
  length = int(raw_input())
  for test in range(length):
    n, k = list(map(int, raw_input().split()))
    a = {n}
    c = {n: 1}
    P = 0
    while P < k:
      ma = max(a)
      if ma % 2 == 0:
        L = ((ma-1)/2)
        R = ((ma)/2)
      else:
        L = (ma-1)/2
        R = (ma-1)/2
      P += c[ma]
      a.remove(ma)
      a.add(L)
      a.add(R)
      c[L] = c[L] + c[ma] if c.get(L) else c[ma]
      c[R] = c[R] + c[ma] if c.get(R) else c[ma]
    print "Case #" + str(test+1) + ": " + str(R) + " " + " " + str(L)

def stalls_frank():
  length = int(raw_input())
  for test in range(length):
    n, k = list(map(int, raw_input().split()))
    L, R = stalls_frank_helper(n,k)
    print "Case #" + str(test+1) + ": " + str(max(L, R)) + " " + " " + str(min(L,R))

def stalls_frank_helper(n,k):
  if k == 1:
    return [n/2, n/2 + n % 2 - 1]
  elif k % 2 == 0:
    return stalls_frank_helper(n/2, k/2)
  else:
    return stalls_frank_helper(n/2+n%2-1, (k-1)/2)

stalls_frank()
