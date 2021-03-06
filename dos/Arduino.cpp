// SPDX-License-Identifier: MIT
// Copyright (c) 2018, 2019 Ulrich Hecht

#include <video_driver.h>
#include "dosaudio.h"

#include "Arduino.h"
#include "FS.h"
#include "SPI.h"
#include <malloc.h>

void digitalWrite(uint8_t pin, uint8_t val) {
  printf("DW %d <- %02X\n", pin, val);
}

int digitalRead(uint8_t pin) {
  return 0;
}

void pinMode(uint8_t pin, uint8_t mode) {
}

fs::FS SPIFFS;
SPIClass SPI;

void loop();
void setup();

struct palette {
  uint8_t r, g, b;
};
#include <N-0C-B62-A63-Y33-N10.h>
#include <P-EE-A22-B22-Y44-N10.h>

static void my_exit(void) {
  fprintf(stderr, "my_exit\n");
}

#include <allegro.h>

extern "C" void init_idle();

int main(int argc, char **argv) {
  atexit(my_exit);

  init_idle();

  if (allegro_init() != 0)
    return 1;

  install_timer();

  audio.begin();

  setup();
  for (;;)
    loop();
}

#include "border_pal.h"

uint64_t total_frames = 0;
extern uint64_t total_samples;
extern int sound_reinit_rate;

void platform_process_events() {
  audio.pumpEvents();
}

#include "Wire.h"
TwoWire Wire;
