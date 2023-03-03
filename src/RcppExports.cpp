// Generated by using Rcpp::compileAttributes() -> do not edit by hand
// Generator token: 10BE3573-1514-4C36-9D1C-5A225CD40393

#include <Rcpp.h>

using namespace Rcpp;

#ifdef RCPP_USE_GLOBAL_ROSTREAM
Rcpp::Rostream<true>&  Rcpp::Rcout = Rcpp::Rcpp_cout_get();
Rcpp::Rostream<false>& Rcpp::Rcerr = Rcpp::Rcpp_cerr_get();
#endif

// cpp_cumsum2d
NumericMatrix cpp_cumsum2d(NumericMatrix indat, NumericVector threshold, String comparator, bool includeLow, bool includeHigh);
RcppExport SEXP _harpCore_cpp_cumsum2d(SEXP indatSEXP, SEXP thresholdSEXP, SEXP comparatorSEXP, SEXP includeLowSEXP, SEXP includeHighSEXP) {
BEGIN_RCPP
    Rcpp::RObject rcpp_result_gen;
    Rcpp::RNGScope rcpp_rngScope_gen;
    Rcpp::traits::input_parameter< NumericMatrix >::type indat(indatSEXP);
    Rcpp::traits::input_parameter< NumericVector >::type threshold(thresholdSEXP);
    Rcpp::traits::input_parameter< String >::type comparator(comparatorSEXP);
    Rcpp::traits::input_parameter< bool >::type includeLow(includeLowSEXP);
    Rcpp::traits::input_parameter< bool >::type includeHigh(includeHighSEXP);
    rcpp_result_gen = Rcpp::wrap(cpp_cumsum2d(indat, threshold, comparator, includeLow, includeHigh));
    return rcpp_result_gen;
END_RCPP
}
// cpp_nbhd_smooth_cumsum
NumericMatrix cpp_nbhd_smooth_cumsum(NumericMatrix indat, int rad, String boundaryCondition);
RcppExport SEXP _harpCore_cpp_nbhd_smooth_cumsum(SEXP indatSEXP, SEXP radSEXP, SEXP boundaryConditionSEXP) {
BEGIN_RCPP
    Rcpp::RObject rcpp_result_gen;
    Rcpp::RNGScope rcpp_rngScope_gen;
    Rcpp::traits::input_parameter< NumericMatrix >::type indat(indatSEXP);
    Rcpp::traits::input_parameter< int >::type rad(radSEXP);
    Rcpp::traits::input_parameter< String >::type boundaryCondition(boundaryConditionSEXP);
    rcpp_result_gen = Rcpp::wrap(cpp_nbhd_smooth_cumsum(indat, rad, boundaryCondition));
    return rcpp_result_gen;
END_RCPP
}
// cpp_nbhd_smooth
NumericMatrix cpp_nbhd_smooth(NumericMatrix x, int rad, NumericVector threshold, String comparator, bool includeLow, bool includeHigh, String boundaryCondition);
RcppExport SEXP _harpCore_cpp_nbhd_smooth(SEXP xSEXP, SEXP radSEXP, SEXP thresholdSEXP, SEXP comparatorSEXP, SEXP includeLowSEXP, SEXP includeHighSEXP, SEXP boundaryConditionSEXP) {
BEGIN_RCPP
    Rcpp::RObject rcpp_result_gen;
    Rcpp::RNGScope rcpp_rngScope_gen;
    Rcpp::traits::input_parameter< NumericMatrix >::type x(xSEXP);
    Rcpp::traits::input_parameter< int >::type rad(radSEXP);
    Rcpp::traits::input_parameter< NumericVector >::type threshold(thresholdSEXP);
    Rcpp::traits::input_parameter< String >::type comparator(comparatorSEXP);
    Rcpp::traits::input_parameter< bool >::type includeLow(includeLowSEXP);
    Rcpp::traits::input_parameter< bool >::type includeHigh(includeHighSEXP);
    Rcpp::traits::input_parameter< String >::type boundaryCondition(boundaryConditionSEXP);
    rcpp_result_gen = Rcpp::wrap(cpp_nbhd_smooth(x, rad, threshold, comparator, includeLow, includeHigh, boundaryCondition));
    return rcpp_result_gen;
END_RCPP
}

static const R_CallMethodDef CallEntries[] = {
    {"_harpCore_cpp_cumsum2d", (DL_FUNC) &_harpCore_cpp_cumsum2d, 5},
    {"_harpCore_cpp_nbhd_smooth_cumsum", (DL_FUNC) &_harpCore_cpp_nbhd_smooth_cumsum, 3},
    {"_harpCore_cpp_nbhd_smooth", (DL_FUNC) &_harpCore_cpp_nbhd_smooth, 7},
    {NULL, NULL, 0}
};

RcppExport void R_init_harpCore(DllInfo *dll) {
    R_registerRoutines(dll, NULL, CallEntries, NULL, NULL);
    R_useDynamicSymbols(dll, FALSE);
}