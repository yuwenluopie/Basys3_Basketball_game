<!--
 * @Author: YuWenlu wy19403@essex.ac.uk
 * @Date: 2023-02-13 14:38:35
 * @LastEditors: NicoleYu wy19403@essex.ac.uk
 * @LastEditTime: 2023-02-17 11:20:01
 * @FilePath: \22-23_CE339_yu_wenlu\assignment1\main3_final\main3_final.md
 * @Description: 这是默认设置,请设置`customMade`, 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
-->
# CE339 assignment1 main3 final

#### By _**{Yu Wenlu wy19403@essex.ac.uk}**_

### This project is an assignment submission for the CE339 High Level Digital Design


## Technologies Used

* _Simulation system: Vivado 2021.2_
* _Target hardware: a Digilent Basys3 board with a Xilinx FPGA: xc7a35tcpg236-1_
* _Programming languages: VHDL, C_


## Description

This code describes a digital system in VHDL that implements a timer. The timer can be in two states: "STATE_SET" and "STATE_GO". In the "STATE_SET" state, the user can set the timer's count by pressing the "btnU" and "btnD" buttons. The count is displayed on four 7-segment displays. When the user presses the "btnC" button, the timer transitions from the "STATE_SET" state to the "STATE_GO" state, where the timer starts counting down. The "seg" output is the output to the 7-segment displays, and the "an" output selects which of the displays is currently active.

The system also includes processes to handle button presses and to keep track of the state of the system. The button presses are debounced by checking if a button is pressed for a certain amount of time (4000 clock cycles in this case). The state of the system is controlled by the "state_do_it" process, which updates the state of the system based on the "action_out_C" signal, which indicates if the "btnC" button has been pressed for the required amount of time. The "state_transferBCD" process implements the state machine that governs the behavior of the timer.
## Performance
![A screenshot of my lab](main3%20(2).png)

![A screenshot of my lab](main3%20(1).png)
