#include <Rcpp.h>
using namespace Rcpp;

// [[Rcpp::plugins(cpp11)]]
#include <string>
#include <regex>

//[[Rcpp::export]]
std::string replace_all_symbols(std::string x){
  x.erase(std::remove_if(x.begin(), x.end(), std::ptr_fun(::ispunct)), x.end());
  return x;
};


// std::string replace_specific_symbols(std::string x){
//   char chars[] = "()-";
//   for (unsigned int i = 0; i < std::strlen(chars); ++i) {
//     x.erase(std::remove(x.begin(), x.end(), chars[i]), x.end());
//   };
//   return x;
// };

// std::string rep_specific_symbols(std::string m){
//   const char chars[] = "()-";
//   for (unsigned int i = 0; i < std::strlen(chars); ++i) {
//     m.erase(std::remove(m.begin(), m.end(), chars[i]), m.end());
//   };
//   return m;
// };

//[[Rcpp::export]]
std::string replace_specific_symbols(std::string const& x){
  std::string output = x;
  output = std::regex_replace(output, std::regex("[><*{}&%$#@!|^]"), "");
  return output;
};
