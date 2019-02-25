/*
 * Academic License - for use in teaching, academic research, and meeting
 * course requirements at degree granting institutions only.  Not for
 * government, commercial, or other organizational use.
 * File: add.c
 *
 * MATLAB Coder version            : 4.1
 * C/C++ source code generated on  : 18-Jan-2019 12:38:09
 */

/* Include Files */
#include <math.h>
#include "add.h"

/* Function Declarations */
static double rt_roundd_snf(double u);

/* Function Definitions */

/*
 * Arguments    : double u
 * Return Type  : double
 */
static double rt_roundd_snf(double u)
{
  double y;
  if (fabs(u) < 4.503599627370496E+15) {
    if (u >= 0.5) {
      y = floor(u + 0.5);
    } else if (u > -0.5) {
      y = u * 0.0;
    } else {
      y = ceil(u - 0.5);
    }
  } else {
    y = u;
  }

  return y;
}

/*
 * Arguments    : short a
 *                double b
 * Return Type  : short
 */
short add(short a, double b)
{
  short y;
  double d0;
  d0 = rt_roundd_snf((double)a + b);
  if (d0 < 32768.0) {
    if (d0 >= -32768.0) {
      y = (short)d0;
    } else {
      y = MIN_int16_T;
    }
  } else if (d0 >= 32768.0) {
    y = MAX_int16_T;
  } else {
    y = 0;
  }

  return y;
}

/*
 * File trailer for add.c
 *
 * [EOF]
 */
