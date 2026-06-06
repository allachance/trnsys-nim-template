## TRNSYS Nim Component Template
##
## This file is a starter template for building TRNSYS components in Nim.
## It demonstrates the required TRNSYS structure, DLL export pattern,
## and a minimal working implementation.
##
## Use it as a starting point by replacing the example computation with your
## component logic.
##
## Version:
## - 2026-06-01 - A. Lachance: Initial implementation

import bindings/trnsys

proc TYPE9999() {.cdecl, exportc: "TYPE9999", dynlib.} =
  ## TRNSYS Type9999 constant-value template.
  ## This Type forwards each input directly to the matching output,
  ## so each output represents that constant value at runtime.
  ## Mapping: `output[i] = input[i]`.
  var
    time, timestep, inputValue: cdouble
    currentUnit, currentType: cint
    inputCount, inputIndex: cint

  # --------------------------------------------------------
  # VARIABLES
  # --------------------------------------------------------
  time = getSimulationTime()
  timestep = getSimulationTimeStep()
  currentUnit = getCurrentUnit()
  currentType = getCurrentType()

  # --------------------------------------------------------
  # VERSION
  # --------------------------------------------------------
  if getIsVersionSigningTime() != 0:
    var v: cint = 17
    setTypeVersion(addr v)
    return

  # --------------------------------------------------------
  # INITIALIZATION
  # --------------------------------------------------------
  if getIsFirstCallOfSimulation() != 0:
    inputCount = getNumberOfInputs()

    var npar: cint = 0
    var nin: cint = inputCount
    var nder: cint = 0
    var nout: cint = inputCount
    var mode: cint = 1
    var staticStore: cint = 0
    var dynamicStore: cint = 0

    setNumberOfParameters(addr npar)
    setNumberOfInputs(addr nin)
    setNumberOfDerivatives(addr nder)
    setNumberOfOutputs(addr nout)
    setIterationMode(addr mode)
    setNumberStoredVariables(addr staticStore, addr dynamicStore)
    return

  # --------------------------------------------------------
  # START OF SIMULATION
  # --------------------------------------------------------
  if getIsStartTime() != 0:
    let zero: cdouble = 0.0
    inputCount = getNumberOfInputs()
    for i in 1 .. inputCount:
      var idx = i
      setOutputValue(addr idx, addr zero)
    return

  # --------------------------------------------------------
  # END OF SIMULATION
  # --------------------------------------------------------
  if getIsLastCallOfSimulation() != 0:
    return

  # --------------------------------------------------------
  # END OF TIMESTEP
  # --------------------------------------------------------
  if getIsEndOfTimestep() != 0:
    return

  #---------------------------------------------------------
  # RE-READ PARAMETERS
  #---------------------------------------------------------
  if getIsReReadParameters() != 0:
    return

  # -------------------------------------------------------
  # MAIN CODE
  # --------------------------------------------------------
  inputCount = getNumberOfInputs()

  for i in 1 .. inputCount:
    var idx = i
    inputValue = getInputValue(addr idx)
    setOutputValue(addr idx, addr inputValue)
