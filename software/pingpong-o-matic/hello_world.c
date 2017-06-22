#include <stdio.h>
#include <unistd.h>
#include "system.h"
#include "altera_avalon_pio_regs.h"
#include "altera_avalon_lcd_16207_regs.h"

#define LCD_WR_COMMAND_REG 0
#define LCD_RD_STATUS_REG 1
#define LCD_WR_DATA_REG 2
#define LCD_RD_DATA_REG 3

void lcd_init(void) {
	usleep(15000); /* Wait for more than 15 ms before init */
	/* Set function code four times -- 8-bit, 2 line, 5x7 mode */
	IOWR(LCD_0_BASE, LCD_WR_COMMAND_REG, 0x38);
	usleep(4100); /* Wait for more than 4.1 ms */
	IOWR(LCD_0_BASE, LCD_WR_COMMAND_REG, 0x38);
	usleep(100); /* Wait for more than 100 us */
	IOWR(LCD_0_BASE, LCD_WR_COMMAND_REG, 0x38);
	usleep(5000); /* Wait for more than 100 us */
	IOWR(LCD_0_BASE, LCD_WR_COMMAND_REG, 0x38);
	usleep(100); /* Wait for more than 100 us */

	/* Set Display to OFF*/
	IOWR(LCD_0_BASE, LCD_WR_COMMAND_REG, 0x08);
	usleep(100);

	/* Set Display to ON */
	IOWR(LCD_0_BASE, LCD_WR_COMMAND_REG, 0x0C);
	usleep(100);

	/* Set Entry Mode -- Cursor increment, display doesn't shift */
	IOWR(LCD_0_BASE, LCD_WR_COMMAND_REG, 0x06);
	usleep(100);

	/* Set the Cursor to the home position */
	IOWR(LCD_0_BASE, LCD_WR_COMMAND_REG, 0x02);
	usleep(2000);

	/* Display clear */
	IOWR(LCD_0_BASE, LCD_WR_COMMAND_REG, 0x01);
	usleep(2000);
}

alt_u32 test_lcd(void) {
	int i;
	char message[17] = "Hello World...  ";
	char done[15] = "Done! ";

	/* Write a simple message on the first line. */
	for (i = 0; i < 17; i++) {
		IOWR(LCD_0_BASE, LCD_WR_DATA_REG, message[i]);
		usleep(100);
	}
	/* Count along the bottom row */
	/* Set Address */
	IOWR(LCD_0_BASE, LCD_WR_COMMAND_REG, 0xC0);
	usleep(1000);

	/* Display Count */
	for (i = 0; i < 10; i++) {
		IOWR(LCD_0_BASE, LCD_WR_DATA_REG, (char )(i + 0x30));
		usleep(100000); /* Wait 0.5 sec */
	}

	/* Write "Done!" message on first line. */
	/* Set Address */
	IOWR(LCD_0_BASE, LCD_WR_COMMAND_REG, 0x80);
	usleep(1000);

	/* Write data */
	for (i = 0; i < 14; i++) {
		IOWR(LCD_0_BASE, LCD_WR_DATA_REG, done[i]);
		usleep(100);
	}
	return (0);
}

/*
void setcolor(int x, int y, int c)
{
	IOWR_ALTERA_AVALON_PIO_DATA(FRAMEBUFFER_CLK_BASE, 0);
	IOWR_ALTERA_AVALON_PIO_DATA(FRAMEBUFFER_ADDR_BASE, x * y * 640);
	IOWR_ALTERA_AVALON_PIO_DATA(FRAMEBUFFER_DATA_BASE, c);
	IOWR_ALTERA_AVALON_PIO_DATA(FRAMEBUFFER_CLK_BASE, 1);
}
*/

struct Coordinate {
	int x;
	int y;
	char up; // Is the coordinate going up? 1/0
	char right; // Is the coordinate going right? 1/0
};

void stack_push(struct Coordinate stack[6], struct Coordinate c) {
	int i = 5;
	while (i > 0) {
		stack[i] = stack[i--];
	}

	stack[0] = c;
}

void stack_print(struct Coordinate stack[6]) {
	for (int i = 0; i < 6; i++) {
		printf("#%d %dx%d | ", i, stack[i].x, stack[i].y);
	}

	printf("\n");
}

int main() {
	lcd_init();
	test_lcd();

	printf("Starting Nios II microprocessor...\n");

	IOWR_ALTERA_AVALON_PIO_DATA(SCORE_A_BASE, 66);
	IOWR_ALTERA_AVALON_PIO_DATA(SCORE_B_BASE, 66);
//	int count = 0;
//	int count2 = 0;
//	int count3 = 0;

	//IOWR_ALTERA_AVALON_PIO_DATA(FRAMEBUFFER_CLK_BASE, 0);

	/*
	for(int x = 0; x < 640; x++)
	{
		for(int y = 0; y < 480; y++)
		{
			setcolor(x, y, 0);
		}
	}
	*/

//	int delay;
	struct Coordinate current;
	struct Coordinate stack[6];

	for (int i = 0; i < 6; i++) {
		stack[i].x = 0;
		stack[i].y = 0;
	}

	while (1) {
		current.x = IORD_ALTERA_AVALON_PIO_DATA(BALL_X_BASE);
		current.y = IORD_ALTERA_AVALON_PIO_DATA(BALL_Y_BASE);

		if (current.x != stack[0].x && current.y != stack[0].y) {
			stack_push(&stack, current);

			stack[0].up = stack[0].x > stack[1].x;
			stack[0].right = stack[0].y > stack[1].y;

			int up = 0;
			int right = 0;

			for (int i = 0; i < 6; i++) {
				up = up + stack[i].up;
				right = right + stack[i].right;
			}

			if (up == 3 && right == 3) {
				printf("Bounce\n");
			}
		}


		/*
		for(int i = 0; i < 4; i++)
		{
			printf("%d\n",i);
			IOWR_ALTERA_AVALON_PIO_DATA(FRAMEBUFFER_CLK_BASE, 0);
			//usleep(10000);
			IOWR_ALTERA_AVALON_PIO_DATA(FRAMEBUFFER_ADDR_BASE, i);
			IOWR_ALTERA_AVALON_PIO_DATA(FRAMEBUFFER_DATA_BASE, i == 0 ? 1 : 0);
			IOWR_ALTERA_AVALON_PIO_DATA(FRAMEBUFFER_CLK_BASE, 1);
			usleep(1000000);
		}
		*/

//		IOWR_ALTERA_AVALON_PIO_DATA(LEDR_BASE, 7 << count);
//		IOWR_ALTERA_AVALON_PIO_DATA(LEDG_BASE, 0b111111111);
//
//
//		delay = 0;
//		while (delay < 100000) {
//			delay++;
//		}
//		count = (count + 1) % 17;
//
//		count2 = (count2 + 1) % 10000;
//		IOWR_ALTERA_AVALON_PIO_DATA(SEVSEG_2_BASE, count2);
//
//		count3 = (count3 + 1) % 100;
//		IOWR_ALTERA_AVALON_PIO_DATA(SEVSEG_0_BASE, count3);
//		IOWR_ALTERA_AVALON_PIO_DATA(SEVSEG_1_BASE, 99 - count3);

		/*
		for(int x = 200; x < 250; x++)
		{
			//printf("%d\n",x);
			for(int y = 200; y < 250; y++)
			{
				IOWR_ALTERA_AVALON_PIO_DATA(FRAMEBUFFER_CLK_BASE, 0);
				IOWR_ALTERA_AVALON_PIO_DATA(FRAMEBUFFER_ADDR_BASE, x * y * 640);
				IOWR_ALTERA_AVALON_PIO_DATA(FRAMEBUFFER_DATA_BASE,1);
				IOWR_ALTERA_AVALON_PIO_DATA(FRAMEBUFFER_CLK_BASE, 1);
				usleep(5000);

			}
		}

		usleep(1000000);

		for(int x = 200; x < 250; x++)
		{
			//printf("%d\n",x);
			for(int y = 200; y < 250; y++)
			{
				IOWR_ALTERA_AVALON_PIO_DATA(FRAMEBUFFER_CLK_BASE, 0);
				IOWR_ALTERA_AVALON_PIO_DATA(FRAMEBUFFER_ADDR_BASE, x * y * 640);
				IOWR_ALTERA_AVALON_PIO_DATA(FRAMEBUFFER_DATA_BASE, 0);
				IOWR_ALTERA_AVALON_PIO_DATA(FRAMEBUFFER_CLK_BASE, 1);
				//usleep(50);

			}
		}

		usleep(1000000);
		*/

		/*
		const int x = 0;
		const int y = 0;

		setcolor(x, y, 1);
		usleep(1000000);
		setcolor(x, y, 0);
		*/

		/*
		printf("1\n");

		for(int x = 0; x < 640; x++)
		{
			for(int y = 0; y < 480; y++)
			{
				setcolor(x, y, 1);
			}
		}

		//usleep(100000);
		printf("2\n");

		for(int x = 0; x < 640; x++)
		{
			for(int y = 0; y < 480; y++)
			{
				setcolor(x, y, 0);
			}
		}
		*/
		//usleep(100000);
	}

	return 0;
}
