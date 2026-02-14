// We will look at datasheet later for these addresses, 
// but for now, trust that 0x24 is DDRB (Data Direction Register B)
// and 0x25 is PORTB (Data Register B).
#define DDRB   (*(volatile unsigned char *)0x24)
#define PORTB  (*(volatile unsigned char *)0x25)

void simple_delay() {
    // A crude delay. In the next lesson, we calculate this precisely.
    // "volatile" tells the compiler: "Do not optimize this loop away, 
    // even if it does nothing!"
    volatile long i;
    for (i = 0; i < 100000; i++); 
}

int main(void) {
    // Set Bit 5 of DDRB to 1 (Output mode)
    // 0x20 is binary 0010 0000
    DDRB |= 0x20; 

    while (1) {
        PORTB |= 0x20;  // Turn ON (Set Bit 5)
        simple_delay();
        PORTB &= ~0x20; // Turn OFF (Clear Bit 5)
        simple_delay();
    }
    return 0;
}