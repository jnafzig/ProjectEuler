
def is_lychrel(n):
    '''
    Test whether given number is a lychrel number (up to 50 iterations)

    A lychrel number is a nuber where you repeatedly add the reveresed number and never
    encounter a palindrome

    >>> is_lychrel(196)
    True

    >>> is_lychrel(349)
    False

    '''
    m = reverse_digits(n)
    for i in range(50):
        n = n + m
        m = reverse_digits(n)
        if m == n:
            return False
    else:
        return True
        


def reverse_digits(n):
    '''
    return the number with reversed digits from n

    >>> reverse_digits(1421)
    1241
    >>> reverse_digits(14219)
    91241
    >>> reverse_digits(1)
    1

    '''
    return int(''.join(reversed(str(n))))


if __name__ == "__main__":
    import doctest
    doctest.testmod()

    count = 0
    for i in range(10000):
        if is_lychrel(i):
            count += 1
    print(count)

