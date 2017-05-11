#include <stdio.h>
#include "system.h"
#include "altera_avalon_pio_regs.h"

int main()
{
  printf("REEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEE!\n");
  int count = 0;
  int count2 = 0;
  int count3 = 0;

  int delay;
  while(1) {
    IOWR_ALTERA_AVALON_PIO_DATA(LED_BASE, 1 << count);

    delay = 0;
    while(delay < 100000) {
      delay++;
    }
    count = (count+1) % 8;

    count2 = (count2+1) % 10000;
    IOWR_ALTERA_AVALON_PIO_DATA(SEVSEG_2_BASE, count2);

    count3 = (count3+1) % 100;
    IOWR_ALTERA_AVALON_PIO_DATA(SEVSEG_0_BASE, count3);
    IOWR_ALTERA_AVALON_PIO_DATA(SEVSEG_1_BASE, 99 - count3);
  }

  return 0;
}
