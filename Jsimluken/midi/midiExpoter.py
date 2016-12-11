
import midi
import pretty_midi
import sys

def write_p_roll(p_roll,i,prefix):
    data = ""
    for j in range(len(p_roll)):
        data += str(p_roll[j])
        data += ","
    data.rstrip(',')
    data += "\n"
    print prefix
    print i
    f_name = prefix+str(i)+".csv"
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

