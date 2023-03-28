#Coder Logan Choi
def integer(case):
    digits = ['0','1','2','3','4','5','6','7','8','9']
    sign = ['-','+']
    state = 0

    for s in case:
        if state == 0:
            if s in sign:
                state = 1
            elif s in digits:
                state = 2
            else:
                return False
        elif state == 1:
            if s in digits:
                state = 2
            else:
                return False
        elif state == 2:
            if s in digits:
                state = 2
            else:
                return False

    if state == 2:
        return True
    else:
        return False

def decimal(case):
    digits = ['0','1','2','3','4','5','6','7','8','9']
    sign = ['-','+']
    dec = ['.']
    state = 0

    for s in case:
        if state == 0:
            if s in sign:
                state = 1
            elif s in digits:
                state = 2
            else:
                return False
        elif state == 1:
            if s in digits:
                state = 2
            else:
                return False
        elif state == 2:
            if s in digits:
                state = 2
            elif s in dec:
                state = 3
            else:
                return False
        elif state == 3:
            if s in digits:
                state = 4
            else:
                return False
        elif state == 4:
            if s in digits:
                state = 4
            else:
                return False
        
    if state == 4:
        return True
    else:
        return False
    

def scientific(case):
    digits = ['0','1','2','3','4','5','6','7','8','9']
    zero = ['0']
    sign = ['-','+']
    dec = ['.']
    exp = ['E']
    state = 0

    for s in case:
        if state == 0:
            if s in sign:
                state = 1
            elif s in digits:
                state = 2
            else:
                return False
        elif state == 1:
            if s in digits:
                state = 2
            else:
                return False
        elif state == 2:
            if s in digits:
                state = 2
            elif s in dec:
                state = 3
            else:
                return False
        elif state == 3:
            if s in digits:
                state = 4
            else:
                return False
        elif state == 4:
            if s in digits:
                state = 4
            elif s in exp:
                state = 5
            else:
                return False
        elif state == 5:
            if s in sign:
                state = 6
            elif s in zero:
                state = 7
            elif s in digits:
                state = 8
            else:
                return False
        elif state == 6:
            if s in zero:
                state = 7
            elif s in digits:
                state = 8
            else:
                return False
        elif state == 7:
            if s in zero:
                state = 7
            elif s in digits:
                state = 8
            else:
                return False
        elif state == 8:
            if s in digits:
                state = 8
            else:
                return False
    if state == 8:
        return True
    else:
        return False

def hexadecimal(case):
    lang = ['0','1','2','3','4','5','6','7','8','9','A','B','C','D','E']
    end = ["H"]
    state = 0

    for s in case:
        if state == 0:
            if s in lang:
                state = 1
            else:
                return False
        elif state == 1:
            if s in lang:
                state = 1
            elif s in end:
                state = 2
            else:
                return False
        elif state == 2:
            return False
    if state == 2:
        return True
    else:
        return False

def keywords(case):
    lang = ["FUNC","IF","LOOP","RETURN"]
    if case in lang:
        return True
    else:
        return False

def str_lit(case):
    state = 0
    quotes = ['"']
    for s in case:
        if state == 0:
            if s in quotes:
                state = 1
            else:
                return False
        elif state == 1:
            if s in quotes:
                state = 2
            elif s.isspace() == False:
                state = 1
            else:
                return False
        elif state == 2:
            return False

    if state == 2:
        return True
    else:
        return False

def char_lit(case):
    lang = ['0','1','2','3','4','5','6','7','8','9','A','B','C','D','E']
    end = ['X']
    count = 0
    state = 0

    for s in case:
        if state == 0:
            if s in lang:
                count += 1
                state = 1
            else:
                return False
        elif state == 1:
            if s in lang:
                count +=1
                state = 1
            elif s in end:
                count +=1
                state = 2
            else:
                return False
        elif state == 2:
            return False
    
    if count == 3 and state == 2:
        return True
    else:
        return False

def identifier(case):
    digits = ['0','1','2','3','4','5','6','7','8','9']
    state = 0
    underscore = "_"

    for s in case:
        if state == 0:
            if s.isalpha() == True:
                state = 1
            else:
                return False
        elif state == 1:
            if s.isalpha() == True or s in digits or s == underscore:
                state == 1
            else:
                return False

    if state == 1:
        return True
    else:
        return False

if __name__ == "__main__":
    num_of_cases = int(input())
    print(num_of_cases)
    for x in range(0,num_of_cases):
        case = input()
        possible_answers = []
        if integer(case):
            possible_answers.append("Integer")
        if decimal(case):
            possible_answers.append("Decimal")
        if scientific(case):
            possible_answers.append("Scientific")
        if hexadecimal(case):
            possible_answers.append("Hexadecimal")
        if keywords(case):
            possible_answers.append("Keyword")
        if str_lit(case):
            possible_answers.append("String")
        if char_lit(case):
            possible_answers.append("Character")
        if identifier(case):
            possible_answers.append("Identifier")
        
        
        if len(possible_answers) == 0:
            print(str(x+1)+':',"INVALID!")
        else:
            print(str(x+1)+':',possible_answers[0])
