when defined(trnsysLib):
  {.passL: trnsysLib.}
else:
  {.passL: r"C:/TRNSYS18/Exe/TRNDll64.lib".}

# ------------------------------------------------------------
# Kernel subroutines
# ------------------------------------------------------------
proc foundBadInput*(Input: ptr cint, Severity: cstring, Message: cstring, Sevlen: csize_t, Messlen: csize_t) {.cdecl, importc: "FOUNDBADINPUT".}
proc foundBadParameter*(Param: ptr cint, Severity: cstring, Message: cstring, Sevlen: csize_t, Messlen: csize_t) {.cdecl, importc: "FOUNDBADPARAMETER".}
proc initReportIntegral*(index: ptr cint, intName: cstring, instUnit: cstring, intUnit: cstring, LenName: csize_t, LenUnit: csize_t, LUnit2: csize_t) {.cdecl, importc: "INITREPORTINTEGRAL".}
proc initReportMinMax*(index: ptr cint, minmaxName: cstring, minmaxUnit: cstring, LenName: csize_t, LenUnit: csize_t) {.cdecl, importc: "INITREPORTMINMAX".}
proc initReportText*(index: ptr cint, txtName: cstring, txtVal: cstring, LenName: csize_t, LenVal: csize_t) {.cdecl, importc: "INITREPORTTEXT".}
proc initReportValue*(index: ptr cint, valName: cstring, valVal: ptr cdouble, valUnit: cstring, LenName: csize_t, LenUnit: csize_t) {.cdecl, importc: "INITREPORTVALUE".}
proc readNextChar*(lun: ptr cint): cint {.cdecl, importc: "READNEXTCHAR".}

proc setDesiredDiscreteControlState*(i, j: ptr cint) {.cdecl, importc: "SETDESIREDDISCRETECONTROLSTATE".}
proc setDynamicArrayInitialValue*(i: ptr cint, Value: ptr cdouble) {.cdecl, importc: "SETDYNAMICARRAYINITIALVALUE".}
proc setDynamicArrayValueThisIteration*(i: ptr cint, Value: ptr cdouble) {.cdecl, importc: "SETDYNAMICARRAYVALUETHISITERATION".}
proc setInputUnits*(i: ptr cint, s: cstring, len: csize_t) {.cdecl, importc: "SETINPUTUNITS".}
proc setIterationMode*(i: ptr cint) {.cdecl, importc: "SETITERATIONMODE".}
proc setNumberOfDerivatives*(i: ptr cint) {.cdecl, importc: "SETNUMBEROFDERIVATIVES".}
proc setNumberOfDiscreteControls*(i: ptr cint) {.cdecl, importc: "SETNUMBEROFDISCRETECONTROLS".}
proc setNumberOfInputs*(i: ptr cint) {.cdecl, importc: "SETNUMBEROFINPUTS".}
proc setNumberOfOutputs*(i: ptr cint) {.cdecl, importc: "SETNUMBEROFOUTPUTS".}
proc setNumberOfParameters*(i: ptr cint) {.cdecl, importc: "SETNUMBEROFPARAMETERS".}
proc setNumberOfReportVariables*(nInt, nMinMax, nVals, nText: ptr cint) {.cdecl, importc: "SETNUMBEROFREPORTVARIABLES".}
proc setNumberStoredVariables*(Nrequested_Static, Nrequested_Dynamic: ptr cint) {.cdecl, importc: "SETNUMBERSTOREDVARIABLES".}
proc setNumericalDerivative*(i: ptr cint, Value: ptr cdouble) {.cdecl, importc: "SETNUMERICALDERIVATIVE".}
proc setOutputUnits*(i: ptr cint, s: cstring, len: csize_t) {.cdecl, importc: "SETOUTPUTUNITS".}
proc setOutputValue*(i: ptr cint, Value: ptr cdouble) {.cdecl, importc: "SETOUTPUTVALUE".}
proc setStaticArrayValue*(i: ptr cint, Value: ptr cdouble) {.cdecl, importc: "SETSTATICARRAYVALUE".}
proc setTypeVersion*(i: ptr cint) {.cdecl, importc: "SETTYPEVERSION".}

proc errorFound*(): cint {.cdecl, importc: "TRNSYSFUNCTIONS_mp_ERRORFOUND".}
proc getConvergenceTolerance*(): cdouble {.cdecl, importc: "TRNSYSFUNCTIONS_mp_GETCONVERGENCETOLERANCE".}
proc getCurrentType*(): cint {.cdecl, importc: "TRNSYSFUNCTIONS_mp_GETCURRENTTYPE".}
proc getCurrentUnit*(): cint {.cdecl, importc: "TRNSYSFUNCTIONS_mp_GETCURRENTUNIT".}
proc getDeckFileName*(dck: cstring, len: csize_t): cstring {.cdecl, importc: "TRNSYSFUNCTIONS_mp_GETDECKFILENAME".}
proc getDynamicArrayValueLastTimestep*(i: ptr cint): cdouble {.cdecl, importc: "TRNSYSFUNCTIONS_mp_GETDYNAMICARRAYVALUELASTTIMESTEP".}
proc getFormat*(label: cstring, llen: csize_t, iunit, no: ptr cint): cstring {.cdecl, importc: "TRNSYSFUNCTIONS_mp_GETFORMAT".}
proc getInputValue*(i: ptr cint): cdouble {.cdecl, importc: "TRNSYSFUNCTIONS_mp_GETINPUTVALUE".}
proc getIsEndOfTimestep*(): cint {.cdecl, importc: "TRNSYSFUNCTIONS_mp_GETISENDOFTIMESTEP".}
proc getIsFirstCallOfSimulation*(): cint {.cdecl, importc: "TRNSYSFUNCTIONS_mp_GETISFIRSTCALLOFSIMULATION".}
proc getIsIncludedInSSR*(): cint {.cdecl, importc: "TRNSYSFUNCTIONS_mp_GETISINCLUDEDINSSR".}
proc getIsLastCallOfSimulation*(): cint {.cdecl, importc: "TRNSYSFUNCTIONS_mp_GETISLASTCALLOFSIMULATION".}
proc getIsReReadParameters*(): cint {.cdecl, importc: "TRNSYSFUNCTIONS_mp_GETISREREADPARAMETERS".}
proc getIsStartTime*(): cint {.cdecl, importc: "TRNSYSFUNCTIONS_mp_GETISSTARTTIME".}
proc getIsVersionSigningTime*(): cint {.cdecl, importc: "TRNSYSFUNCTIONS_mp_GETISVERSIONSIGNINGTIME".}
proc getLabel*(label: cstring, llen: csize_t, iunit, no: ptr cint): cstring {.cdecl, importc: "TRNSYSFUNCTIONS_mp_GETLABEL".}
proc getLUFileName*(name: cstring, llen: csize_t, lu: ptr cint): cstring {.cdecl, importc: "TRNSYSFUNCTIONS_mp_GETLUFILENAME".}
proc getMaxDescripLength*(): cint {.cdecl, importc: "TRNSYSFUNCTIONS_mp_GETMAXDESCRIPLENGTH".}
proc getMaxLabelLength*(): cint {.cdecl, importc: "TRNSYSFUNCTIONS_mp_GETMAXLABELLENGTH".}
proc getMaxPathLength*(): cint {.cdecl, importc: "TRNSYSFUNCTIONS_mp_GETMAXPATHLENGTH".}
proc getMinimumTimestep*(): cdouble {.cdecl, importc: "TRNSYSFUNCTIONS_mp_GETMINIMUMTIMESTEP".}
proc getNextAvailableLogicalUnit*(): cint {.cdecl, importc: "TRNSYSFUNCTIONS_mp_GETNEXTAVAILABLELOGICALUNIT".}
proc getNumberOfDerivatives*(): cint {.cdecl, importc: "TRNSYSFUNCTIONS_mp_GETNUMBEROFDERIVATIVES".}
proc getNumberOfInputs*(): cint {.cdecl, importc: "TRNSYSFUNCTIONS_mp_GETNUMBEROFINPUTS".}
proc getNumberOfLabels*(): cint {.cdecl, importc: "TRNSYSFUNCTIONS_mp_GETNUMBEROFLABELS".}
proc getNumberOfOutputs*(): cint {.cdecl, importc: "TRNSYSFUNCTIONS_mp_GETNUMBEROFOUTPUTS".}
proc getNumberOfParameters*(): cint {.cdecl, importc: "TRNSYSFUNCTIONS_mp_GETNUMBEROFPARAMETERS".}
proc getNumericalSolution*(i: ptr cint): cdouble {.cdecl, importc: "TRNSYSFUNCTIONS_mp_GETNUMERICALSOLUTION".}
proc getOutputValue*(i: ptr cint): cdouble {.cdecl, importc: "TRNSYSFUNCTIONS_mp_GETOUTPUTVALUE".}
proc getParameterValue*(i: ptr cint): cdouble {.cdecl, importc: "TRNSYSFUNCTIONS_mp_GETPARAMETERVALUE".}
proc getPreviousControlState*(i: ptr cint): cint {.cdecl, importc: "TRNSYSFUNCTIONS_mp_GETPREVIOUSCONTROLSTATE".}
proc getSimulationStartTime*(): cdouble {.cdecl, importc: "TRNSYSFUNCTIONS_mp_GETSIMULATIONSTARTTIME".}
proc getSimulationStopTime*(): cdouble {.cdecl, importc: "TRNSYSFUNCTIONS_mp_GETSIMULATIONSTOPTIME".}
proc getSimulationTime*(): cdouble {.cdecl, importc: "TRNSYSFUNCTIONS_mp_GETSIMULATIONTIME".}
proc getSimulationTimeStep*(): cdouble {.cdecl, importc: "TRNSYSFUNCTIONS_mp_GETSIMULATIONTIMESTEP".}
proc getStaticArrayValue*(i: ptr cint): cdouble {.cdecl, importc: "TRNSYSFUNCTIONS_mp_GETSTATICARRAYVALUE".}
proc getTimestepIteration*(): cint {.cdecl, importc: "TRNSYSFUNCTIONS_mp_GETTIMESTEPITERATION".}
proc getTrnsysInputFileDir*(dir: cstring, len: csize_t): cstring {.cdecl, importc: "TRNSYFUNCTIONS_mp_GETTRNSYSINPUTFILEDIR".}  # note: typo in original symbol
proc getTrnsysRootDir*(dir: cstring, len: csize_t): cstring {.cdecl, importc: "TRNSYSFUNCTIONS_mp_GETTRNSYSROOTDIR".}

proc updateReportIntegral*(index: ptr cint, intVal: ptr cdouble) {.cdecl, importc: "UPDATEREPORTINTEGRAL".}
proc updateReportMinMax*(index: ptr cint, newVal: ptr cdouble) {.cdecl, importc: "UPDATEREPORTMINMAX".}
proc typeck*(IOPT: ptr cint, info: ptr cint, ni, np, nd: ptr cint) {.cdecl, importc: "TYPECK".}

proc getListingFileLogicalUnit*(): cint {.cdecl, importc: "TRNSYSFUNCTIONS_mp_GETLISTINGFILELOGICALUNIT".}
proc getLUFileNameCpp*(i: ptr cint, LUfilePath: cstring, pathLen: csize_t): cint {.cdecl, importc: "TRNSYSFUNCTIONS_mp_GETLUFILENAME_CPP".}
proc logicalUnitIsOpen*(i: ptr cint): cint {.cdecl, importc: "TRNSYSFUNCTIONS_mp_LOGICALUNITISOPEN".}
proc closeFileIVF*(lu: ptr cint): cint {.cdecl, importc: "TRNSYSFUNCTIONS_mp_CLOSEFILEIVF".}

# ------------------------------------------------------------
# TRNSYS subroutines
# ------------------------------------------------------------
proc fluidProperties*(units: cstring, prop: ptr cdouble, nref, itype, iflagr: ptr cint, len: csize_t) {.cdecl, importc: "FLUID_PROPERTIES".}
proc getHorizontalRadiation*(Time: ptr cdouble, mode_rad, mode_shape: ptr cint, rad_input: ptr cdouble, rhog, slope, azimuth: ptr cdouble, mode_track, mode_tilt: ptr cint, latitude, alt, shift: ptr cdouble, i_solartime: ptr cint, SolConst, td1, td2: ptr cdouble, solar: ptr cdouble, ierror_rad: ptr cint) {.cdecl, importc: "GETHORIZONTALRADIATION".}
proc getTiltedRadiation*(Time, rhog, slope, azimuth: ptr cdouble, mode_track, mode_tilt: ptr cint, alt, SolConst: ptr cdouble, solar: ptr cdouble, ierror_rad: ptr cint) {.cdecl, importc: "GETTILTEDRADIATION".}
proc interpolateData*(LUdd: ptr cint, NINDdd: ptr cint, NXdd: ptr cint, NYdd: ptr cint, Xdd: ptr cdouble, Ydd: ptr cdouble) {.cdecl, importc: "INTERPOLATEDATA".}
proc messages*(errorCode: ptr cint, message, severity: cstring, unitNo, typeNo: ptr cint, n, m: csize_t) {.cdecl, importc: "MESSAGES".}
proc moistAirProperties*(CurUnit, CurType, iunits, mode, wbmd: ptr cint, psydat: ptr cdouble, emode, status: ptr cint) {.cdecl, importc: "MOISTAIRPROPERTIES".}
proc solveDiffEq*(aa, bb, Ti, Tf, Tbar: ptr cdouble) {.cdecl, importc: "SOLVEDIFFEQ".}
proc steamProperties*(units: cstring, prop: ptr cdouble, itype, ierrst: ptr cint, len: csize_t) {.cdecl, importc: "STEAM_PROPERTIES".}
