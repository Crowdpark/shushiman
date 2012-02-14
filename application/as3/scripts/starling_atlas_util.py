
import fileinput
import sys

searchExp = 'frameWidth="550" frameHeight="400"'
replaceExp = 'frameWidth="0" frameHeight="0"'
file = 'assets/spritesheets/character.xml'

for line in fileinput.input(file, inplace=1):
	line = line.replace(searchExp,replaceExp)
	sys.stdout.write(line)
