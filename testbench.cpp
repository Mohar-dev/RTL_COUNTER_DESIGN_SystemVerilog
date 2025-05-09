#include "Vcounter.h"
#include "verilated.h"

int main(int argc, char **argv) {
    Verilated::commandArgs(argc, argv);
    Vcounter* top = new Vcounter;

    top->clk = 0;
    top->rst = 1;

    // Reset for 2 cycles
    for (int i = 0; i < 2; i++) {
        top->clk = !top->clk;
        top->eval();
    }

    top->rst = 0;

    // Run for 20 clock cycles
    for (int i = 0; i < 40; i++) {
        top->clk = !top->clk;
        top->eval();

        if (top->clk) {
            printf("Time = %d | Count = %04b\n", i * 5, top->count);
        }
    }

    delete top;
    return 0;
}
