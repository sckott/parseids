#include <Rcpp.h>
using namespace Rcpp;

// [[Rcpp::depends(piton)]]
#include <pegtl.hpp>
using namespace tao::TAOCPP_PEGTL_NAMESPACE;

namespace doisuffixes
{

struct name
  : plus< alpha >
{};

// rule to match a forward slash
struct forwardSlash
  : one<'/'>
{};
    
// any symbols
struct txtany
  : sor<
    seq< plus< tao::TAOCPP_PEGTL_NAMESPACE::any > >,
    not_one< '\r', '\n', ' ' >
  >
{};

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

// rule to match doi prefix
struct doiPrefix
  : seq<
    ::string< '1', '0' >,
    ::string< '.' >,
    rep_min_max< 4, 9, digit >
  >{};

// rule to match doi suffix
struct doiSuffix
  : seq<
    txtany
  >{};
  
// Parsing grammar
struct grammar
  : star< doiPrefix, forwardSlash, doiSuffix, opt<spacetxt> >
{};

template< typename Rule >
struct action
  : nothing< Rule >
{};

template<>
struct action< doiSuffix >
{
  template< typename Input >
  static void apply( const Input& in, std::string& v)
  {
    v = in.string();
  }
};
}  // namespace doisuffixes

//[[Rcpp::export]]
CharacterVector doi_suffixes_many(CharacterVector x){
  const int n = x.size();
  CharacterVector y(n);
  for (int i=0; i < n; ++i) {
    std::string z;
    memory_input<> din(x[i], "moot");
    parse< doisuffixes::grammar, doisuffixes::action >( din, z );
    y[i] = z;
  }
  return y;
}
