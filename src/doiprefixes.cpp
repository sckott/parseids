#include <Rcpp.h>
using namespace Rcpp;

// [[Rcpp::depends(piton)]]
#include <pegtl.hpp>
using namespace tao::TAOCPP_PEGTL_NAMESPACE;

namespace doiprefixes
{

struct name
  : plus< alpha >
{};

// rule to match doi prefix
struct doiPrefix
  : seq<
    ::string< '1', '0' >,
    ::string< '.' >,
    rep_min_max< 4, 9, digit >
  >{};

// Parsing grammar
struct grammar
  : star< doiPrefix >
{};

template< typename Rule >
struct action
  : nothing< Rule >
{};

template<>
struct action< doiPrefix >
{
  template< typename Input >
  static void apply( const Input& in, std::string& v)
  {
    v = in.string();
  }
};
}  // namespace doiprefixes

//[[Rcpp::export]]
CharacterVector doi_prefixes_many(CharacterVector x){
  const int n = x.size();
  CharacterVector y(n);
  for (int i=0; i < n; ++i) {
    std::string z;
    memory_input<> din(x[i], "moot");
    parse< doiprefixes::grammar, doiprefixes::action >( din, z );
    y[i] = z;
  }
  return y;
}
