/*
 * Academic License - for use in teaching, academic research, and meeting
 * course requirements at degree granting institutions only.  Not for
 * government, commercial, or other organizational use.
 * File: _coder_add_api.h
 *
 * MATLAB Coder version            : 4.1
 * C/C++ source code generated on  : 18-Jan-2019 12:38:09
 */

#ifndef _CODER_ADD_API_H
#define _CODER_ADD_API_H

/* Include Files */
#include "tmwtypes.h"
#include "mex.h"
#include "emlrt.h"
#include <stddef.h>
#include <stdlib.h>
#include "_coder_add_api.h"

/* Variable Declarations */
extern emlrtCTX emlrtRootTLSGlobal;
extern emlrtContext emlrtContextGlobal;

/* Function Declarations */
extern int16_T add(int16_T a, real_T b);
extern void add_api(const mxArray * const prhs[2], int32_T nlhs, const mxArray
                    *plhs[1]);
extern void add_atexit(void);
extern void add_initialize(void);
extern void add_terminate(void);
extern void add_xil_terminate(void);

#endif

/*
 * File trailer for _coder_add_api.h
 *
 * [EOF]
 */
