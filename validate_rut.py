import re


def validate_rut_module_11(rut: str) -> bool:
    '''
    important:
    rut string allowed: from 6 to 10 digits + "-" character + one digit or K or k
    return True if pass module 11 validation
    return False if dont pass module 11 validation
    module 11:
    for more details view http://www.pgrocer.net/Cis51/mod11.html
    '''

    if re.search(r'^[0-9]{6,10}-[\dkK]$', rut):
        reversed_rut = rut[::-1]
        dv = reversed_rut[0]

        if dv == "k" or dv == "K":
            dv_num = 10
        elif dv == "0":
            dv_num = 11
        else:
            dv_num = int(dv)
        sum = 0
        multiple = 1

        for x in reversed_rut[2:]:
            if multiple < 7:
                multiple += + 1
            else:
                multiple = 2
            sum += + int(x) * multiple
        module_11 = 11 - (sum % 11)

        if module_11 == dv_num:
            return True
        else:
            return False
    else:
        return False
