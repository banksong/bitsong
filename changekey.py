notesDict = {':c0':'12',':db0':'13',':d0':'14',':eb0':'15',':e0':'16',':f0':'17',':gb0':'18',':g0':'19',':ab0':'20',':a0':'21',':bb0':'22',':b0':'23',
             ':c1':'24',':db1':'25',':d1':'26',':eb1':'27',':e1':'28',':f1':'29',':gb1':'30',':g1':'31',':ab1':'32',':a1':'33',':bb1':'34',':b1':'35',
             ':c2':'36',':db2':'37',':d2':'38',':eb2':'39',':e2':'40',':f2':'41',':gb2':'42',':g2':'43',':ab2':'44',':a2':'45',':bb2':'46',':b2':'47'}

print notesDict[':c2']

changekey =  raw_input("Enter how many keys you want to move: ")
print changekey
sourceFileName = raw_input("Enter source file name: ")
print sourceFileName

newFileName = 'c_key' + changekey + '_'+sourceFileName

fin = open(sourceFileName,"rt")
fout = open(newFileName,"w+")

sourceLine = ':c2,:db2,:c2 drum-sync_:abc'
print int(changekey)

#for line in fin:
targetLine = reduce(lambda x ,y:x.replace(y,str(int(notesDict[y]) + int(changekey))),notesDict,sourceLine)

fout.write(targetLine)

fout.close()
fin.close()
