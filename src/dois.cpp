#include <Rcpp.h>
using namespace Rcpp;

// [[Rcpp::depends(piton)]]
#include <pegtl.hpp>
using namespace tao::TAOCPP_PEGTL_NAMESPACE;

namespace doi
{

// Parsing rule that matches a non-empty sequence of
// alphabetic ascii-characters with greedy-matching.

struct name
  : plus< alpha >
{};

// rule to match a forward slash
struct forwardSlash
  : one<'/'>
{};
    
// any symbols
struct txtany
  // : seq< plus< tao::TAOCPP_PEGTL_NAMESPACE::any > >
  : sor<
    seq< plus< tao::TAOCPP_PEGTL_NAMESPACE::any > >,
    not_one< '\r', '\n', ' ' >
  >
{};

// any text, digit, or symbol, not spaces
// struct txtanynotspaces
//   : sor<
//     seq< plus< alpha > >,
//     seq< plus< digit > >,
//     seq< plus< alpha > >
//   >
// {};

struct spacetxt
  : sor< 
    seq< space >, 
    seq< space, plus< alpha > >
  >
{};

struct alphaSpace
  : seq< plus< alpha >, space >
{};

struct txtspace
  : sor< 
    // seq< plus< alpha >, space, opt< seq <  > > >,
    rep_min< 1, alphaSpace >,
    seq< plus< space > >
  >
{};

// struct doiSome
//   : seq< doiPrefix, forwardSlash >
// {};

// rule to match doi prefix
struct doiAll
  : seq<
    ::string< '1', '0' >,
    ::string< '.' >,
    rep_min_max< 4, 9, digit >,
    forwardSlash,
    txtany
  >{};
  
// Parsing grammar
struct grammar
  : star< opt<txtspace>, doiAll, opt<spacetxt> >
{};

// Class template for user-defined actions that does
// nothing by default.

template< typename Rule >
struct action
  : nothing< Rule >
{};

// Specialisation of the user-defined action to do
// something when the 'name' rule succeeds; is called
// with the portion of the input that matched the rule.

template<>
struct action< doiAll >
{
  template< typename Input >
  static void apply( const Input& in, std::string& v)
  {
    v = in.string();
  }
};

}  // namespace doi

//[[Rcpp::export]]
std::string doi_parse(std::string x){
  std::string out;
  memory_input<> din(x, "moot");
  parse< doi::grammar, doi::action >( din, out );
  return out;
}

//[[Rcpp::export]]
CharacterVector doi_parse_many(CharacterVector x){
  const int n = x.size();
  CharacterVector y(n);
  for (int i=0; i < n; ++i) {
    std::string z;
    memory_input<> din(x[i], "moot");
    parse< doi::grammar, doi::action >( din, z );
    y[i] = z;
  }
  return y;
}
