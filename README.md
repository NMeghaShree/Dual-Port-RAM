# Dual-Port-RAM  
A Dual-Port RAM (Random Access Memory) is a type of memory that allows simultaneous read and write operations from two different ports, making it highly efficient for applications requiring parallel data access. A 16×8-bit Dual-Port RAM consists of 16 memory locations, each capable of storing 8 bits (1 byte) of data, providing a total storage capacity of 128 bytes.
Each port operates independently, with its own address, data, and control lines, allowing two processors or functional units to access the memory without interference. This architecture typically includes separate read and write ports, enabling simultaneous access, which improves performance in applications like video processing, shared buffers, and communication systems.
The signals utilized are:-  
clock, write enable(negation of write enable used as read enable), 2 output data buses, 2 input data buses and 2 address buses.    

The schematic obtained is as follows:-  
![image](https://github.com/user-attachments/assets/1899efd7-348f-4d1e-a9f3-dae103b2c939)

The waveform for verification is obtained:-  
![image](https://github.com/user-attachments/assets/d740e58c-70f0-4bf0-a910-5564f9ec696a)

Post-Synthesis Functional Verification:-
![image](https://github.com/user-attachments/assets/858d4897-3289-4640-805f-696055712d45)


