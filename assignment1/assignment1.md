<!--
 * @Author: NicoleYu wy19403@essex.ac.uk
 * @Date: 2023-02-12 14:13:32
 * @LastEditors: NicoleYu wy19403@essex.ac.uk
 * @LastEditTime: 2023-02-17 01:17:14
 * @FilePath: \22-23_CE339_yu_wenlu\assignment1\assignment1.md
 * @Description: 这是默认设置,请设置`customMade`, 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
-->
# _Assignment 1_

#### By _**{Yu Wenlu wy19403@essex.ac.uk}**_

#### _This project is an assignment submission for the CE339 course_
## Introduction
This VHDL code is an implementation of a countdown timer with a set button and up/down buttons. The code is designed to work with a four-digit seven-segment display and is intended to count down from 59 minutes and 59 seconds. The timer can be set by pressing the set button, which activates the SET state, and then using the up and down buttons to adjust the minutes. Pressing the set button again returns the timer to the GO state, where the countdown begins.

## Technologies Used

* _Simulation system: Vivado 2021.2_
* _Target hardware: a Digilent Basys3 board with a Xilinx FPGA: xc7a35tcpg236-1_
* _Programming languages: VHDL, C_

## Setup/Installation Requirements

* _Clone this repository to your main3_final._
* _Navigate to the top level of the directory._
* _Open lab project via Vivado_
* _Burn lab project to Basys3 board_
## Port

* clk: a clock signal
* btnU, btnD, btnC: signals from the up, down, and set buttons, respectively
The code produces the following outputs:
* seg: a seven-segment display output for each digit
* dp: a decimal point output for the current digit
* an: a signal to select the current digit
## Description

**A little taste of using VHDL, Xilinx Vivado software suite and Basys3 design board.**
To use the code, instantiate the main3_final entity and connect the required signals. The code also requires two sub-entities: button_active and Clock_Divider. These should also be instantiated and connected to the main3_final entity. The button_active entity is used to debounce the input signals from the buttons, while the Clock_Divider entity is used to generate a slower clock signal for the countdown timer.

The main3_final entity contains two processes: state_do_it and state_transferBCD. The state_do_it process handles the current and next state of the timer, while the state_transferBCD process handles the actual counting down of the timer.


