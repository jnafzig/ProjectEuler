#include "mex.h"

/*
 * xtimesy.c - example found in API guide
 *
 * multiplies an input scalar times an input matrix and outputs a
 * matrix 
 *
 * This is a MEX-file for MATLAB.
 * Copyright 1984-2011 The MathWorks, Inc.
 */
/* $Revision: 1.10.6.4 $ */

void xtimesy(double *xr, double *xi, double *yr, double *yi,
        double *zr, double *zi, size_t m)
{
  mwSize i,j;
  
  for (i=0; i<m; i++) {
    for (j=0; j<i; j++) {
      *(zr+i+m*j) = *(xr+j) * *(yr+i) - *(xi+j) * *(yi+i);
      *(zi+i+m*j) = *(xr+j) * *(yi+i) + *(xi+j) * *(yr+i);
      *(zr+m*i+j) = *(zr+i+m*j);
      *(zi+m*i+j) = *(zi+i+m*j);
    }
    *(zr+i+m*i) = *(xr+i) * *(yr+i) - *(xi+i) * *(yi+i);
    *(zi+i+m*i) = *(xr+i) * *(yi+i) + *(xi+i) * *(yr+i);
  }
}

/* the gateway function */
void mexFunction( int nlhs, mxArray *plhs[],
                  int nrhs, const mxArray *prhs[])
{
  int64_t N
  
  /*  check for proper number of arguments */
  /* NOTE: You do not need an else statement when using mexErrMsgIdAndTxt
     within an if statement, because it will never get to the else
     statement if mexErrMsgIdAndTxt is executed. (mexErrMsgIdAndTxt breaks you out of
     the MEX-file) */
  if(nrhs!=1) 
    mexErrMsgIdAndTxt( "resp_mex:invalidNumInputs",
            "One input required.");
  if(nlhs!=1) 
    mexErrMsgIdAndTxt( "resp_mex:invalidNumOutputs",
            "One output required.");
  
  if (mxGetNumberOfElements(prhs[0]) == 1) {
    scalar = mxGetScalar(prhs[0]);
  } else {
    mexErrMsgTxt("Integer scalar is not of size == [1 1].\n");
  }
  
  /*  set the output pointer to the output matrix */
  plhs[0] = mxCreateDoubleMatrix( (mwSize)mrowsx, (mwSize)mrowsy, mxCOMPLEX);
  
  /*  create a C pointer to a copy of the output matrix */
  zr = mxGetPr(plhs[0]);
  zi = mxGetPi(plhs[0]);
  
  /*  call the C subroutine */
  xtimesy(xr,xi,yr,yi,zr,zi,mrowsx);
  
}
