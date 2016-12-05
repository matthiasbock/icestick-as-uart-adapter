
module top(
    // main crystal oscillator
    input  clock_12mhz,

    // FPGA's UART port to PC
    // via FTDI FT2232H USB-Serial IC
    input  rx,
    output tx,
    input  rts,
    output cts,

    // onboard LEDs
    output led_bottom,
    output led_center,
    output led_top,
    output led_left,
    output led_right,

    // uC's UART port
    // naming as seen from uC
    output uart_uc_rx,
    input  uart_uc_tx,
    output uart_uc_rts,
    input  uart_uc_cts,

    // debug LED signals from uC
    input  led0,
    input  led1,
    input  led2,
    input  led3
    );

    /**
     * UART pass-through
     * from FTDI chip to uC
     */
    assign uart_uc_rx = rx;
    assign tx = uart_uc_tx;
    assign uart_uc_rts = rts;
    assign cts = uart_uc_cts;

    /*
     * debug LEDs
     */
    assign led_center = 1;
    assign led_top = rx;
    assign led_bottom = uart_uc_tx;
    assign led_left = rts;
    assign led_right = uart_uc_cts;

endmodule
