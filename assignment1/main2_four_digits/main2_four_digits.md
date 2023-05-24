<!--
 * @Author: YuWenlu wy19403@essex.ac.uk
 * @Date: 2023-02-13 10:49:47
 * @LastEditors: YuWenlu wy19403@essex.ac.uk
 * @LastEditTime: 2023-02-13 11:11:04
 * @FilePath: \22-23_CE339_yu_wenlu\assignment1\main2_four_digits\main2_four_digits.md
 * @Description: 这是默认设置,请设置`customMade`, 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
-->

# CE339 assignment1 main2 four digits

#### By _**{Yu Wenlu wy19403@essex.ac.uk}**_

### This project is an assignment submission for the CE339 High Level Digital Design


## Technologies Used

* _Simulation system: Vivado 2021.2_
* _Target hardware: a Digilent Basys3 board with a Xilinx FPGA: xc7a35tcpg236-1_
* _Programming languages: VHDL, C_


## Description

This VHDL code is for a 4-digit 7-segment display decoder. **It takes four 4-bit inputs, d3, d2, d1, and d0**, which represent the digits that need to be displayed, and **outputs the segments that need to be lit up (seg) and the digit to be displayed (an)**.

The architecture contains two main components: an instance of the one_digit entity and a process that performs the digit multiplexing and display timing. The one_digit entity is instantiated as "one_digit_unit" and maps its input to the present digit (d_present) and its output to the segments (seg).

The process monitors the clock (clk) and updates the present digit and the digit to be displayed based on a 2-bit counter (counter). The counter increments whenever the input ck is '1' and the clock (clk) is rising. The present digit is updated based on the value of the counter using a case statement, where d0 is displayed when counter is "00", d1 is displayed when counter is "01", and so on. The an output is also updated to indicate which digit is being displayed.

Additionally, the process contains a variable (count) and a signal (key_out) that are used to implement a delay mechanism. The count variable increments whenever the input ck is '1' and the clock is rising. When count reaches 4000, the ke

## Performance
![A screenshot of my lab](4_digits%20(2).png)

![A screenshot of my lab](4_digits%20(3).png)

![A screenshot of my lab](4_digits%20(1).png)
