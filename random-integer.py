import random
import math

print("Uses a maximum value to generate a list \nof numbers between 1 and [maximum] with \nno repeating integers.")

while True:
	try:
		max = int(input("Enter maximum value> "))
		break
	except:
		print("that is not a valid value")

count = max
numbers = []
while count > 0:
	num = random.randint(1, max)
	if num not in numbers:
		print(num)
		numbers.append(num)
		count -= 1
		input()
input("End")
