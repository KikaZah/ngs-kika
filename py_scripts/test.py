x = 'AHJKIDUATSGDUIJVOFS'

if 'M' not in x:
# x.find('M') < 0:
	print('no')
else:
	print('yes')


# x = 'abcdefgh'

# print(int(len(x)/2))
# print(x[:int(len(x)/2)])

# for i in range(len(x)-1, -1, -1):
# 	print(x[i:])
# 	i += 1

# for i in x[::-1]:
# 	print(i)


# import re

# key_ins = 'NODE_146_length_46873_cov_73.8744:10500-16000_1'
# key_root = re.sub(r'(NODE_\d+_length_\d+_cov_\d+.\d+).*', r'\g<1>', key_ins)
# print(key_root)


# sequences = ['AAATTTCCCGGGAAATTT', 'TTTGGGAAATTTCCC']

# for sequence in sequences:
# 	if sequence.count(sequence[0:5]) > 1:
# 		print('circular: ' + sequence)
# 	else:
# 		print('not circular: ' + sequence)


# import re

# sequences = ['AAATTTCCCGGGAAANCGNTTTT', 'TTTGGGAAATTTCCC']

# for sequence in sequences:
# 	hits = re.findall(r'(([A-Z])\2\2+)', sequence)
# 	print([hit[0] for hit in hits])


# sequence = 'AAATTTCCCGGGAAATTT'
# print(sequence.find('TTT'))

# sequence = 'AAATTTCCCGGGAAATTT'
# for i in range(len(sequence)):
# 	print(sequence[0:i+1])
# 	if sequence.count(sequence[0:i+1]) > 1:
# 		print(len(sequence[0:i+1]))
# 		# if sequence[0:i+1] == sequence[-len(sequence[0:i+1]):]
# 		print('repeat: ' + sequence[0:i+1])
# 		print('repeat start: ' + str(sequence.find(sequence[0:i+1])))
# 	i += 1