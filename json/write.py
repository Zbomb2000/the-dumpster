import json

with open('data.json', 'r') as file:
    file_data = json.load(file)
    print()
    print("Previous name: '"+file_data['name']+"'. Previous number: '"+str(file_data['number'])+"'.")
    print()

name = input("Enter your name: ")
number = int(input("Enter a number: "))

data = {"name": name, "number": number}

with open('data.json', 'w') as file:
    json.dump(data, file)

print("Done!")
print()
