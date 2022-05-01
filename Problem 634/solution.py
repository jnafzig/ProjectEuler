def F(n):
    a = 2
    total = 0
    while True:
        num = ((n/a**3)**(1/2))
        if num < 2:
            break
        total += int(num) - 1
        print('a:', a, 'max b:', num, 'cap:', a**3*int(num)**2, int(num)-1)
        a += 1
    return total

print(F(2*10**4))
