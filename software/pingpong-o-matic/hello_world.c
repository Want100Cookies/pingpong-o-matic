#include <stdio.h>
#include "system.h"
#include "altera_avalon_pio_regs.h"

int main()
{
  printf("REEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEE!\n");
  int count = 0;
  int delay;
  while(1) {
    IOWR_ALTERA_AVALON_PIO_DATA(LED_BASE, 1 << count);
    delay = 0;
    while(delay < 2000000 ) {
      delay++;
    }
    count = (count+1) % 8;
  }

  return 0;
}
