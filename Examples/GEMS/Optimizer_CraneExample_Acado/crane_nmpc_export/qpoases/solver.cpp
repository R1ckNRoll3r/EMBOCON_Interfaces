/*
 *    This file was auto-generated by ACADO Code Generation Tool.
 *
 *    ACADO Code Generation tool is a sub-package of ACADO toolkit --
 *    A Toolkit for Automatic Control and Dynamic Optimization.
 *    Copyright (C) 2008 - 2013 by Boris Houska, Hans Joachim Ferreau,
 *    Milan Vukov and Rien Quirynen.
 *    Developed within the Optimization in Engineering Center (OPTEC) under
 *    supervision of Moritz Diehl. All rights reserved.
 *
 *    ACADO Toolkit is free software; you can redistribute it and/or
 *    modify it under the terms of the GNU Lesser General Public
 *    License as published by the Free Software Foundation; either
 *    version 3 of the License, or (at your option) any later version.
 *
 *    ACADO Toolkit is distributed in the hope that it will be useful,
 *    but WITHOUT ANY WARRANTY; without even the implied warranty of
 *    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 *    Lesser General Public License for more details.
 *
 *    You should have received a copy of the GNU Lesser General Public
 *    License along with ACADO Toolkit; if not, write to the Free Software
 *    Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301  USA
 *
 */


extern "C"{
#include "solver.hpp"
}
#include "INCLUDE/QProblem.hpp"


int logNWSR;

long solve( void )
{
  int nWSR = QPOASES_NWSRMAX;

  QProblem qp( 50,50 );
  returnValue retVal = qp.init( params.H,params.g,params.A,params.lb,params.ub,params.lbA,params.ubA, nWSR );

  qp.getPrimalSolution( vars.x );
  qp.getDualSolution( vars.y );


  logNWSR = nWSR;


  return (long) retVal;
}