# PYNQ-adder
This repository provides very basic examples to interact with IP based on 
AXI interfaces.

## Getting Started
On the latest Pynq-Z1 image (>2.4), you can copy the `notebooks/adders` folder 
into your `jupyter_notebooks` folder on the board.

```shell
git clone https://github.com/yunqu/PYNQ-adder.git
cd PYNQ-adder
cp -rf notebooks/adders /home/xilinx/jupyter_notebooks/
```

Then you can try the notebooks in the `adders` folder on the board.

Currently this repository only supports Pynq-Z1 board; however, the IPs 
provided in `boards/ip` are generally available for Zynq / Zynq Ultrascale
devices.
