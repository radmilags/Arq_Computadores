def decbin(n):
  ans = ""
  while n//2>=1:
      ans += str(n%2)
      if n//2 == 1: ans += str(n//2)
      n = n//2
  ans = ans[::-1]
  return ans
