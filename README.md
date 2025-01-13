# Dual-Port-RAM  
A Dual-Port RAM (Random Access Memory) is a type of memory that allows simultaneous read and write operations from two different ports, making it highly efficient for applications requiring parallel data access. A 256×8-bit Dual-Port RAM consists of 256 memory locations, each capable of storing 8 bits (1 byte) of data, providing a total storage capacity of 2048 bits (256 bytes).
Each port operates independently, with its own address, data, and control lines, allowing two processors or functional units to access the memory without interference. This architecture typically includes separate read and write ports, enabling simultaneous access, which improves performance in applications like video processing, shared buffers, and communication systems.
The signals utilized are:-  
clock, write enable(negation of write enable used as read enable), 2 output data buses, 2 input data buses and 2 address buses.    

The schematic obtained is as follows:-  
![schem](https://github.com/user-attachments/assets/613d43f8-fc9d-4a98-9319-82816f322936)  

The waveform for verification is obtained:-  
![wvfrm](https://github.com/user-attachments/assets/f0c5885b-6cc2-49a1-bef3-ebab69ac0df3)
