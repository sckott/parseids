#include <Rcpp.h>
using namespace Rcpp;

// [[Rcpp::depends(piton)]]
#include <pegtl.hpp>
using namespace tao::TAOCPP_PEGTL_NAMESPACE;

// namespace doisplit
// {

// struct name
//   : plus< alpha >
// {};

// // rule to match a forward slash
// struct forwardSlash
//   : one<'/'>
// {};

// // any symbols
// struct txtany
//   : sor<
//     seq< plus< tao::TAOCPP_PEGTL_NAMESPACE::any > >,
//     not_one< '\r', '\n', ' ' >
//   >
// {};

// struct spacetxt
//   : sor< 
//     seq< space >, 
//     seq< space, plus< alpha > >
//   >
// {};

// struct alphaSpace
//   : seq< plus< alpha >, space >
// {};

// struct txtspace
//   : sor< 
//     // seq< plus< alpha >, space, opt< seq <  > > >,
//     rep_min< 1, alphaSpace >,
//     seq< plus< space > >
//   >
// {};

// // rule to match doi prefix
// struct doiPrefix
//   : seq<
//     ::string< '1', '0' >,
//     ::string< '.' >,
//     rep_min_max< 4, 9, digit >
//   >{};

// // Parsing grammar
// struct grammar
//   : star< doiPrefix >
// {};

// template< typename Rule >
// struct action
//   : nothing< Rule >
// {};

// template<>
// struct action< doiPrefix >
// {
//   template< typename Input >
//   static void apply( const Input& in, std::vector<std::string>& v)
//   {
//     v.push_back(in.string());
//   }
// };

// }  // namespace doisplit

// //[[Rcpp::export]]
// CharacterVector doi_split_many(std::string x){
//   CharacterVector z;
//   memory_input<> din(x, "moot");
//   parse< doisplit::grammar, doisplit::action >( din, z );
//   return z;
// }
