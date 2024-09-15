# -1011-sequence-dection
An FSM to detect a sequence of “1011” in a stream of bit. (The left most bit come first)
![image](https://github.com/user-attachments/assets/7a192583-f178-4a70-9578-54961ea707c5)

FSM diagram:

To run simulation:
make all_wave MEALY_FSM=1 LENGTH=32 (MEALY_FSM=0: MOORE_FSM; LENGTH="flexible")
