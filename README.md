# -1011-sequence-detection
An FSM to detect a sequence of “1011” in a stream of bit. (The left most bit come first)
![image](https://github.com/user-attachments/assets/7a192583-f178-4a70-9578-54961ea707c5)

FSM diagram:


![image](https://github.com/user-attachments/assets/f9fcccfc-1ed4-4262-b14f-24c10369408f)


state0: start decting bit "1"; if there's bit "1", move to state1

state1: the sequence now is "1???"; if stream = 1, keep waiting; if there's bit "0", move to state 2

state2: the sequence now is "10??"; if stream = 0, move to state0, reset the sequence; if there's bit "1", move to state3

state3: the sequence now is "101?"; if stream = 0, move to state0, reset the sequence; if there's bit "1", move to state4

state4: the sequence now is "1011", output = 1; if stream = 0, move to state2, the sequence is now "10??"; if there's bit "1", move to state1, is now "1???"

To run simulation:
make all_wave MEALY_FSM=1 LENGTH=32 (MEALY_FSM=0: MOORE_FSM; LENGTH="flexible")

MEALY_FSM, LENGTH=32:

![image](https://github.com/user-attachments/assets/c891a5db-0b64-4edf-bc1e-a794ccd3568b)

![image](https://github.com/user-attachments/assets/06912eb4-3f15-4338-8f64-808aa8b1d59a)

MOORE_FSM, LENGTH=32:

![image](https://github.com/user-attachments/assets/49c143ed-361f-4fbf-8a39-ace260cd0148)

![image](https://github.com/user-attachments/assets/6129a6be-916f-4c94-b2ee-76deee5bbff7)
