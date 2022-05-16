filename=input()
file=open(filename, "r")
Lines=file.readlines()
count=1
for line in Lines:
    if (count%2==0):
        print(line)
    count+=1
file.close()