from functools import reduce

def modulo_sum(iterable, mod=1000000007):
    return reduce(lambda x, y: (x + y) % mod, iterable)

def f(n,k):
    '''
    When stacking n plates into k non-empty stacks with different sizes, f(n,k) is the max height of
    the smallest stack

    >>> f(10,3)
    2

    since optimal stacks would be [2,3,5]
    
    >>> f(10,5)
    0

    since we can't divide the 10 plates into five differently sized stacks
    '''
    return  max((n - k * (k + 1) // 2) // k + 1, 0)


def F(n):
    '''
    F(n) is the sum of f(n, k) over all values of k >= 1

    >>> F(100)
    275
    '''

    count = 0
    k = 1
    while n >= k*(k+1)//2:
        count += f(n,k)
        k += 1
    return count

def G(N, k):
    '''
    G(N, k) is the sum of f(n, k) from n=1 to n=N
    '''
    p = k * (k + 1) // 2
    l = (N + 1 - p) // k
    j = (N + 1 - p) % k
    return max( k * (l * (l + 1) // 2 ) + (l+1)*j, 0)

def G_loops(N, k):
    '''
    G_loops calculates G(N, k) using loops
    '''
    return sum(f(n,k) for n in range(1, N+1))
    
def S(N):
    '''
    S(N) is the sum of F(n) from n=1 to n=N

    >>> S(100)
    12656
    '''
    max_k=int((2*N)**(1/2))
    return modulo_sum(G(N, k) for k in range(1, max_k+1))

def S_loops(N):
    '''
    S(N) is the sum of F(n) from n=1 to n=N
    (uses loops)

    >>> S(100)
    12656
    '''
    return sum(F(n) for n in range(1, N+1))

if __name__ == "__main__":
    import doctest
    doctest.testmod()
    print(S(10**16)) 
