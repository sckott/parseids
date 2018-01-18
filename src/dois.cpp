#include <Rcpp.h>
using namespace Rcpp;

// [[Rcpp::depends(piton)]]
#include <pegtl.hpp>
using namespace tao::TAOCPP_PEGTL_NAMESPACE;

namespace doi
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
  : seq< plus< identifier_other >, space >
{};

struct txtspace
  : sor< 
    // seq< plus< alpha >, space, opt< seq <  > > >,
    rep_min< 1, alphaSpace >,
    seq< plus< space > >
  >
{};

// rule to match doi prefix
struct doiAll
  : seq<
    ::string< '1', '0' >,
    ::string< '.' >,
    rep_min_max< 4, 9, digit >,
    forwardSlash,
    txtany
  >{};
  
// doi_url rule
struct doi_url
  : seq<
    opt<
      sor<
        ::string< 'h', 't', 't', 'p', ':', '/', '/' >,
        ::string< 'h', 't', 't', 'p', 's', ':', '/', '/' >
      >
    >,
    ::string< 'd', 'o', 'i', '.', 'o', 'r', 'g' >,
    forwardSlash
  >{};
  
// Parsing grammar
struct grammar
  : star< opt<txtspace>, opt<doi_url>, doiAll, opt<spacetxt> >
{};

template< typename Rule >
struct action
  : nothing< Rule >
{};

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
    x[i] = trimws(x[i], "both");
    memory_input<> din(x[i], "moot");
    parse< doi::grammar, doi::action >( din, z );
    y[i] = z;
  }
  return y;
}
