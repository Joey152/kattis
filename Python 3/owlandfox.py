def transform(N):

    newString = ""
    length = len(N)

    for i in range(1, len(N)+1):
        oneToNine = list(map(str, list(range(1,10))))
        print(oneToNine)
        if N[-i] in oneToNine:
            print(i)
            newString = N[:-i] + str(int(N[-1]) - 1) + N[-i:]
            break

    print(newString)

if __name__ == '__main__':
     cases = int(input())
     for case in range(cases):
        transform(input())