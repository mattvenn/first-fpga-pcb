## Creates a gamma-corrected lookup table
import math
import sys

def hex3(n):
    return "0x%s"% ("00000000%x"%(n&0xffffffff))[-8:]

def gamma(nsteps, gamma):
    gammaedUp = [math.pow(x, gamma) for x in range(nsteps)]
    return [x/max(gammaedUp) for x in gammaedUp]

def rounder(topValue, gammas):
    return [min(topValue, round(x*topValue)) for x in gammas]

if __name__ == "__main__":
    myGamma = 2.3
    steps = 2 ** int(sys.argv[1])
    with open("gamma.hex", 'w') as fh:
        for value in rounder(steps-1, gamma(steps, myGamma)):
            fh.write(hex3(value) + "\n")
