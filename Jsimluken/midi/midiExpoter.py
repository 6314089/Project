
import midi
import pretty_midi
import sys


def get_chroma(c):
    m = c % 12
    if m == 0:
        return "C"
    elif m == 1:
        return "Csharp"
    elif m == 2:
        return "D"
    elif m == 3:
        return "Dsharp"
    elif m == 4:
        return "E"
    elif m == 5:
        return "F"
    elif m == 6:
        return "Fsharp"
    elif m == 7:
        return "G"
    elif m == 8:
        return "Gsharp"
    elif m == 9:
        return "A"
    elif m == 10:
        return "Asharp"
    elif m == 11:
        return "B"

def get_octave(c):
    d = c /12
    return d-2

def write_p_roll(p_roll,i,prefix):
    data = ""
    for j in range(len(p_roll)):
        data += str(p_roll[j])
        data += ","
    data.rstrip(',')
    data += "\n"
    print prefix
    chroma = get_chroma(i)
    octave = get_octave(i)
    f_name = prefix+chroma+str(octave)+".csv"
    f = open(f_name,"w")
    f.write(data)
    f.close()

if __name__ == "__main__":
    args = sys.argv
    if len(args) <2:
        print "need filename"
        exit()
    filename = args[1]
    prefix = filename.split('.')[0]
    fs = 44100
    if len(args) >2:
        fs = int(args[2])
    midi_data = pretty_midi.PrettyMIDI(filename)
    p_roll = midi_data.get_piano_roll(fs)
    
    active_Chroma = []
    for i in range(128):
        if max(p_roll[i]) > 0:
            write_p_roll(p_roll[i],i,prefix)

