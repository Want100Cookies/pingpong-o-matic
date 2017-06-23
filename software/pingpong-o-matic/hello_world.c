#include <stdio.h>
#include <unistd.h>
#include "system.h"
#include "altera_avalon_pio_regs.h"
#include "altera_avalon_lcd_16207_regs.h"

#define LCD_WR_COMMAND_REG 0
#define LCD_RD_STATUS_REG 1
#define LCD_WR_DATA_REG 2
#define LCD_RD_DATA_REG 3

#define COLS 40;
#define ROWS 30;

#define STACK_SIZE 12
#define SERVE_HEIGHT 10
#define TIMEOUT_TIME 100

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

struct Coordinate {
	int x;
	int y;
	char up; // Is the coordinate going up? 1/0
	char right; // Is the coordinate going right? 1/0
};

void stack_push(struct Coordinate stack[6], struct Coordinate c) {
	int i = STACK_SIZE - 1;
	while (i > 0) {
		stack[i] = stack[--i];
	}

	stack[0] = c;
}

void stack_print(struct Coordinate stack[6]) {
	for (int i = 0; i < STACK_SIZE; i++) {
		printf("#%d %02dx%02d | ", i, stack[i].x, stack[i].y);
	}
}

enum State {
	PRE_SERVE,
	SERVE,
	BEFORE_NET,
	OVER_NET,
	EXPECTING_HIT,
	GAME_OVER
};

int main() {
	unsigned long int ticks = 0;
	lcd_init();
	test_lcd();

	printf("Starting Nios II microprocessor...\n");

	unsigned int scoreL = 0;
	unsigned int scoreR = 0;

	struct Coordinate current;
	struct Coordinate stack[STACK_SIZE];

	for (int i = 0; i < STACK_SIZE; i++) {
		stack[i].x = 0;
		stack[i].y = 0;
	}

	enum State current_state = PRE_SERVE;
	char serving_side = 0; // 0 = left, 1 = right
	char last_hit; // 0 = left, 1 = right
	unsigned long int last_tick = 0;

	while (1) {
		ticks++;

		current.x = IORD_ALTERA_AVALON_PIO_DATA(BALL_X_BASE);
		current.y = IORD_ALTERA_AVALON_PIO_DATA(BALL_Y_BASE);

		if (current.x != stack[0].x && current.y != stack[0].y) {
			stack_push(&stack, current);

			stack[0].up = stack[0].x > stack[1].x;
			stack[0].right = stack[0].y > stack[1].y;

			int up = 0; // # of stack going up
			int right = 0; // # of stack going right
			int left_side = 0; // # of stack on left side

			for (int i = 0; i < STACK_SIZE; i++) {
				up = up + stack[i].up;
				right = right + stack[i].right;
				left_side = left_side + (stack[i].x > (COLS / 2));
			}

			char bounce = up == STACK_SIZE / 2 && right == STACK_SIZE / 2;
			char hit = right == STACK_SIZE / 2;
			char switch_side = left_side == STACK_SIZE / 2;



			if (bounce) {
				printf("Bounce\n");
			}

			if (hit) {
				last_hit = stack[0].x < (COLS / 2);
				printf("Hit by ");
				printf(last_hit ? "right" : "left");
				printf("\n");
			}

			// GOOD STATE MACHINE ACTIONS
			if (current_state == PRE_SERVE && stack[0].x < SERVE_HEIGHT) {
				current_state = SERVE;
				last_tick = ticks;
				printf("Do serve\n");

			} else if (current_state == SERVE && bounce) {
				current_state = BEFORE_NET;
				last_tick = ticks;
				printf("Before net\n");

			} else if (current_state == BEFORE_NET && switch_side) {
				current_state = OVER_NET;
				last_tick = ticks;
				printf("Over net\n");

			} else if (current_state == OVER_NET && bounce) {
				current_state = EXPECTING_HIT;
				last_tick = ticks;
				printf("Expecting hit\n");

			} else if (current_state == EXPECTING_HIT && hit) {
				current_state = BEFORE_NET;
				last_tick = ticks;
				printf("Before net\n");

			// BAD STATE MACHINE ACTIONS
			} else if (ticks - last_tick > TIMEOUT_TIME) {
				current_state = PRE_SERVE;
				printf("TIMEOUT\n");
				scoreR++;
				scoreL++;

			} else if (current_state == BEFORE_NET && bounce) {
				current_state = PRE_SERVE;
				printf("Bounce before net\n");
				scoreR++;
				scoreL++;

			} else if (current_state == OVER_NET && hit) {
				current_state = PRE_SERVE;
				printf("Hit before bounce\n");
				scoreR++;
				scoreL++;

			} else if (current_state == EXPECTING_HIT && bounce) {
				current_state = PRE_SERVE;
				printf("Bounce before hit\n");
				scoreR++;
				scoreL++;

			}


			IOWR_ALTERA_AVALON_PIO_DATA(SCORE_A_BASE, scoreL);
			IOWR_ALTERA_AVALON_PIO_DATA(SCORE_B_BASE, scoreR);
		}
	}

	return 0;
}
