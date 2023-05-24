<!--
 * @Author: YuWenlu wy19403@essex.ac.uk
 * @Date: 2023-02-13 10:51:08
 * @LastEditors: YuWenlu wy19403@essex.ac.uk
 * @LastEditTime: 2023-02-13 10:59:09
 * @FilePath: \22-23_CE339_yu_wenlu\assignment1\main1_one_digit\main1_one_digit.md
 * @Description: 这是默认设置,请设置`customMade`, 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
-->

# CE339 assignment1 main1 one digit

#### By _**{Yu Wenlu wy19403@essex.ac.uk}**_

### This project is an assignment submission for the CE339 High Level Digital Design


## Technologies Used

* _Simulation system: Vivado 2021.2_
* _Target hardware: a Digilent Basys3 board with a Xilinx FPGA: xc7a35tcpg236-1_
* _Programming languages: VHDL, C_


## Description
The implementation defines a module called "Lab1_TopDesign" that contains two input/output ports "led" and "sw".

The "led" port is an 8-bit output vector (7 downto 0), and the "sw" port is an 8-bit input vector (7 downto 0).

The architecture "Behavioral" defines the behavior of the circuit based on the input signals "sw".For example, led(0) is assigned the negation of sw(0), led(1) is assigned the logical AND of sw(1) and NOT of sw(2), and so on.

## Performance
![A screenshot of my lab](1_digit%20(2).png)

![A screenshot of my lab](1_digit%20(3).png)

![A screenshot of my lab](1_digit%20(1).png)
